FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mariadb-server \
    mariadb-client

# Ensure the necessary directories exist
RUN mkdir -p /etc/my.cnf.d

# Copy the configuration script
COPY script/configure.sh /tmp/configure.sh

# Make the script executable
RUN chmod +x /tmp/configure.sh

# Expose the MySQL port
EXPOSE 3306

# Start MariaDB using the configuration script
ENTRYPOINT ["/tmp/configure.sh"]