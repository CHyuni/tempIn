#!/bin/sh

mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db
mkdir -p /run/mysqld
mysqld &

    while ! mysqladmin ping; do
        sleep 1
    done

mysql -uroot <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;
GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysqladmin -uroot -p"$MARIADB_ROOT_PASSWORD" shutdown

exec mysqld