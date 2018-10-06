---
layout: post
title: Singleton Pattern in Python
date: 2007-06-11 14:50:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags: []
author: Oliver van Porten
---
I was looking for a smooth way to create singletons in python. Here is a metaclass solution that seems to work:

``` python
class Singleton(type):

    def __init__(cls, name, bases, dic):
        super(Singleton,cls).__init__(name,bases,dic)
        cls.instance = None

    def __call__(cls, *args, **kw):
        if cls.instance is None:
            cls.instance = super(Singleton,cls).__call__(*args, **kw)
        return cls.instance
```

This was originally posted by Michele Simionato as a comment on a python singleton recipe on [http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/102187](http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/102187)

You use it like this:

``` python 
class A( object ):
  __metaclass__ = Singleton
  # here goes the rest of you class definiton ..
```

But you knew that anyway, didn't you? ;)