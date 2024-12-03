FROM debian:11

RUN sudo apt-get update -y && sudo apt-get install mariadb

RUN apt-get install -y php7.3-fpm \
    php7.3-common \
    php7.3-mysql \
    php7.3-gmp \
    php7.3-curl \ 
    php7.3-intl \
    php7.3-mbstring \
	php7.3-xmlrpc \
    php7.3-gd \
    php7.3-xml \
    php7.3-cli \
    php7.3-zip \
    php7.3-soap \
    php7.3-imap \
    php7.3-fpm \
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

# PHP-FPM
RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf && \
    echo "access.log = /var/log/$pool.access.log" >> /etc/php/7.3/fpm/pool.d/www.conf

#WordPress dir
RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress && \
    chmod 777 /var/www/wordpress

RUN mkdir -p /run/php/

COPY tools/setup.sh /
RUN chmod 777 /setup.sh
WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["sh", "/setup.sh"]