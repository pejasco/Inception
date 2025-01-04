FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    curl \
    bash \
    vim \
    mariadb-client \
    php \
    php-phar \
    php-json \
    php-curl \
    php-fpm \
    php-mysqli \
    php-iconv \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y wget

# Ensure the group and user are created if they don't already exist
RUN groupadd -r nginx || true && useradd -r -g nginx nginx || true

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html

COPY script/configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]