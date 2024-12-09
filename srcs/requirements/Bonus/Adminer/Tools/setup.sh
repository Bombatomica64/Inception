#!/bin/bash

wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

# Start PHP-FPM
php-fpm7.4 -F