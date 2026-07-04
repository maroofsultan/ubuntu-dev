.DEFAULT_GOAL := help
ENV_FILE ?= .env

up: ## Start enabled services
	@bash -c 'source scripts/resolve-profiles.sh $(ENV_FILE) && docker compose up -d'

down: ## Stop enabled services
	@bash -c 'source scripts/resolve-profiles.sh $(ENV_FILE) && docker compose down'

ps: ## Show running containers
	@bash -c 'source scripts/resolve-profiles.sh $(ENV_FILE) && docker compose ps'

logs: ## Tail logs
	@bash -c 'source scripts/resolve-profiles.sh $(ENV_FILE) && docker compose logs -f'

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-15s %s\n", $$1, $$2}'