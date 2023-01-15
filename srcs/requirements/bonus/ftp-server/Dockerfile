FROM	alpine:3.13

RUN		apk update && apk upgrade && \
		apk add --no-cache \
		vsftpd

RUN		adduser -D ${FTP_USER}

RUN		echo "${FTP_USER}:${FTP_PWD}" | /usr/sbin/chpasswd

RUN		mkdir /etc/vsftpd/vconf

RUN		echo ${FTP_USER} > /etc/vsftpd/vconf/user_list

COPY	conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

CMD		[ "vsftpd" ]
