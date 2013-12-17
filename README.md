Docker-mysql
============

This project starts from [Creating a MySQL Docker Container](http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/) 
by [Ben Schwartz](https://twitter.com/benhschwartz) and adds something : )

# Requirements

### [docker-sshd](https://github.com/sullof/docker-sshd)

This forked project starts ```FROM sullof/sshd```, so first off you must build the image sullof/sshd starting from 
[docker-sshd](https://github.com/sullof/docker-sshd).

Though, if you don't need a ssh connection, you can edit the ```Dockerfile```, change the first line to ```FROM ubuntu:12.04```, 
and remove the port 22 from the ```EXPOSE``` command. 

### [startie](https://github.com/sullof/startie) 

Startie is a simple bash script to recover the correct association between a local hostname and the IP of a container, 
for example after a server reboot. If you don't want to use it, remove last line from ```run.sh```.

## How to use

Edit /adds/container.conf and set your password for the user admin. You don't want to generate a random password because we will 
use a local folder for MySQL database, in order to have the persistence of data.

Edit the file image.conf to choose repository and tag. Execute the following code:

```bash
$ chmod +x *.sh
$ ./build
$ ./run
```
If the tag you chose is _database_, you can connect to your container with something like:
```
$ mysql -u admin -p -h database.local
```

## License 

(The MIT License)

Copyright (c) 2013 Francesco Sullo <sullof@sullof.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.