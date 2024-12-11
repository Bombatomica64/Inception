PROJ_NAME=inception
COMPOSE_FILE=./srcs/docker-compose.yml

all: help

help:
	@echo "make help"
	@echo "make build"
	@echo "make up"
	@echo "make stop"
	@echo "make down"
	@echo "make logs"
	@echo "make clean"

build:
	@echo "Building the project"
	@docker compose -f $(COMPOSE_FILE) build

up: build
	@echo "Starting the project"
	@docker compose -f $(COMPOSE_FILE) up -d

down:
	@echo "Stopping the project"
	@docker compose -f $(COMPOSE_FILE) down

logs:
	@echo "Showing the logs"
	@docker compose -f $(COMPOSE_FILE) logs

stop:
	@echo "Stopping the project"
	@docker compose -f $(COMPOSE_FILE) stop

clean: down
	@docker system prune -f
	@docker volume prune -f
	sudo rm -rf /home/$(USER)/data

re: down up

start: clean up

health:
	@dofrcker ps -a | grep $(PROJ_NAME) | awk '{print $$1}' | xargs docker inspect --format='{{.State.Health.Status}} {{.Name}}'