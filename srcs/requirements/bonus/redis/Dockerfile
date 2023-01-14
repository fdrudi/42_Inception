FROM	alpine:3.13

RUN		apk update && apk upgrade && \
		apk add --no-cache redis

COPY	conf/redis.conf /etc/redis.conf

CMD		[ "redis-server", "/etc/redis.conf" ]
