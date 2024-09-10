FROM alpine:3.18

RUN apk update && apk add --no-cache php81 php81-json \
    php81-mysqli php81-curl php81-dom php81-exif php81-pecl-imagick \
    php81-pecl-igbinary php81-intl php81-mbstring php81-openssl \
    php81-xml php81-fpm php81-zip php81-phar curl dumb-init
    
COPY ./tools/configure.sh .
RUN chmod +x ./configure.sh

RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
    /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;cgi.fix_pathinfo=1|cgi.fix_pathinfo=0|g" \
    /etc/php81/php.ini

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["./configure.sh"]