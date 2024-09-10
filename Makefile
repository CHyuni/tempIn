all:
	make up

build:
	docker-compose -f ./srcs/docker-compose.yml build

up:
	mkdir -p /home/changhyu/data/wordpress
	mkdir -p /home/changhyu/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker volume rm $$(docker volume ls -q) || true

fclean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker volume rm $$(docker volume ls -q) || true
	docker image rm $$(docker images -aq) || true
	sudo rm -rf /home/changhyu/data

re:
	make fclean
	make all

.PHONY: all build up down clean fclean re