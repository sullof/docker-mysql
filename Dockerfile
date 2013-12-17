FROM sullof/sshd

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl
 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get -y install mysql-client mysql-server
RUN apt-get clean
 
#RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Supervisor Config
# Consider that supervisord is installed and configured by sullof/sshd.
# We only need to append something to the existent file.
ADD adds/supervisord.conf /etc/supervisord.conf.tmp
RUN cat /etc/supervisord.conf.tmp >> /etc/supervisord.conf && rm /etc/supervisord.conf.tmp
 
ADD adds/container.conf /root/container.conf
ADD adds/start.sh /root/start.sh
RUN chmod +x /root/start.sh
 
EXPOSE 3306 22
 
CMD ["/root/start.sh"]