#!/bin/sh

# while ! mariadb -h$SQL_HOST -u$SQL_USER_NAME -p$SQL_USER_PASSWORD; do
#     sleep 1
# done

if [ ! -f "/var/www/wordpress/index.php" ]; then
    cd /var/www/wordpress
    wp core download --allow-root
    wp config create --allow-root --dbname=$WP_DATABASE_NAME --dbuser=$SQL_USER_NAME --dbpass=$SQL_USER_PASSWORD --dbhost=$SQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci"
    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL
    wp user create --allow-root $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD
fi

service php7.4-fpm start
sleep infinity
