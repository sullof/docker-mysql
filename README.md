### Docker-mysql

This image is build starting from [Creating a MySQL Docker Container](http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/) by [Ben Schwartz](https://twitter.com/benhschwartz).

### How to use

Edit startup.sh, find the MySQL admin's password (now it is ```mandelaIsDead:(```) and change it.

Build the image choosing a tag for it. In my case, using ```sullof/mysql```, I would build the image with the following command:

```
docker build -t sullof/mysql .
```

Edit the ```run-client.sh``` file and change the TAG value.

Create the local folder you want to use and link it to the folder where MySQL. In my case I created ```/data/mysql```.
```
Run the container with something like this:

```
docker run -d -p 3306:3306 -v /data/mysql:/var/lib/mysql sullof/mysql
```
