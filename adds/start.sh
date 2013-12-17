#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
 
	. /root/container.conf
	
	chown mysql:mysql /var/run/mysqld/
	
	mysql_install_db
	/usr/bin/mysqld_safe & 
	
	# wait that mysql starts
	sleep 5s
	
	mysql -e "grant all privileges on *.* to  'admin'@'localhost' identified by '$ADMIN_PASSWORD'; flush privileges"
	mysql -e "grant all privileges on *.* to  'admin'@'%' identified by '$ADMIN_PASSWORD'; flush privileges"
	
	killall mysqld
fi
 
# start all the services
/usr/local/bin/supervisord -n
