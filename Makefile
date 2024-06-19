PROJ_NAME=inception
COMPOSE_FILE=./src/docker-compose.yml

all: help

help:
	@echo "make help"
	@echo "make build"
	@echo "make run"
	@echo "make clean"
	@echo "make stop"
	@echo "make up"
	@echo "make down"
	@echo "make logs"

dependencies:
	@echo "Installing dependencies"
	@check-dependency