FROM alpine:3.21.4

EXPOSE 443

RUN apk update && \
    apk add --no-cache openrc && \
    apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=ES/ST=Catalunya/L=Barcelona/O=42/CN=erigonza.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/html/

CMD ["nginx", "-g", "daemon off;"]
