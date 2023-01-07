# FROM	alpine:3.16

# RUN		apk update && apk upgrade && \
# 		apk add --no-cache nginx

# CMD		[ "nginx", "-g", "daemon off;" ]



# FROM debian:10.13

# EXPOSE 80

# RUN apt-get update && \
#     apt-get install nginx -y && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# CMD ["nginx", "-g", "daemon off;"]



FROM		alpine:3.16

RUN			apk update && apk upgrade && \
			apk add --no-cache nginx openssl

RUN			mkdir /etc/nginx/ssl
RUN			mkdir /run/nginx

RUN			openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
			-keyout /etc/nginx/ssl/fdrudi.key \
			-out	/etc/nginx/ssl/fdrudi.pem \
			-subj   "/C=IT/ST=Italy/L=Rome/O=42 Rome/OU=fdrudi/CN=fdrudi/"

COPY		conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT	["nginx", "-g", "daemon off;"]
