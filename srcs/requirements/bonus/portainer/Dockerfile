FROM	alpine:3.13

ENV		TZ=your_time_zone

RUN		apk update && apk upgrade && \
		apk add --no-cache \
		curl

RUN		curl -L https://downloads.portainer.io/portainer.tar.gz -o portainer.tar.gz

RUN		curl -sSL https://github.com/portainer/portainer/releases/download/2.16.2/portainer-2.16.2-linux-amd64.tar.gz -o portainer.tar.gz
		# tar -xzo -C /usr/local/bin/

RUN		tar -xvf portainer.tar.gz -C /usr/bin/

RUN		rm portainer.tar.gz

CMD		["portainer", "-H", "unix:///var/run/docker.sock"]
