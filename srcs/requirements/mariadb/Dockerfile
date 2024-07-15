FROM alpine:3.19

ENV MARIADB_DATA_DIR=/var/lib/mysql
ENV MARIADB_RUN_DIR=/run/mysqld
ENV MARIADB_LOG_DIR=/var/log/mysql
#TO-DO retira env vars daqui
ENV MYSQL_DB=WordPressDB
ENV MYSQL_USER=asoler
ENV MYSQL_PASSWORD=softpass

RUN apk update && apk upgrade && \
    apk add --no-cache \
    mariadb \
    mariadb-client && \
    mkdir -p $MARIADB_DATA_DIR $MARIADB_RUN_DIR $MARIADB_LOG_DIR && \
    chown -R mysql:mysql $MARIADB_DATA_DIR $MARIADB_RUN_DIR $MARIADB_LOG_DIR && \
    rm -rf /var/cache/apk/*

COPY tools/setup /usr/bin/setup

COPY conf/my.cnf /etc/

EXPOSE 3306

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN setup

USER mysql

CMD  mysqld_safe
