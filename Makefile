ERASE	= \033[2K\r
GREY	= \033[30m
RED		= \033[31m
GREEN	= \033[32m
YELLOW	= \033[33m
BLUE	= \033[34m
PINK	= \033[35m
CYAN	= \033[36m
WHITE	= \033[37m
END		= \033[0m
BOLD	= \033[1m
UNDER	= \033[4m
SUR		= \033[7m

# MKDIR		= mkdir -p
# VOL_DB		= 

all:
#			sudo userdel mysql
#			sudo useradd -u 999 mysql
#			sudo mkdir -p /home/tdayde/data/vol_mysql
#			sudo chown -R mysql:mysql /home/tdayde/data/vol_mysql

#			sudo userdel www-data
#			sudo useradd -u 999 www-data
			sudo mkdir -p /home/kypark/data/vol_wp /home/kypark/data/vol_mysql
#			sudo chown -R www-data:www-data /data/www-data
			docker-compose --file ./srcs/docker-compose.yml up -d

up:			
			docker-compose --file ./srcs/docker-compose.yml up -d

down:		
			docker-compose --file ./srcs/docker-compose.yml down

stop:		
			docker-compose --file ./srcs/docker-compose.yml stop

rebuild:
			-docker-compose --file ./srcs/docker-compose.yml up -d --build
			-docker image prune -f


test:		
			-docker rm -f test
			-docker build -t test srcs/requirements/mariadb
			-docker run -dit --rm --name=test test
			-docker container exec -it test bash

run_test:
			-docker run -dit --rm --name=test test

stop_test:
			-docker stop test

mysql:
			-docker exec -it mysql bash

wp:
			-docker exec -it wordpress bash

nginx:
			-docker exec -it nginx bash

clear:		
			-docker-compose --file ./srcs/docker-compose.yml down
			-docker rm -f $$(docker ps -a -q)
			-docker rmi -f $$(docker images -aq)
			-docker volume rm $$(docker volume ls -q)
			-docker network rm $$(docker network ls -q)
			-sudo rm -rf /home/kypark/data

info:
			echo "$(GREEN)$(BOLD)images status :$(END)"
			-docker images
			echo "$(GREEN)$(BOLD)docker-compose status :$(END)"
			-docker-compose --file ./srcs/docker-compose.yml ps
			echo "$(GREEN)$(BOLD)docker status :$(END)"
			-docker ps -a
			echo "$(GREEN)$(BOLD)volume status :$(END)"
			-docker volume ls 
			echo "$(GREEN)$(BOLD)network status :$(END)"
			-docker network ls

clean:		clear

fclean:		clear

re:			clear all

.SILENT : 	all info