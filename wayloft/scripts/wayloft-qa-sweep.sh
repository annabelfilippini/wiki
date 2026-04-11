#!/usr/bin/env bash
# wayloft-qa-sweep.sh — runtime health sweep for Wayloft
#
# Runs three checks (Supabase, Vercel, live site), writes a finding to
# wiki/wayloft/findings/, updates wiki/wayloft/state/last-sweep.json,
# alerts via Telegram on urgent, and pushes the wiki repo.
#
# Invoked by OpenClaw cron on the Hetzner VPS. Also runnable manually
# from a laptop with the wiki repo checked out.
#
# Env expected (load from /opt/wayloft/.env on VPS, apps/web/.env.local on laptop):
#   NEXT_PUBLIC_SUPABASE_URL
#   SUPABASE_SERVICE_ROLE_KEY
#   VERCEL_TOKEN                (optional — check is skipped if missing)
#   WAYLOFT_LIVE_URL            (default: https://wayloft.app)
#   TELEGRAM_BOT_TOKEN          (optional — no alert fired if missing)
#   TELEGRAM_CHAT_ID            (optional — no alert fired if missing)
#   WAYLOFT_ENV_FILE            (override env file path, default: /opt/wayloft/.env)

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WIKI_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
WAYLOFT_DIR="$WIKI_ROOT/wayloft"
FINDINGS_DIR="$WAYLOFT_DIR/findings"
STATE_FILE="$WAYLOFT_DIR/state/last-sweep.json"

# -- Load env ---------------------------------------------------------------
ENV_FILE="${WAYLOFT_ENV_FILE:-/opt/wayloft/.env}"
if [ -f "$ENV_FILE" ]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
else
  echo "ERROR: env file not found at $ENV_FILE" >&2
  exit 1
fi

WAYLOFT_LIVE_URL="${WAYLOFT_LIVE_URL:-https://wayloft.app}"

if [ -z "${NEXT_PUBLIC_SUPABASE_URL:-}" ] || [ -z "${SUPABASE_SERVICE_ROLE_KEY:-}" ]; then
  echo "ERROR: Supabase env vars missing from $ENV_FILE" >&2
  exit 1
fi

# -- Timestamps -------------------------------------------------------------
RAN_AT="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
TS_FILENAME="$(date -u +%Y-%m-%d-%H%M)"
FINDING_FILE="$FINDINGS_DIR/${TS_FILENAME}-qa-sweep.md"

# -- Check A: Supabase ------------------------------------------------------
SB_TMP="$(mktemp)"
SB_METRICS="$(curl -sS -o "$SB_TMP" -w "%{http_code}|%{time_total}|%{size_download}" \
  -H "apikey: $SUPABASE_SERVICE_ROLE_KEY" \
  -H "Authorization: Bearer $SUPABASE_SERVICE_ROLE_KEY" \
  "$NEXT_PUBLIC_SUPABASE_URL/rest/v1/upcoming_flights?select=*&limit=1" 2>/dev/null || echo "000|0|0")"
SB_HTTP="$(echo "$SB_METRICS" | cut -d'|' -f1)"
SB_TIME_S="$(echo "$SB_METRICS" | cut -d'|' -f2)"
SB_MS="$(awk -v t="$SB_TIME_S" 'BEGIN{printf "%d", t*1000}')"
if [ "$SB_HTTP" = "200" ]; then
  SB_STATUS="ok"
else
  SB_STATUS="urgent"
fi
rm -f "$SB_TMP"

# -- Check B: Vercel --------------------------------------------------------
if [ -n "${VERCEL_TOKEN:-}" ]; then
  VC_TMP="$(mktemp)"
  VC_METRICS="$(curl -sS -o "$VC_TMP" -w "%{http_code}|%{time_total}" \
    -H "Authorization: Bearer $VERCEL_TOKEN" \
    "https://api.vercel.com/v6/deployments?limit=1&target=production" 2>/dev/null || echo "000|0")"
  VC_HTTP="$(echo "$VC_METRICS" | cut -d'|' -f1)"
  VC_TIME_S="$(echo "$VC_METRICS" | cut -d'|' -f2)"
  VC_MS="$(awk -v t="$VC_TIME_S" 'BEGIN{printf "%d", t*1000}')"
  if [ "$VC_HTTP" = "200" ]; then
    VC_DEPLOY_STATE="$(jq -r '.deployments[0].state // "unknown"' "$VC_TMP" 2>/dev/null || echo "unknown")"
    VC_DEPLOY_ID="$(jq -r '.deployments[0].uid // "unknown"' "$VC_TMP" 2>/dev/null || echo "unknown")"
    case "$VC_DEPLOY_STATE" in
      READY) VC_STATUS="ok" ;;
      ERROR) VC_STATUS="urgent" ;;
      *)     VC_STATUS="warning" ;;
    esac
  else
    VC_STATUS="warning"
    VC_DEPLOY_STATE="unknown"
    VC_DEPLOY_ID="unknown"
  fi
  rm -f "$VC_TMP"
else
  VC_STATUS="skipped"
  VC_HTTP="0"
  VC_MS="0"
  VC_DEPLOY_STATE="skipped"
  VC_DEPLOY_ID="skipped"
fi

# -- Check C: Live site -----------------------------------------------------
LS_TMP="$(mktemp)"
LS_METRICS="$(curl -sS -o "$LS_TMP" -w "%{http_code}|%{time_total}|%{size_download}" \
  "$WAYLOFT_LIVE_URL" 2>/dev/null || echo "000|0|0")"
LS_HTTP="$(echo "$LS_METRICS" | cut -d'|' -f1)"
LS_TIME_S="$(echo "$LS_METRICS" | cut -d'|' -f2)"
LS_SIZE="$(echo "$LS_METRICS" | cut -d'|' -f3)"
LS_MS="$(awk -v t="$LS_TIME_S" 'BEGIN{printf "%d", t*1000}')"
if grep -qi "wayloft" "$LS_TMP" 2>/dev/null; then
  LS_MARKER="yes"
else
  LS_MARKER="no"
fi
if [ "$LS_HTTP" = "200" ] && [ "$LS_MARKER" = "yes" ]; then
  LS_STATUS="ok"
else
  LS_STATUS="urgent"
fi
rm -f "$LS_TMP"

# -- Determine severity -----------------------------------------------------
SEVERITY="info"
for s in "$SB_STATUS" "$VC_STATUS" "$LS_STATUS"; do
  case "$s" in
    urgent)
      SEVERITY="urgent"
      ;;
    warning|skipped)
      if [ "$SEVERITY" != "urgent" ]; then
        SEVERITY="warning"
      fi
      ;;
  esac
done

# -- Read prior state for diff ----------------------------------------------
PRIOR_SEVERITY="none"
PRIOR_SB_MS="n/a"
PRIOR_VC_STATE="n/a"
PRIOR_LS_MS="n/a"
if [ -f "$STATE_FILE" ]; then
  PRIOR_SEVERITY="$(jq -r '.last_severity // "none"' "$STATE_FILE" 2>/dev/null || echo "none")"
  PRIOR_SB_MS="$(jq -r '.supabase_response_ms // "n/a"' "$STATE_FILE" 2>/dev/null || echo "n/a")"
  PRIOR_VC_STATE="$(jq -r '.vercel_last_deploy_status // "n/a"' "$STATE_FILE" 2>/dev/null || echo "n/a")"
  PRIOR_LS_MS="$(jq -r '.live_site_response_ms // "n/a"' "$STATE_FILE" 2>/dev/null || echo "n/a")"
fi

# -- Telegram alert if urgent -----------------------------------------------
ALERTED="false"
ALERT_NOTE=""
if [ "$SEVERITY" = "urgent" ]; then
  if [ -n "${TELEGRAM_BOT_TOKEN:-}" ] && [ -n "${TELEGRAM_CHAT_ID:-}" ]; then
    ALERT_MSG="🚨 Wayloft QA sweep URGENT — SB=${SB_STATUS} VC=${VC_STATUS} LS=${LS_STATUS}. See wayloft/findings/${TS_FILENAME}-qa-sweep.md"
    if curl -sS -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
        --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
        --data-urlencode "text=${ALERT_MSG}" > /dev/null 2>&1; then
      ALERTED="true"
    else
      ALERT_NOTE="Telegram send failed — alert not delivered."
    fi
  else
    ALERT_NOTE="Urgent finding but Telegram creds missing (TELEGRAM_BOT_TOKEN / TELEGRAM_CHAT_ID) — no alert fired."
  fi
fi

# -- Write finding markdown -------------------------------------------------
{
  echo "---"
  echo "type: qa-sweep"
  echo "ran_at: ${RAN_AT}"
  echo "runner: wayloft-qa-sweep-vps"
  echo "severity: ${SEVERITY}"
  echo "alerted: ${ALERTED}"
  echo "---"
  echo ""
  echo "# Wayloft QA Sweep — ${RAN_AT}"
  echo ""
  echo "Automated sweep from OpenClaw on Hetzner VPS."
  echo ""
  echo "## Checks"
  echo ""
  echo "### Supabase"
  echo "- **Status:** ${SB_STATUS}"
  echo "- **HTTP:** ${SB_HTTP}"
  echo "- **Response time:** ${SB_MS}ms"
  echo ""
  echo "### Vercel"
  echo "- **Status:** ${VC_STATUS}"
  echo "- **HTTP:** ${VC_HTTP}"
  echo "- **Response time:** ${VC_MS}ms"
  echo "- **Last deploy:** ${VC_DEPLOY_STATE}"
  echo "- **Deploy ID:** ${VC_DEPLOY_ID}"
  echo ""
  echo "### Live site"
  echo "- **Status:** ${LS_STATUS}"
  echo "- **URL:** ${WAYLOFT_LIVE_URL}"
  echo "- **HTTP:** ${LS_HTTP}"
  echo "- **Response time:** ${LS_MS}ms"
  echo "- **Body size:** ${LS_SIZE} bytes"
  echo "- **Marker found:** ${LS_MARKER}"
  echo ""
  echo "## Diff vs last sweep"
  echo "- **Prior severity:** ${PRIOR_SEVERITY} → ${SEVERITY}"
  echo "- **Supabase:** ${PRIOR_SB_MS}ms → ${SB_MS}ms"
  echo "- **Vercel deploy:** ${PRIOR_VC_STATE} → ${VC_DEPLOY_STATE}"
  echo "- **Live site:** ${PRIOR_LS_MS}ms → ${LS_MS}ms"
  if [ -n "$ALERT_NOTE" ]; then
    echo ""
    echo "## Notes"
    echo "- ${ALERT_NOTE}"
  fi
} > "$FINDING_FILE"

# -- Update state -----------------------------------------------------------
if [ "$LS_MARKER" = "yes" ]; then
  LS_MARKER_JSON="true"
else
  LS_MARKER_JSON="false"
fi

cat > "$STATE_FILE" <<EOF
{
  "last_ran_at": "${RAN_AT}",
  "supabase_status": "${SB_STATUS}",
  "supabase_http": ${SB_HTTP:-0},
  "supabase_response_ms": ${SB_MS:-0},
  "vercel_status": "${VC_STATUS}",
  "vercel_http": ${VC_HTTP:-0},
  "vercel_response_ms": ${VC_MS:-0},
  "vercel_last_deploy_status": "${VC_DEPLOY_STATE}",
  "vercel_last_deploy_id": "${VC_DEPLOY_ID}",
  "live_site_status": "${LS_STATUS}",
  "live_site_http": ${LS_HTTP:-0},
  "live_site_response_ms": ${LS_MS:-0},
  "live_site_body_size": ${LS_SIZE:-0},
  "live_site_marker_found": ${LS_MARKER_JSON},
  "last_severity": "${SEVERITY}",
  "last_alerted": ${ALERTED}
}
EOF

# -- Commit + push ----------------------------------------------------------
cd "$WIKI_ROOT" || exit 0
git add "wayloft/findings/${TS_FILENAME}-qa-sweep.md" "wayloft/state/last-sweep.json" 2>/dev/null

if git diff --cached --quiet; then
  echo "Sweep complete: severity=${SEVERITY} (no changes to commit)"
  exit 0
fi

git -c user.name="OpenClaw" -c user.email="openclaw@wayloft.local" \
    commit -m "wayloft-qa-sweep: ${SEVERITY} @ ${RAN_AT}" > /dev/null 2>&1

if ! git push origin main > /dev/null 2>&1; then
  echo "Sweep complete: severity=${SEVERITY} (LOCAL COMMIT ONLY — push failed)" >&2
  exit 0
fi

echo "Sweep complete: severity=${SEVERITY} file=wayloft/findings/${TS_FILENAME}-qa-sweep.md"
exit 0
