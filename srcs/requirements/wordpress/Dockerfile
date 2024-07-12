FROM alpine:3.19

RUN apk update && apk upgrade && \
    apk add --no-cache \
    php8 \
    php8-fpm \
    php8-mysqli \
    mariadb-client \
    curl \
    wget \
    tar \
    supervisor

RUN mkdir -p /var/www/html && \
    curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -zxvf wordpress.tar.gz --strip-components=1 -C /var/www/html && \
    rm wordpress.tar.gz

COPY conf/php-fpm.conf /etc/php8/php-fpm.d/www.conf
COPY conf/supervisord.conf /etc/supervisord.conf

RUN adduser -S -G www-data www-data && \
    chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
