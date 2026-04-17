#!/bin/bash

set -e

echo "WordPress setup script started."
timeout=60
echo -n "Connecting to mariadb."
while ! mysql -h mariadb -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SELECT 1;" > /dev/null 2>&1; do
    timeout=$((timeout-1))
    if [ $timeout -eq 0 ]; then
		echo
        echo "Unable to connect to MariaDB. Aborting."
        exit 1
    fi
    echo -n "."
    sleep 1
done
echo "MariaDB is ready."

TARGET_DIR="/var/www/html"
if [ ! -d "${TARGET_DIR}" ]; then
    echo "ERROR: Directory ${TARGET_DIR} not found."
    exit 1
fi
cd "${TARGET_DIR}"

ls -la
if [ -f "wp-config.php" ]; then
    echo "WordPress already installed !"
else
    echo "WordPress not found. Install..."
    wp core download --allow-root
    wp config create --dbname="${MYSQL_DATABASE}" \
                     --dbuser="${MYSQL_USER}" \
                     --dbpass="${MYSQL_PASSWORD}" \
                     --dbhost=mariadb \
                     --allow-root
    wp core install --url="${DOMAIN_NAME}" \
                    --title="${WP_TITLE}" \
                    --admin_user="${WP_ADMIN_USER}" \
                    --admin_password="${WP_ADMIN_PASSWORD}" \
                    --admin_email="${WP_ADMIN_EMAIL}" \
                    --allow-root
    wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
                   --role=author \
                   --user_pass="${WP_USER_PASSWORD}" \
                   --allow-root
    echo "WordPress installation finished."
fi

exec /usr/sbin/php-fpm8.2 -F
