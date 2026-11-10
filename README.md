# flipzone-infra

Local infrastructure for the FlipZone microservices platform.

## What's included

| Component | Port | Purpose |
|---|---|---|
| PostgreSQL 16 | 5432 | One database + user per service |
| Kafka (KRaft) | 9092 (host), 29092 (docker network) | Event streaming |
| Schema Registry | 8081 | Avro schema storage and compatibility checks |
| Kafka UI | 8085 | Browse topics, messages, schemas |

## Prerequisites

- Docker Desktop
- Git Bash or WSL (Windows) to run the helper scripts

## Quick start

    cp .env.example .env
    ./scripts/up.sh

## Scripts

| Script | What it does |
|---|---|
| `scripts/up.sh` | Start the stack (creates `.env` if missing) |
| `scripts/down.sh` | Stop the stack, keep data |
| `scripts/reset.sh` | Stop and **delete all data**, then start fresh |

## Databases

| Service | Database | User |
|---|---|---|
| auth | auth_db | auth_user |
| catalog | catalog_db | catalog_user |
| customer | customer_db | customer_user |
| inventory | inventory_db | inventory_user |
| order | order_db | order_user |
| payment | payment_db | payment_user |
| notification | notification_db | notification_user |

Passwords are defined in `.env` (see `.env.example`).

## Conventions

- Branching: trunk-based. Work on `type/description` branches, merge via PR.
- Commits: Conventional Commits (`feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `ci`).

## Notes

- Init scripts in `postgres/init` run only when the data volume is empty. Use `scripts/reset.sh` to re-run them.
- Kafka auto topic creation is disabled; topics are created explicitly.