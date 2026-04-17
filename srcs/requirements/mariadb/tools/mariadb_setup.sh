#!/bin/bash
set -e

if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
	echo "DataBase already exist. Skipping setup..."
else
	echo "DataBase not found. Initializing..."

	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	mysqld_safe --datadir=/var/lib/mysql &

	echo "Waiting for MariaDB service"
	until mysqladmin ping -h localhost --silent; do
		echo -n "."
		sleep 1
	done
	echo

	mysql -u root -e "
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
		DELETE FROM mysql.user WHERE User='';
		DROP DATABASE IF EXISTS test;
		CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
		CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
		GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
		FLUSH PRIVILEGES;"

	echo "DataBase setup done !"

	mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
	wait
fi

echo "Starting MariaDB in foreground..."
exec mysqld_safe --datadir=/var/lib/mysql --user=mysql
