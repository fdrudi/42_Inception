NAME = inception

all: prune reload

linux:
	@ echo "127.0.0.1 fdrudi.42.fr" >> /etc/hosts

stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf /goinfre/fdrudi/inception
#	@ docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

prune: clean
	@ docker system prune -a -f

reload:
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: linux stop clean prune reload all
