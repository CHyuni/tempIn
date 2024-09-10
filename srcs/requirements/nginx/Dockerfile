FROM alpine:3.18

RUN apk update && apk add --no-cache nginx openssl dumb-init

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -out /etc/nginx/ssl/selfsigned.crt \
    -subj "/C=KR/ST=Gyeonsangbok-do/L=gyeonsan-si/O=Changhyu/OU=IT/CN=changhyu.42.fr"

RUN adduser -D -g 'www' www-data
RUN chown -R www-data:www-data /var/www/html

RUN rm -f /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["nginx", "-g", "daemon off;"]

