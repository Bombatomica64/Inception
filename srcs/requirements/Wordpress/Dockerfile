FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php \
	php-fpm \
    php-common \
    php-mysql \
    php-gmp \
    php-curl \ 
    php-intl \
    php-mbstring \
	php-xmlrpc \
    php-gd \
    php-xml \
    php-cli \
    php-zip \
    php-soap \
    php-imap \
    wget \
    curl \
	vim \
    openssl \
    sendmail \ 
    mariadb-client \
    procps;

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp


#PHP-FPM
COPY Conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# RUN echo "listen = 0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf && \
# 	echo "listen.owner = www-data" >> /etc/php/7.4/fpm/pool.d/www.conf && \
# 	echo "listen.group = www-data" >> /etc/php/7.4/fpm/pool.d/www.conf && \
# 	echo "listen.mode = 0660" >> /etc/php/7.4/fpm/pool.d/www.conf && \
# 	echo "access.log = /var/log/$pool.access.log" >> /etc/php/7.4/fpm/pool.d/www.conf

#PHP-FPM
# RUN echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf && \
#     echo "access.log = /var/log/$pool.access.log" >> /etc/php/7.4/fpm/pool.d/www.conf

#WordPress dir
# RUN mkdir -p /var/www/html && \
#     chown -R 777 /var/www/html && \
#     chmod 777 /var/www/html

RUN mkdir -p /run/php/

COPY Tools/setup.sh /
RUN chmod 777 /setup.sh
WORKDIR /var/www/html/

EXPOSE 9000 21

ENTRYPOINT ["sh", "/setup.sh"]