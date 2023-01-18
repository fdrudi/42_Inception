FROM	alpine:3.13

ENV		TZ=Europe/Rome

RUN		apk update && apk upgrade && \
		apk add --no-cache \
		curl

RUN		curl -sSL https://github.com/portainer/portainer/releases/download/2.16.2/portainer-2.16.2-linux-amd64.tar.gz | \
		tar -xzo -C /usr/local

CMD		["/usr/local/portainer/portainer"]
