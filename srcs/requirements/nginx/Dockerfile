FROM alpine:3.18

RUN apk update && apk add --no-cache nginx openssl dumb-init

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -out /etc/nginx/ssl/selfsigned.crt \
    -subj "/C=KR/ST=Gyeonsangbok-do/L=gyeonsan-si/O=Changhyu/OU=IT/CN=changhyu.42.fr"

RUN rm -f /etc/nginx/http.d/default.conf
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["nginx", "-g", "daemon off;"]

