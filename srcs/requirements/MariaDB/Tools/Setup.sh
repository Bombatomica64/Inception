#!/bin/bash

set -e

env

FIRST=1

if [ ! -d /var/lib/mysql/mysql ]; then
    echo "Initializing MariaDB data directory"
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
else
	echo "MariaDB data directory already initialized"
	FIRST=0
fi


mysqld --user=mysql --datadir=/var/lib/mysql --pid-file=/var/run/mysqld/mysqld.pid &
pid="$!"


# Wait for MariaDB to start
until mysqladmin ping --silent; do
	sleep 1
done

DB_PASS="-p${MYSQL_ROOT_PASSWORD}"

# Database Setup
if [ ! "${FIRST}" -eq "1" ]; then
	DB_PASS=""
	echo "First time setup"
else
	mysql_upgrade -u root -p"${MYSQL_ROOT_PASSWORD}" --force
	echo "Not first time setup"
fi

echo "DB_PASS: $DB_PASS"

mysql -u root "${DB_PASS}" <<EOSQL

	CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

	GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
	FLUSH PRIVILEGES;

	CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	ALTER USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
	FLUSH PRIVILEGES;


EOSQL

kill "$pid"

wait "$pid"

"$@"