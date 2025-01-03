FROM    debian:bulleye

RUN     apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY    script/configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]