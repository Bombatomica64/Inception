FROM debian:11

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y vim vsftpd procps

RUN mkdir -p /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.key \
    -out /etc/ssl/certs/vsftpd.crt \
    -subj "/C=IT/ST=Italy/L=Florence/O=42/OU=Inception/CN=ftps"

COPY ./Conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/log/ftp && \
	chown -R ftp:ftp /var/log/ftp

EXPOSE 21

COPY ./Tools/setup.sh /
RUN chmod 777 /setup.sh

CMD ["sh", "/setup.sh"]