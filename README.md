3# This is still a work in progress and doesn't currently work. Wait that I complete it, please :) 


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

Create the local folder you will use for MySQL's data. 
In my case I will create ```/data/mysql``` on the server.

Edit the file ```run.sh``` and change the values of LOCAL_FOLDER and TAG. Make it executable with ```chmod +x run.sh``` and execute it to have the IP of the container.

You have done, enjoy it!