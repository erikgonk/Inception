PATH_NGINX = ./srcs/requirements/nginx
PATH_WORDPRESS = ./srcs/requirements/wordpress

EXEC_DOCKER = docker build -t

DOCKER_COMPOSE = srcs/docker-compose.yml
all: fdown image up

image:
	$(EXEC_DOCKER) img-nginx $(PATH_NGINX)
# 	$(EXEC_DOCKER) img-wordpress $(PATH_WORDPRESS)

up:
	docker compose --file $(DOCKER_COMPOSE) up --detach

down:
	docker compose --file $(DOCKER_COMPOSE) down

res:
	docker restart nginx

fdown: down
	docker compose --file $(DOCKER_COMPOSE) down --volumes
	@if docker image inspect img-nginx > /dev/null 2>&1; then \
		docker rmi img-nginx; \
	else \
		printf "does not exist, skipping removal\n"; \
	fi

foo:
	ls $(PATH_NGINX)
	ls $(PATH_WORDPRESS)