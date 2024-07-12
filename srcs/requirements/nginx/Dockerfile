FROM alpine:3.19

RUN apk add --no-cache nginx openssl && \
    mkdir -p /etc/nginx/ssl


COPY conf/nginx.conf /etc/nginx
COPY conf/asoler.42.fr.crt /etc/nginx/ssl
COPY conf/asoler.42.fr.key /etc/nginx/ssl
COPY index.html /usr/share/nginx/html/

RUN echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/index.php

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
