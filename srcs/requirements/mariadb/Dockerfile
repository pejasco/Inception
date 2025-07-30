FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mariadb-server \
    mariadb-client

# Copy the configuration script
COPY --chmod=755 ./tools/ /tmp/

ARG SQL_HOST
ARG SQL_USER_NAME
ARG SQL_USER_PASSWORD
ARG SQL_ROOT_PASSWORD
ARG WP_DATABASE_NAME

# Execute the script
RUN /tmp/configure.sh

# Expose the MySQL port
EXPOSE 3306

# Start MariaDB using the configuration script
ENTRYPOINT ["/tmp/run.sh"]
