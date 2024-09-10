#!/bin/sh
mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db
mkdir -p /run/mysqld
mysqld &

    while ! mysqladmin ping; do
        sleep 1
    done

    mysql -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
    mysqladmin -uroot -p"$MYSQL_ROOT_PASSWORD" shutdown

exec mysqld
