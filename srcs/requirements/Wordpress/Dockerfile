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
    openssl \
    sendmail \ 
    mariadb-client \
    procps;

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

#PHP-FPM
RUN echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf && \
    echo "access.log = /var/log/$pool.access.log" >> /etc/php/7.4/fpm/pool.d/www.conf

#WordPress dir
RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress && \
    chmod 777 /var/www/wordpress

RUN mkdir -p /run/php/

COPY Tools/setup.sh /
RUN chmod 777 /setup.sh
WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["sh", "/setup.sh"]