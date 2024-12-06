FROM debian:11

# Set UTC Timezone because docker is dumb
RUN apt-get update && \
apt-get install -y tzdata && \
ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update -y && apt-get upgrade -y

# Install Nginx
RUN apt-get install -y nginx openssl procps vim

#keys
ARG DOMAIN
ENV DOMAIN=${DOMAIN}

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=IT/L=Florence/O=42/OU=Student/CN=${DOMAIN}"

#nginx conf
COPY ./Conf/nginx.conf /etc/nginx/sites-available/default

RUN mkdir -p /var/log/nginx && \
    chown -R www-data:www-data /var/log/nginx

#entrypoint
COPY ./Tools/setup.sh /
RUN chmod 777 /setup.sh
ENTRYPOINT [ "sh" , "/setup.sh" ]
