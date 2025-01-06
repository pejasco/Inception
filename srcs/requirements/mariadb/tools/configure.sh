#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if true; then
	
	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr/sbin --datadir=/var/lib/mysql --user=mysql > /dev/null

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
		return 1
	fi
	cat << EOF > $tfile
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';

CREATE DATABASE $WP_DATABASE_NAME;
CREATE USER '$SQL_USER_NAME'@'%' IDENTIFIED by '$SQL_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$SQL_USER_NAME'@'%';

FLUSH PRIVILEGES;
EOF
	/usr/sbin/mysqld --user=mysql --bootstrap < $tfile
fi

service mariadb start
service mariadb stop

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
