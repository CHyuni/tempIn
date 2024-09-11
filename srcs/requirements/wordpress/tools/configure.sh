#!/bin/sh

cd /var/www/html

wp core download --allow-root --version=6.6.1

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --skip-check

wp core install --url=$DOMAIN_NAME --title=$WP_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL

wp user create $USER_NAME $USER_EMAIL --user_pass=$USER_PASS

chown -R nginx:nginx /var/www/html
chmod -R 755 /var/www/html

/usr/sbin/php-fpm81 -F