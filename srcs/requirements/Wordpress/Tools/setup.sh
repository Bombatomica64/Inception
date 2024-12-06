#!/bin/sh

set -e

WP_PATH=/var/www/html

cd $WP_PATH

# Download WordPress core
if [ ! -f "$WP_PATH/wp-config.php" ]; then
    echo "Downloading WordPress core..."
    wp core download --allow-root
    echo "Creating wp-config.php..."
    wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root
    echo "Installing WordPress..."
    wp core install --url=${DOMAIN} --title="LETSGOSKI" --admin_user=${ADMIN} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root
else
    echo "WordPress core already downloaded."
    echo "wp-config.php already exists."
    echo "WordPress is already installed."
fi

# Create a user if it doesn't exist
if ! wp user get ${USER} --path=$WP_PATH --allow-root > /dev/null 2>&1; then
    echo "Creating user ${USER}..."
    wp user create ${USER} ${USER_EMAIL} --role=author --user_pass=${USER_PASSWORD} --path=$WP_PATH --allow-root
else
    echo "User ${USER} already exists."
fi

# Install and activate a theme if it's not already installed
if ! wp theme is-installed dark-mode --path=$WP_PATH --allow-root; then
    echo "Installing and activating theme 'dark-mode'..."
    wp theme install --allow-root dark-mode --activate
else
    echo "Theme 'dark-mode' is already installed and active."
fi

sleep 100

# Start PHP-FPM
php-fpm7.4 -F