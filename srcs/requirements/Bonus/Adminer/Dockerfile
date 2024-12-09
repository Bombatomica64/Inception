FROM debian:11

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql wget

COPY Conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY /Tools/setup.sh /
RUN chmod 777 /setup.sh

# RUN chmod -R 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

RUN mkdir -p /run/php/

EXPOSE 9001

ENTRYPOINT ["sh", "/setup.sh"]