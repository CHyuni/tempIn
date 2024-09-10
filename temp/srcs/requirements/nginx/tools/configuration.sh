#!/bin/sh
    mkdir /etc/nginx/ssl
    openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
            -subj "/C=KR/ST=Gyeongsangbuk-do/L=Gyeongsan/O=42Gyeongsan/OU=cadet/CN=taejikim" \
            -keyout /etc/nginx/ssl/taejikim.key -out /etc/nginx/ssl/taejikim.crt
    mkdir -p /run/nginx

nginx -g "daemon off;"
