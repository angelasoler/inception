FROM alpine:3.19

RUN apk update && apk upgrade && \
    apk add --no-cache \

    curl \
    wget \
    tar \
    supervisor

RUN mkdir -p /var/www/html

RUN apk add

RUN adduser -S -G www-data www-data && \
    chown -R www-data:www-data /var/www/html

COPY arquivo_1.html /var/www/html
COPY arquivo_2.html /var/www/html
COPY projects /var/www/html

COPY tools/setup /usr/bin/setup

WORKDIR /var/www/html

EXPOSE 443

CMD setup
