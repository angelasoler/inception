FROM alpine:3.16

ENV MARIADB_DATA_DIR /var/lib/mysql
ENV MARIADB_RUN_DIR /run/mysqld
ENV MARIADB_LOG_DIR /var/log/mysql

RUN apk update && \
    apk add --no-cache \
    mariadb \
    mariadb-client && \
    mkdir -p $MARIADB_DATA_DIR $MARIADB_RUN_DIR $MARIADB_LOG_DIR && \
    chown -R mysql:mysql $MARIADB_DATA_DIR $MARIADB_RUN_DIR $MARIADB_LOG_DIR && \
    rm -rf /var/cache/apk/*

COPY tools/init.sql /etc/mysql/init.sql
RUN chmod +x /etc/mysql/init.sql

EXPOSE 3306

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
    sleep 5 && \
    mysql -h localhost -u root -p < /etc/mysql/init.sql

CMD ["mariadbd_safe"]
