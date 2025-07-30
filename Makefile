NAME			= inception

DOCKER_COMPOSE	= DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose -f ./srcs/docker-compose.yml

DOCKER			= docker

all:			
				mkdir -p /home/${USER}/data/wordpress
				mkdir -p /home/${USER}/data/mariadb
				${DOCKER_COMPOSE} build
				${DOCKER_COMPOSE} up -d

ls:
				${DOCKER} ps -a

build: 
				${DOCKER_COMPOSE} build

up:
				${DOCKER_COMPOSE} up -d
	
down:
				${DOCKER_COMPOSE} down

pause:
				${DOCKER_COMPOSE} pause

unpause:
				${DOCKER_COMPOSE} unpause

clean:			down
				rm -rf ~/Documents/inception/srcs/requirements/nginx/log/*
				rm -rf ~/Documents/inception/srcs/requirements/mariadb/data
				rm -rf ~/Documents/inception/srcs/requirements/wordpress/website
				${DOCKER_COMPOSE} down -v --rmi all --remove-orphans

fclean: 		clean
				${DOCKER} system prune -f

re:				fclean all

refresh:
				rm -Rf ../data
				mkdir -p ../data/mariadb
				mkdir -p ../data/wordpress
				killall Docker\ Desktop || true
				killall com.docker.backend || true
				systemctl --user start docker-desktop && sleep 5 && make re


.PHONY:			linux stop clean prune all build up refresh
