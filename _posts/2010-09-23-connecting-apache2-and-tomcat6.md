---

title: Connecting Apache2 and Tomcat6
date: 2010-09-23 19:48:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- apache
- grails
- linux
- server
- tomcat
- ubuntu
- web
author: Oliver van Porten
redirect_from:
  - /2010/09/connecting-apache2-and-tomcat6/
---
If you ever need to serve Tomcat applications through Apache2, here is a quick guide on how to do this on Ubuntu.

First, install [mod-jk](http://tomcat.apache.org/connectors-doc/):

``` bash
sudo apt-get install libapache2-mod-jk
sudo a2enmod jk
```

Then, edit _workers.properties_

``` bash
sudo vi /etc/libapache2-mod-jk/workers.properties
``` 

and adapt the following values (assuming you have installed the openjdk):

``` apache
workers.tomcat_home = /usr/share/tomcat6
workers.java_home = /usr/lib/jvm/java-6-openjdk
```

Then, mount the site using _JkMount_. Do

``` bash
sudo vi /etc/apache2/sites-enabled/000-default
```

and then add the following line

``` apache
JkMount /path/to/app/* ajp13_worker
``` 

And update the mod-jk settings in _jk.load_. do

``` bash
sudo vi /etc/apache2/mods-available/jk.load
```

and update to file to read like this

``` apache
LoadModule jk_module /usr/lib/apache2/modules/mod_jk.so
JkWorkersFile /etc/libapache2-mod-jk/workers.properties
JkLogFile /var/log/apache2/mod_jk.log
JkLogLevel error
```

Update the _server.xml_ with

``` bash
sudo vi /etc/tomcat6/server.xml
```

and then uncommenting the line

``` xml
<connector port="8009" protocol="AJP/1.3" redirectPort="8443" />
```

Finally, restart the services

``` bash
sudo /etc/init.d/apache2 restart
sudo /etc/init.d/tomcat6 restart
```

**References**

[http://www.docshare.com/doc/197611/Installing-Tomcat6-on-Ubuntu-with-Jk-Connecto](http://www.docshare.com/doc/197611/Installing-Tomcat6-on-Ubuntu-with-Jk-Connecto)

[http://ubuntuforums.org/showthread.php?t=422472](http://ubuntuforums.org/showthread.php?t=422472)

[http://rcpeters.blogspot.com/2009/05/installing-apache2-and-tomcat6-on.html](http://rcpeters.blogspot.com/2009/05/installing-apache2-and-tomcat6-on.html)