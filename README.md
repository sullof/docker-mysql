Docker-mysql
============

This project starts from [Creating a MySQL Docker Container](http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/) 
by [Ben Schwartz](https://twitter.com/benhschwartz) and adds something : )

## How to use

Edit /adds/container.conf and set your password for the user admin. You don't want to generate a random password because we will 
use a local folder for MySQL database, in order to have the persistence of data.

Edit the file image.conf to choose repository and tag. Execute the following code:

```bash
$ chmod +x *.sh
$ ./build
$ ./run
```
Now you can connect to your container with something like:
```
$ mysql -u admin -p -h database.local
```

## Known problems

After a while, sometimes, the mysqld process crashes. It need some fixes :)

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