FROM alpine:3.19

RUN apk update && apk upgrade && \
    apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-phar \
    php-iconv \
    php83-mbstring \
    mariadb-client \
    curl \
    wget \
    tar \
    supervisor

RUN mkdir -p /var/www/html && \
    curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -zxvf wordpress.tar.gz --strip-components=1 -C /var/www/html && \
    rm wordpress.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN apk add 

RUN ln -s /usr/bin/php83 /usr/bin/php && \
    ln -s /usr/sbin/php-fpm83 /usr/sbin/php-fpm

RUN adduser -S -G www-data www-data && \
    chown -R www-data:www-data /var/www/html

COPY conf/php-fpm.conf /etc/php83/php-fpm.d/www.conf

COPY tools/setup /usr/bin/setup

WORKDIR /var/www/html

EXPOSE 443

CMD setup
