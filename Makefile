.DEFAULT_GOAL: help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo ''

# Command (docker-compose and docker) vars
# For docker, use `which docker-compose`)
CMD_DOCKER  ?= $(shell which podman)
CMD_COMPOSE ?= $(shell which podman-compose)

# Project vars
COMPOSE_PROJECT_NAME ?= remail-ar-local

.PHONY: dev
run: ## Bootstrap the development environment, or recreates the parts that changed
	${CMD_COMPOSE} up \
		-d

stop: ## Stops the development environmet
	${CMD_COMPOSE} stop

clean: stop ## Clean all created containers
	${CMD_COMPOSE} down --volumes


# bash one-liner that deletes all containers
# for container in $(shell ${CMD_DOCKER} ps -a | awk 'NR>1{print $$1}'); do ${CMD_DOCKER} rm $$container; done