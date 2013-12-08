#/bin/bash

MYSQL_PASSWORD=$(cat /root/mysql_root_pwd.txt)
 
if [ ! -f /var/lib/mysql/ibdata1 ]; then
 
	mysql_install_db
 
	/usr/bin/mysqld_safe & sleep 10s
 
    mysqladmin -u root password $MYSQL_PASSWORD 
    
    killall mysqld
	
fi

/usr/local/bin/supervisord -n