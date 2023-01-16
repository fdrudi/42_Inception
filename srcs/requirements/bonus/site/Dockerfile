FROM	alpine:3.13

RUN		apk update && apk upgrade && \
		apk add --no-cache nodejs npm

COPY	./conf /

CMD		[ "node", "run.js" ]
