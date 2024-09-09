FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client dumb-init

COPY ./conf/my.cnf /etc/my.cnf

COPY ./tools/configure.sh .
RUN chmod +x ./configure.sh

EXPOSE 3306
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["./configure.sh"]
