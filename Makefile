PROJ_NAME=inception
COMPOSE_FILE=./src/docker-compose.yml

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
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJ_NAME) build

up:
	@echo "Starting the project"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJ_NAME) up -d

down:
	@echo "Stopping the project"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJ_NAME) down

logs:
	@echo "Showing the logs"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJ_NAME) logs -f

stop:
	@echo "Stopping the project"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJ_NAME) stop

clean:
	@docker system prune -f
	@docker volume prune -f