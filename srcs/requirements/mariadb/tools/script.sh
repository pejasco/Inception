#!/bin/sh

# Ensure the necessary directories exist and have correct permissions
if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

# Ensure database directories have correct permissions
chown -R mysql:mysql /var/lib/mysql

# Initialize the database if it hasn't been initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initialising MySQL database..."
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null
fi

# Start the MySQL service
echo "Starting MySQL service..."
service mysql start

# Configure the database with the provided environment variables
tfile=$(mktemp)
if [ ! -f "$tfile" ]; then
    echo "Error creating temporary file!"
    exit 1
fi

cat <<EOF > $tfile
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${WP_DATABASE_NAME};
CREATE USER IF NOT EXISTS '${SQL_USER_NAME}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WP_DATABASE_NAME}.* TO '${SQL_USER_NAME}'@'%';

# WordPress admin user
CREATE USER IF NOT EXISTS '${WP_ADMIN_USR}'@'%' IDENTIFIED BY '${WP_ADMIN_PWD}';
GRANT ALL PRIVILEGES ON ${WP_DATABASE_NAME}.* TO '${WP_ADMIN_USR}'@'%';
FLUSH PRIVILEGES;
EOF

# Bootstrap the MySQL database
/usr/sbin/mysqld --user=mysql --bootstrap < $tfile

# Modify configuration to allow remote connections
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

# Shutdown MySQL to finalize setup
mysqladmin -u${SQL_USER_NAME} -p${SQL_USER_PASSWORD} shutdown




# #!/bin/sh

# if [ ! -d "/run/mysqld" ]; then
# 	mkdir -p /run/mysqld
# 	chown -R mysql:mysql /run/mysqld
# fi

# if true; then
	
# 	chown -R mysql:mysql /var/lib/mysql

# 	# init database
# 	mysql_install_db --basedir=/usr/sbin --datadir=/var/lib/mysql --user=mysql > /dev/null

# 	tfile=`mktemp`
# 	if [ ! -f "$tfile" ]; then
# 		return 1
# 	fi
# 	cat << EOF | envsubst > $tfile
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
# CREATE DATABASE $WP_DATABASE_NAME;
# CREATE USER '$SQL_USER_NAME'@'%' IDENTIFIED by '$SQL_USER_PASSWORD';
# GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$SQL_USER_NAME'@'%';
# FLUSH PRIVILEGES;
# EOF
# 	/usr/sbin/mysqld --user=mysql --bootstrap < $tfile
# fi

# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
