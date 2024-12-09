#!/bin/bash


# Check if /WebPage exist
if [ ! -d /WebPage ]; then
	echo "WebPage not found"
	exit 1
fi

# Check if /WebPage/card.html
if [ ! -f /WebPage/card.html ]; then
	echo "card.html not found"
	exit 1
fi

# Move /WebPage to /var/www/html
mv /WebPage /var/www/html
# Give permissions to /var/www/html
chown -R www-data:www-data /var/www/html/WebPage
# Check if /var/www/html/WebPage/card.html
if [ ! -f /var/www/html/WebPage/card.html ]; then
	echo "card.html not found"
	exit 1
fi

echo "WebPage moved to /var/www/html"