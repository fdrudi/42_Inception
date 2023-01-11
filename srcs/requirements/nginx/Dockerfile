FROM		alpine:3.13

RUN			apk update && apk upgrade && \
			apk add --no-cache nginx openssl

RUN			mkdir /etc/nginx/ssl
RUN			mkdir -p /run/nginx

RUN			mkdir -p /var/www/html

RUN			openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
			-keyout /etc/nginx/ssl/fdrudi.key \
			-out	/etc/nginx/ssl/fdrudi.pem \
			-subj   "/C=IT/ST=Italy/L=Rome/O=42 Rome/OU=fdrudi/CN=fdrudi/"

COPY		conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT	["nginx", "-g", "daemon off;"]
