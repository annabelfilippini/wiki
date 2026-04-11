# Wayloft scripts

Standalone scripts invoked by OpenClaw cron on the Hetzner VPS. All scripts are runnable manually from a laptop too (with `WAYLOFT_ENV_FILE` pointing at the right env file).

## wayloft-qa-sweep.sh

Runtime health sweep. Checks Supabase, Vercel, and the live site. Writes a finding to `wayloft/findings/`, updates `wayloft/state/last-sweep.json`, alerts via Telegram on urgent findings, and pushes the wiki repo.

**This is the bash version.** There's also a Claude-in-the-loop version at `~/Documents/Claude/MO/.claude/skills/wayloft-qa-sweep/SKILL.md` for manual exploratory runs from the laptop — that version gives Claude context to interpret findings and suggest next steps, at the cost of LLM runtime and tokens. The bash version here is what OpenClaw runs automatically every night.

### Required env vars

From `/opt/wayloft/.env` on the VPS (or `apps/web/.env.local` on a laptop, via `WAYLOFT_ENV_FILE` override):

- `NEXT_PUBLIC_SUPABASE_URL` — already present on VPS
- `SUPABASE_SERVICE_ROLE_KEY` — already present on VPS
- `VERCEL_TOKEN` — **needs to be added to VPS env**
- `WAYLOFT_LIVE_URL` — defaults to `https://wayloft.app` if unset
- `TELEGRAM_BOT_TOKEN` — optional, required only for urgent alerts
- `TELEGRAM_CHAT_ID` — optional, required only for urgent alerts

### Manual laptop run

```bash
WAYLOFT_ENV_FILE=~/Documents/Claude/MO/apps/web/.env.local \
  ~/Documents/Claude/wiki/wayloft/scripts/wayloft-qa-sweep.sh
```

Or let the script use the default `/opt/wayloft/.env` if you're on the VPS.

## VPS layout reference

Two separate wiki clones live on the Hetzner box — don't confuse them:

| Path | Owner | Purpose |
|---|---|---|
| `/root/.openclaw/workspace/wiki` | OpenClaw (root) | Used by OpenClaw jobs (morning briefing, this sweep). Read + write. **This is the one we use.** |
| `/opt/annie-intake/wiki` | `annie-intake` user | Write-clone for the annie-intake Telegram router. Separate service, separate concerns. **Do not touch from OpenClaw jobs.** |

The path `/root/.openclaw/workspace/wiki` is inferred from `projects/annie-intake/DESIGN.md` ("Annie's existing clone at `/root/.openclaw/workspace/wiki`"). Verify it matches reality before deploying — if OpenClaw was reinstalled or reorganized since that doc, the path may have drifted. The setup steps below include a verification step.

## VPS Setup — first-time deployment

One-time setup on Hetzner. Run as `root`.

### 1. Find the OpenClaw wiki clone

```bash
# Expected location, based on annie-intake DESIGN.md:
ls /root/.openclaw/workspace/wiki/wayloft/scripts/wayloft-qa-sweep.sh 2>/dev/null && echo "FOUND: /root/.openclaw/workspace/wiki"
```

If that prints nothing, the clone is somewhere else. Search:

```bash
find / -maxdepth 5 -type d -name wiki 2>/dev/null | grep -v annie-intake
```

Look for a path that contains `.git/` and is owned by root. Once you find it, use that path in the rest of the steps below (replace `$WIKI` with the actual path).

```bash
# For the rest of the setup, set this variable to whatever you found:
WIKI=/root/.openclaw/workspace/wiki   # or wherever the OpenClaw clone actually lives
```

### 2. Pull latest wiki

```bash
cd "$WIKI" && git pull
```

The bash script + this README should now exist at `$WIKI/wayloft/scripts/`. If `git pull` fails or the files aren't there, check that the clone is tracking `origin/main` on `github.com/annabelfilippini/wiki`.

### 3. Verify script is executable

```bash
ls -l "$WIKI/wayloft/scripts/wayloft-qa-sweep.sh"
# should show -rwxr-xr-x (executable)
chmod +x "$WIKI/wayloft/scripts/wayloft-qa-sweep.sh"
```

### 4. Add env vars to `/opt/wayloft/.env`

Append (don't overwrite — Supabase vars should already exist):

```bash
cat >> /opt/wayloft/.env <<'EOF'
VERCEL_TOKEN=<paste your Vercel token here>
WAYLOFT_LIVE_URL=https://wayloft.app
EOF
```

Optional — Telegram alert creds (can be added later):

```bash
cat >> /opt/wayloft/.env <<'EOF'
TELEGRAM_BOT_TOKEN=<paste annie bot token>
TELEGRAM_CHAT_ID=<paste your chat id>
EOF
```

Verify the env file parses cleanly (no syntax errors):

```bash
bash -n <(cat <<'EOF'
set -a
source /opt/wayloft/.env
set +a
EOF
)
```

### 5. Test-run the script manually

```bash
"$WIKI/wayloft/scripts/wayloft-qa-sweep.sh"
```

Expected output on success:

```
Sweep complete: severity=info file=wayloft/findings/YYYY-MM-DD-HHMM-qa-sweep.md
```

Verify the finding file exists:

```bash
ls -la "$WIKI/wayloft/findings/" | tail -5
```

If the push succeeded, you'll see the new commit on the [wiki repo on GitHub](https://github.com/annabelfilippini/wiki) within seconds.

### 6. Wire up the OpenClaw cron job

Check the current jobs:

```bash
cat /root/.openclaw/cron/jobs.json
```

Add a new entry for the sweep. The exact schema depends on what OpenClaw expects — match the existing job format. The schedule should be `0 6 * * *` (06:00 UTC = 2am ET EDT), and the command should invoke the script directly.

Example entry (adjust field names to match OpenClaw's schema, and replace the command path with the actual `$WIKI` path you verified in step 1):

```json
{
  "name": "wayloft-qa-sweep",
  "schedule": "0 6 * * *",
  "command": "/root/.openclaw/workspace/wiki/wayloft/scripts/wayloft-qa-sweep.sh",
  "description": "Wayloft runtime QA sweep — Supabase, Vercel, live site"
}
```

After editing `jobs.json`, restart OpenClaw's cron daemon (or whatever reload command OpenClaw uses — `systemctl restart openclaw` if it's a systemd service, or just wait for it to pick up the next scheduled tick).

### 7. Verify the cron job landed

```bash
# Confirm the job is registered
cat /root/.openclaw/cron/jobs.json | grep -A3 wayloft-qa-sweep
```

First automated run will fire at 06:00 UTC. Watch for a new commit on the wiki repo around that time.

## Troubleshooting

**Script exits with "env file not found":**
The default path is `/opt/wayloft/.env`. Override with `WAYLOFT_ENV_FILE=/custom/path`.

**Script exits with "Supabase env vars missing":**
`NEXT_PUBLIC_SUPABASE_URL` or `SUPABASE_SERVICE_ROLE_KEY` isn't in the env file. Check with `grep SUPABASE /opt/wayloft/.env` (var names only, don't echo values).

**Vercel check always returns "warning":**
`VERCEL_TOKEN` isn't set in env, or the token is invalid. Test the token: `curl -H "Authorization: Bearer $VERCEL_TOKEN" https://api.vercel.com/v2/user` (should return your Vercel user JSON).

**Git push fails from the VPS:**
VPS git remote probably doesn't have push credentials. Options:
- Use SSH key auth: `git remote set-url origin git@github.com:annabelfilippini/wiki.git` and add the VPS's SSH key as a deploy key on GitHub
- Use a personal access token in HTTPS remote: `git remote set-url origin https://<token>@github.com/annabelfilippini/wiki.git`

Either way, the script handles push failure gracefully — it exits 0 with a warning, the commit stays local, and the next successful push catches up.

**Cron job doesn't fire:**
Check OpenClaw logs: `journalctl -u openclaw -n 50` (if systemd) or `/var/log/openclaw.log` (if file-based). Verify the cron expression is valid and the command path exists.
