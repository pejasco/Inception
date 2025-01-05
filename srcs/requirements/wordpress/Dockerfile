FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    curl \
    wget \
    ca-certificates \
    mariadb-client \
    php7.4 \
    php7.4-phar \
    php7.4-json \
    php7.4-curl \
    php7.4-fpm \
    php7.4-mysqli \
    php7.4-iconv \
    && rm -rf /var/lib/apt/lists/*

# Ensure the group and user are created if they don't already exist
RUN groupadd -r nginx || true && useradd -r -g nginx nginx || true

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN cp wp-cli.phar /usr/bin/wp

COPY --chmod=755 ./tools/ /tmp/

ENTRYPOINT ["/tmp/configure.sh"]