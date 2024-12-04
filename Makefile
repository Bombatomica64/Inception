PROJ_NAME=inception
COMPOSE_FILE=srcs/docker-compose.yml

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
	@docker-compose -p $(PROJ_NAME) -f $(COMPOSE_FILE) build

up:
	@echo "Starting the project"
	@docker-compose -p $(PROJ_NAME) -f $(COMPOSE_FILE) up -d

down:
	@echo "Stopping the project"
	@docker-compose -p $(PROJ_NAME) -f $(COMPOSE_FILE) down

logs:
	@echo "Showing the logs"
	@docker-compose -p $(PROJ_NAME) -f $(COMPOSE_FILE) logs

stop:
	@echo "Stopping the project"
	@docker-compose -p $(PROJ_NAME) -f $(COMPOSE_FILE) stop

clean: down
	@docker system prune -f
	@docker volume prune -f