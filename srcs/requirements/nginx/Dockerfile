# FROM	alpine:3.16

# RUN		apk update && apk upgrade && \
# 		apk add --no-cache nginx

# CMD		[ "nginx", "-g", "daemon off;" ]

FROM ubuntu:latest

EXPOSE 80

RUN apt-get update && \
    apt-get install nginx -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["nginx", "-g", "daemon off;"]
