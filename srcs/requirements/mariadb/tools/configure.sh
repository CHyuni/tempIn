#!/bin/sh

mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db
mkdir -p /run/mysqld
mysqld &

    while ! mysqladmin ping; do
        sleep 1
    done

mysql -uroot --skip-password <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
FLUSH PRIVILEGES;
EOF

mysqladmin -uroot -p"$DB_ROOT_PASS" shutdown

exec mysqld