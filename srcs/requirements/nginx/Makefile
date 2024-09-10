all:
	make up
build:
	docker build -t nginx-image .

up:
	make build
	docker run -it --name nginx-container nginx-image

down:
	docker stop nginx-container
	docker rm nginx-container

clean:
	docker volume rm $$(docker volume ls -q) || true

fclean:
	docker stop nginx-container
	docker rm nginx-container
	docker volume rm $$(docker volume ls -q) || true
	docker image rm $$(docker images -q) || true

re:
	make fclean
	make all

.PHONY: all build up down clean fcelan re