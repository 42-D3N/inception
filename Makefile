COMPOSE = ./srcs/docker-compose.yml

all: start

start:
	@mkdir -p /home/tle-pape/data/mariadb
	@mkdir -p /home/tle-pape/data/wordpress
	@docker compose -f $(COMPOSE) up -d --build

stop:
	@docker compose -f $(COMPOSE) down

clean:
	@-docker stop $(shell docker ps -qa); docker rm $(shell docker ps -qa); docker rmi -f $(shell docker images -qa); docker volume rm $(shell docker volume ls -q); docker network rm $(shell docker network ls -q) 2>/dev/null
	@sudo rm -rf /home/tle-pape/data/wordpress /home/tle-pape/data/mariadb

re: clean start
