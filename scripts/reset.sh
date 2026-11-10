#!/bin/bash
set -e
cd "$(dirname "$0")/.."

read -p "This DELETES all local data (databases, Kafka topics). Continue? [y/N] " answer
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
  docker compose down -v
  docker compose up -d
  docker compose ps
else
  echo "Cancelled."
fi
