#!/usr/bin/env python3
"""Add the wayloft-qa-sweep job to OpenClaw's cron/jobs.json.

Run once on the VPS:
    python3 /root/.openclaw/workspace/wiki/wayloft/scripts/add-cron-job.py

Safe to re-run — skips if a job named 'wayloft-qa-sweep' already exists.
"""

import json
import uuid
import time
import sys

JOBS_FILE = "/root/.openclaw/cron/jobs.json"

new_job = {
    "id": str(uuid.uuid4()),
    "agentId": "main",
    "name": "wayloft-qa-sweep",
    "enabled": True,
    "createdAtMs": int(time.time() * 1000),
    "updatedAtMs": int(time.time() * 1000),
    "schedule": {
        "kind": "cron",
        "expr": "0 2 * * *",
        "tz": "America/Detroit",
    },
    "sessionTarget": "isolated",
    "wakeMode": "now",
    "payload": {
        "kind": "agentTurn",
        "message": (
            "Run this command and report its single-line output:\n\n"
            "/root/.openclaw/workspace/wiki/wayloft/scripts/wayloft-qa-sweep.sh\n\n"
            "This is a scheduled Wayloft runtime QA sweep. The script handles "
            "everything (Supabase + Vercel + live site checks, findings markdown, "
            "git push, Telegram alerts for urgent). Just execute the script. "
            "If the output says severity=info, reply with just ok. "
            "Only provide detail if severity is warning or urgent."
        ),
    },
    "delivery": {
        "mode": "announce",
        "channel": "last",
        "to": "8519804405",
    },
}

with open(JOBS_FILE) as f:
    data = json.load(f)

for job in data["jobs"]:
    if job.get("name") == "wayloft-qa-sweep":
        print("Job 'wayloft-qa-sweep' already exists. Skipping.")
        sys.exit(0)

data["jobs"].append(new_job)

with open(JOBS_FILE, "w") as f:
    json.dump(data, f, indent=2)

print(f"Done. Added 'wayloft-qa-sweep' (id: {new_job['id']})")
print(f"Schedule: daily at 2am ET (0 2 * * * America/Detroit)")
print(f"Total jobs: {len(data['jobs'])}")
