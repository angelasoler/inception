FROM alpine:3.19

ENV MARIADB_DATA_DIR=/var/lib/mysql
ENV MARIADB_RUN_DIR=/run/mysqld
ENV MARIADB_LOG_DIR=/var/log/mysql
ENV MYSQL_DB=WordPressDB
ENV MYSQL_USER=asoler
ENV MYSQL_PASSWORD=softpass
ENV MYSQL_HOST=127.0.0.1

RUN apk update && apk upgrade && \
    apk add --no-cache \
    mariadb \
    mariadb-client \
    gettext && \
    mkdir -p $MARIADB_DATA_DIR $MARIADB_RUN_DIR $MARIADB_LOG_DIR && \
    chown -R mysql:mysql $MARIADB_DATA_DIR $MARIADB_RUN_DIR $MARIADB_LOG_DIR && \
    rm -rf /var/cache/apk/*

COPY tools/setup /usr/bin/setup
RUN chmod +x /usr/bin/setup

COPY conf/init.sql.template /etc/mysql/
RUN envsubst < /etc/mysql/init.sql.template > /etc/mysql/init.sql

COPY conf/my.cnf /etc/

EXPOSE 3306

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN setup

CMD ["mariadbd-safe"]
