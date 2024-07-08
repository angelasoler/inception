FROM alpine:3.16

ENV MARIADB_DATA_DIR=/var/lib/mysql
ENV MARIADB_RUN_DIR=/run/mysqld
ENV MARIADB_LOG_DIR=/var/log/mysql

RUN apk update && apk upgrade &&\
    apk add --no-cache \
    mariadb \
    mariadb-client &&\
    mkdir -p $MARIADB_DATA_DIR $MARIADB_RUN_DIR $MARIADB_LOG_DIR && \
    chown -R mysql:mysql $MARIADB_DATA_DIR $MARIADB_RUN_DIR $MARIADB_LOG_DIR && \
    rm -rf /var/cache/apk/*

COPY tools/init.sql /etc/mysql/init.sql
RUN chmod +x /etc/mysql/init.sql

EXPOSE 3306

#TO-DO adicionar credenciais
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN mysqld_safe --datadir='/var/lib/mysql' & \
    sleep 10 && \
    mysql -u root -e "source /etc/mysql/init.sql" && \
    mysqladmin -u root shutdown

CMD ["mariadbd-safe"]
