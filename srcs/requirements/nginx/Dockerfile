FROM alpine:3.16

RUN apk add --no-cache nginx openssl \
    --upgrade --no-cache ca-certificates && \
    mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx
COPY conf/localhost.crt /etc/nginx/ssl
COPY conf/localhost.key /etc/nginx/ssl
COPY index.html /usr/share/nginx/html

RUN cp /etc/nginx/ssl/localhost.crt /usr/local/share/ca-certificates && \
    update-ca-certificates

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
