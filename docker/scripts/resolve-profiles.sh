#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${1:-.env}"

if [ ! -f "$ENV_FILE" ]; then
  echo "Missing $ENV_FILE. Copy .env.example to .env first."
  exit 1
fi

set -a
source "$ENV_FILE"
set +a

profiles=()

[ "${IS_MONGO_ENABLED:-false}" = "true" ] && profiles+=("mongo")
[ "${IS_REDIS_ENABLED:-false}" = "true" ] && profiles+=("redis")
[ "${IS_POSTGRES_ENABLED:-false}" = "true" ] && profiles+=("postgres")

if [ ${#profiles[@]} -eq 0 ]; then
  echo "No services enabled in $ENV_FILE."
  exit 1
fi

export COMPOSE_PROFILES=$(IFS=,; echo "${profiles[*]}")
echo "Enabled: $COMPOSE_PROFILES"