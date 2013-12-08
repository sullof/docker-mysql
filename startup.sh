#/bin/bash

MYSQL_PASSWORD=$(cat /root/mysql_root_pwd.txt)
 
if [ ! -f /var/lib/mysql/ibdata1 ]; then
 
	mysql_install_db
 
	/usr/bin/mysqld_safe & sleep 10s
 
    mysqladmin -u root password '$MYSQL_PASSWORD' 
    mysql -u root -p'$MYSQL_PASSWORD' -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    killall mysqld
	
fi

rm -f /root/mysql_root_pwd.txt
