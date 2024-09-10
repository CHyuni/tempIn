
USER := changhyu
DATA_DIR := /home/$(USER)/data
DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yml
DOCKER_COMPOSE := docker compose -f $(DOCKER_COMPOSE_FILE)


.PHONY: all build down re clean fclean

all: create_dirs
	$(DOCKER_COMPOSE) up --detach

build: create_dirs
	$(DOCKER_COMPOSE) up --detach --build

down:
	$(DOCKER_COMPOSE) down

re: down
	$(DOCKER_COMPOSE) up --detach --build

clean: down
	docker system prune -a

fclean:
	$(DOCKER_COMPOSE) down -v
	docker system prune --all --force --volumes
	sudo rm -rf $(DATA_DIR)

create_dirs:
	mkdir -p $(DATA_DIR)/www
	mkdir -p $(DATA_DIR)/mysql
