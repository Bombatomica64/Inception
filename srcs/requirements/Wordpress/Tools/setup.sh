#!/bin/sh


wp core download --path=/var/www/wordpress --allow-root

# wp-config.php
wp config create --path=/var/www/wordpress --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

# Install WordPress
wp core install --path=/var/www/wordpress --url="lollo.42.fr" --title="LETSGOSKI" --admin_user=${ADMIN} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root

# selfexplanatory
if ! wp user get ${USER} --path=/var/www/wordpress --allow-root > /dev/null 2>&1; then
    wp user create ${USER} ${USER_EMAIL} --role=author --user_pass=${USER_PASSWORD} --path=/var/www/wordpress --allow-root
else
    echo "User ${USER} already exists"
fi

#peffo
if ! wp theme is-installed dark-mode --path=/var/www/wordpress --allow-root; then
    wp theme install --allow-root dark-mode --activate
else
    echo "Theme 'dark-mode' is already installed and active"
fi

# Start PHP-FPM
php-fpm7.4 --nodaemonize