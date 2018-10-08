---
layout: post
title: Making Bugzilla run on Windows with XAMPP
date: 2010-07-05 07:41:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- bugzilla
- server
- xampp
author: Oliver van Porten
redirect_from:
  - /2010/07/making-bugzilla-run-on-windows-with-xampp/
---
I was struggling a bit with making Bugzilla 2.2 work on my Windows XAMPP. I kept getting error about child processes not being able to start. The logs said this:

``` text
[Mon Jul 05 09:04:38 2010] [error] [client 127.0.0.1] (OS 3)The system cannot find the path specified. : couldn't create child process: 720003: index.cgi

[Mon Jul 05 09:04:38 2010] [error] [client 127.0.0.1] (OS 3)The system cannot find the path specified. : couldn't spawn child process: C:/xampp/htdocs/bugzilla/index.cgi
```

Ths solution is actually pretty straigt-forward, once you know it.  
First, add a registry key:

``` text
HKEY_CLASSES_ROOT.cgiShellExecCGICommand
```

and change it's default value to:

``` console
C:\xampp\perl\bin\perl.exe -T
```

Adjust to your system's paths, of course. You can use [this .reg file](http://www.van-porten.de/wp-content/uploads/2010/07/apache_cgi.zip) if you have installed into _c:\\xampp_ or you can copy and paste from here:

``` text
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT.cgiShellExecCGICommand]
@="C:\xampp\perl\bin\perl.exe -T"
``` 

Then, edit your httpd.conf (e.g. c:\\xampp\\apache\\conf\\httpd.conf) and add these lines:

``` apache
<directory "C:/xampp/htdocs/bugzilla">
  AddHandler cgi-script .cgi
  Options +Indexes +ExecCGI
  DirectoryIndex index.cgi
  AllowOverride Limit

  # To enable the this Windows specific behavior (and therefore -disable- the
  # equivilant Unix behavior), uncomment the following directive:
  #
  ScriptInterpreterSource registry
```

The important part here is **ScriptInterpreterSource registry**. It will make Apache pick up the interpreter from the registry rather then from the Shebang in the bugzilla cgi scripts. (see also [http://httpd.apache.org/docs/2.0/mod/core.html#scriptinterpretersource](http://httpd.apache.org/docs/2.0/mod/core.html#scriptinterpretersource)).

This is necessary since there is no

``` bash
#!/usr/bin/perl -wT
```

on your windows system.
