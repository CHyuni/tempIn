FROM alpine:3.18

RUN apk add --no-cache mariadb=10.11.8-r0 mariadb-client=10.11.8-r0 dumb-init

COPY ./conf/my.cnf /etc/my.cnf

COPY ./tools/configure.sh .
RUN chmod +x ./configure.sh

EXPOSE 3306
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["./configure.sh"]
