---
layout: post
title: Pylons and Apache with repoze.who BasicAuth
date: 2011-01-03 11:44:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- apache
- Pylons
- repoze
- web
- xmlrpc
author: Oliver van Porten
---
To be able to use Basic Authentification in repoze.who running in a wsgi app in your Apache installation, you need to tell Apache to **WSGIPassAuthorization**. An Apache configuration like this will do:

``` apache
# Setup mod_wsgi
WSGIPythonHome /var/www/pylons/runtime
WSGIScriptAlias /myApp /var/www/pylons/myApp/mod_wsgi/dispatch.wsgi
WSGIPassAuthorization On

<directory /var/www/pylons/myApp/mod_wsgi>
Order deny,allow
Allow from all
</directory>
```

The importanat part here is

```python
WSGIPassAuthorization On
```

This will pass HTTP authorisation headers through to the WSGI application.

Sources: [Repoze-dev Mailing List](http://www.mail-archive.com/repoze-dev@lists.repoze.org/msg02894.html), [modwsgi Wiki](http://code.google.com/p/modwsgi/wiki/ConfigurationDirectives#WSGIPassAuthorization)