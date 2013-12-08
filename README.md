### Docker-mysql

This project starts from [Creating a MySQL Docker Container](http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/) 
by [Ben Schwartz](https://twitter.com/benhschwartz) and adds something : )

### How to use

Edit mysql_root_pwd.txt and set your password for mysql root. You don't want to generate a random password because we will 
use a local folder for MySQL database, in order to have the persistence of data.

Build the image choosing a tag for it. In my case I use ```sullof/mysql``` and I build the image with the following command:

```
docker build -t sullof/mysql .
```

Edit the ```run-client.sh``` file and change the value of the variable TAG as well.

Create the local folder you want to use and link it to the folder where MySQL. 
In my case I created ```/data/mysql```.

Run the container with a command like this:

```
docker run -d -p 3306:3306 -v /data/mysql:/var/lib/mysql sullof/mysql
```

Run ```run-client.sh``` to see the IP of the container and enjoy it!