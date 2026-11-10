#!/bin/bash
set -e
cd "$(dirname "$0")/.."

if [ ! -f .env ]; then
  echo ".env not found, creating from .env.example"
  cp .env.example .env
fi

docker compose up -d
docker compose ps
