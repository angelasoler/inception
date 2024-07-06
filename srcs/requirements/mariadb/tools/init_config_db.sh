#!/bin/bash
set -e

echo "Starting MariaDB server..."
mysql_install_db --user=mysql --datadir=/var/lib/mysql

sleep 5


if [ -f /etc/mysql/init.sql ]; then
    echo "Initializing database with custom script..."
    #TO-DO adicionar credenciais
    # mysql -h localhost -u root -p < init.sql
    # Enter password: 
    # ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2)
    # mysql -h localhost -u root -p < /etc/mysql/init.sql
fi

echo "MariaDB server is ready."