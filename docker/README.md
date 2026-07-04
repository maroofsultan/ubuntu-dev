# Dev Infrastructure

Local Docker services for development — Mongo, Redis, Postgres, and more, toggled individually.

## Quick Start

```bash
cp .env.example .env
# edit .env — set IS_<SERVICE>_ENABLED=true for what you need
make up
```

That's it. Run `make help` to see all available commands.

## Available services

| Service    | Flag                    | Default port |
|------------|-------------------------|---------------|
| MongoDB    | `IS_MONGO_ENABLED`      | 37017         |
| Redis      | `IS_REDIS_ENABLED`      | 36379         |
| PostgreSQL | `IS_POSTGRES_ENABLED`   | 35432         |

## Adding a new service

Example: adding MySQL.

1. Create `services/mysql/compose.yml` with `profiles: ["mysql"]`
2. Add `services/mysql/compose.yml` to the `include:` list in `docker-compose.yml`
3. Add `IS_MYSQL_ENABLED` (and any port/credential vars it needs) to `.env.example`
4. Add this line to `scripts/resolve-profiles.sh`:
```bash
   [ "${IS_MYSQL_ENABLED:-false}" = "true" ] && profiles+=("mysql")
```

Same pattern for any service — just swap `mysql` for the service name.

## Commands

- `sudo make up` — start whatever's enabled in `.env`
- `sudo make down` — stop everything
- `sudo make ps` — list running containers
- `sudo make logs` — tail logs
- `sudo make mongo` / `make redis` — force-start just one service, ignoring `.env`