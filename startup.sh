#/bin/bash

# change it with your one and don't share it
MYSQL_PASSWORD=$(cat /root/mysql_root_pwd.txt)
 
if [ ! -f /var/lib/mysql/ibdata1 ]; then
 
	mysql_install_db
 
	/usr/bin/mysqld_safe &
	sleep 10s
 
	echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'mandelaIsDead:(' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
 
	killall mysqld
	sleep 10s
	
  # Here we generate random passwords (thank you pwgen!). The first two are for mysql users, the last batch for random keys in wp-config.php
  
  
  mysqladmin -u root password $MYSQL_PASSWORD 
  mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"
  killall mysqld
	
fi
 
/usr/bin/mysqld_safe