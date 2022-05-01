SHELL := /bin/bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

hooks: ## Setup pre commit.
	@pre-commit install
	@pre-commit gc

validate: ## Validate files with pre-commit hooks
	@pre-commit run --all-files

run: ## Run locally
	@docker-compose up

stop: ## Stop locall development
	@docker-compose stop

destroy: ## To remove volumes and have a fresh DB on next run
	@docker-compose down
	@docker volume prune -f
	@docker rmi $(shell docker images --filter "dangling=true" -q --no-trunc) -f

api-rebuild: ## Restart 'API' service locally
	@docker-compose build api
	@docker-compose restart api
