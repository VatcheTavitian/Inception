GREEN := \033[0;32m
RED := \033[0;31m
RESET := \033[0m

all: dirs
	echo -e "$(GREEN)Running make all!$(RESET)"
	docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d

build: dirs
	docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d

down:
	docker compose -f ./srcs/docker-compose.yml down


re: down
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	docker system prune -a

fclean: 
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	# docker volume prune --force
	echo -e "$(RED)All docker images and networks and volumes removed$(RESET)"

dirs:
	if [ ! -d "/home/$(USER)/data" ]; then \
	    mkdir -p ~/data/mariadb; \
	    mkdir -p ~/data/wordpress; \
	fi

.PHONY: all build down re clean fclean dirs

