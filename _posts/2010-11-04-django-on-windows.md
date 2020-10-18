---

title: Django on Windows
date: 2010-11-04 12:24:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- Django
- Python
- Windows
author: Oliver van Porten
redirect_from:
  - /2010/11/django-on-windows/

excerpt: In this post we look at running Django on Windows
---
To more easily use [Django](http://www.djangoproject.com/) on Windows, create a dos .bat file in Django's **bin** directory named **django-admin.bat** with the following content:

``` console
@%~dp0\..\..\..\..\python.exe %~dp0\django-admin.py %\*
```

and add Django's bin directory to your **PATH**:

``` console
set DJANGO_HOME=C:\Development\tools\Python25\Lib\site-packages\django
set PATH=%DJANGO_HOME%\bin;%PATH%
```

You can now use **django-admin** from anywhere without specifying the full path.

(I kept getting _ImportError: No module named django.core_ when trying to invoke _django-admin.py_ from the commandline)