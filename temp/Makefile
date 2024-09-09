all:
	make up
build:
	docker build -t mariadb-image .

up:
	make build
	docker run -it --name mariadb-container mariadb-image

down:
	docker stop mariadb-container
	docker rm mariadb-container

clean:
	docker volume rm $$(docker volume ls -q) || true

fclean:
	docker stop mariadb-container
	docker rm mariadb-container
	docker volume rm $$(docker volume ls -q) || true
	docker image rm $$(docker images -q) || true

re:
	make fclean
	make all

.PHONY: all build up down clean fcelan re