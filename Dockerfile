# Take a look at https://github.com/sullof/docker-sshd
FROM sullof/sshd

MANTAINER Francesco Sullo, sullof.com, sullof@gmail.com

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl
 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mysql-client mysql-server
 
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
 
# sullof/sshd uses supervisor and so with want just to append few lines to its config file
RUN echo "[program:mysqld]" >> /etc/supervisord.conf 
RUN echo "command=/usr/bin/mysqld_safe" >> /etc/supervisord.conf
 
ADD ./mysql_root_pwd.txt /root/mysql_root_pwd.txt 
ADD ./startup.sh /opt/startup.sh
  
EXPOSE 3306 22
 
CMD ["/bin/bash", "/opt/startup.sh"]