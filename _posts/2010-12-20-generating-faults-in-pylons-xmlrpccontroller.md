---
layout: post
title: Generating Faults in Pylons XMLRPCController
date: 2010-12-20 18:22:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- Pylons
- Python
- web
- XML-RPC
author: Oliver van Porten
---
This might seem easy enough, but it took me a while to get it right since the Pylons documentation is a bit misleading here, really. It says you should use **xmlrpc\_fault** from **pylons.controllers.xmlrpc** but that's actually not working if you're doing something like:

``` python
from pylons.controllers.xmlrpc import xmlrpc_fault
...
return xmlrpc_fault( 101, "My Error" )
```

This will wrap an **xmlrpclib.Fault** into a **pylons.controllers.util.Reponse** object which will fail to marshal with something like:

``` python
TypeError: cannot marshal objects
```

The correct way to do it is:

``` python
import xmlrpclib
...
return xmlrpclib.Fault( 101, "My Error" )
```