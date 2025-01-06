FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mariadb-server \
    mariadb-client \


# Copy the configuration script
COPY ./tools/ /tmp/script.sh

# ARG SQL_HOST
# ARG SQL_USER_NAME
# ARG SQL_USER_PASSWORD
# ARG SQL_ROOT_PASSWORD
# ARG WP_DATABASE_NAME

# Execute the script
RUN chmod +x /tmp/script.sh

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf 

ENTRYPOINT ["/tmp/script.sh"]

CMD ["mysqld_safe"]