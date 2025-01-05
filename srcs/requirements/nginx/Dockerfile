FROM    debian:bullseye

RUN     apt-get update && apt-get upgrade && apt-get install -y \
        nginx \
        openssl

RUN     mkdir /etc/nginx/ssl

RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
                -out /etc/nginx/ssl/chuleung.pem \
                -keyout /etc/nginx/ssl/chuleung.key \
                -subj "/C=IT/ST=Paris/L=Paris/O=42 School/OU=chuleung/CN=leung/"

RUN     mkdir -p /run/nginx

COPY    conf/nginx.conf /etc/nginx/conf.d/default.conf

# RUN chmod 755 /var/www/wordpress
# RUN chown -R www-data:www-data /var/www/wordpress

ENTRYPOINT ["nginx", "-g", "daemon off;"]