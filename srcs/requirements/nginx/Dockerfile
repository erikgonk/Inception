FROM alpine:3.21.4

EXPOSE 443

RUN apk update && \
    apk add --no-cache openrc && \
    apk add --no-cache nginx openssl &&\
    apk add --no-cache vim
    # apk add --no-cache nginx openssl php-fpm php-mysqli php-json php-session &&\

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=ES/ST=Catalunya/L=Barcelona/O=42/CN=erigonza.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/index.php /var/www/html/index.php

WORKDIR /var/www/html/


CMD ["nginx", "-g", "daemon off;"]
# CMD php-fpm83 -D && nginx -g "daemon off;"
