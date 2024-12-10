#!/bin/bash

set -e

if [ ! -f /etc/ftp/ssl/private_key.key ]; then
	mkdir -p /etc/ftp/ssl

	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ftp/ssl/private_key.key -out /etc/ftp/ssl/public_key.crt -subj "/C=IT/ST=IT/L=FLORENCE/O=42/OU=1337/CN=gduranti"
fi

echo "WordPress is ready!"

if id -u "$FTP_USER" >/dev/null 2>&1; then
	echo "Ready to go!"
else
	useradd -m $FTP_USER

	echo  $FTP_USER:$FTP_PASSWORD | /usr/sbin/chpasswd

	chmod -R 755 /var/www/html

	chown -R $FTP_USER:$FTP_USER /var/www/html

	echo "${FTP_USER}" >> /etc/vsftpd.userlist

	mkdir -p /var/run/vsftpd/empty
fi

vsftpd /etc/vsftpd.conf