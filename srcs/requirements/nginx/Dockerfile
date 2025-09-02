FROM alpine:3.21.4

RUN apk update && apk upgrade && apk add nginx \  
			&& apk add vim && apk add bash

COPY default.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
