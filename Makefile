NAME = inception

all: prune reload

linux:
	@ echo "127.0.0.1 fdrudi.42.fr" >> /etc/hosts

stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf /home/fdrudi/data
# @ docker volume rm $(docker volume ls -q)

prune: clean
	@ docker system prune -a -f

reload:
	@ sh srcs/requirements/tools/configure.sh
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: linux stop clean prune reload all
