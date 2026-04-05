#!/bin/bash
set -euo pipefail

if pgrep -f "socat.*TCP-LISTEN:5432" >/dev/null 2>&1; then
  echo "Postgres proxy already running on localhost:5432"
  exit 0
fi

echo "Starting Postgres proxy: localhost:5432 -> host.docker.internal:5432"
nohup socat TCP-LISTEN:5432,bind=127.0.0.1,fork,reuseaddr TCP:host.docker.internal:5432 >/tmp/pg_proxy.log 2>&1 &

sleep 2

if pgrep -f "socat.*TCP-LISTEN:5432" >/dev/null 2>&1; then
  echo "Postgres proxy started"
else
  echo "Failed to start Postgres proxy"
  exit 1
fi
