FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mariadb-server \
    mariadb-client

COPY script/configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]