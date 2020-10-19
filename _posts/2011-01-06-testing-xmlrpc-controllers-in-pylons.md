---

title: Testing XMLRPC Controllers in Pylons
date: 2011-01-06 13:34:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- Pylons
- Python
- webtest
- xmlrpc
- XMLRPCController
author: Oliver van Porten
redirect_from:
  - /2011/01/testing-xmlrpc-controllers-in-pylons/

excerpt: In this post we look at testing XMLRPC Controllers in Pylons

header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/keyboard_870x580.png
---
Testing is one of the essential tasks in modern software development, so it is only natural to want to test an application as thoroughly as possible.

I'm currently working on an application that offers a service via xmlrpc. For a client side implementaion I use python's [xmlrpclib](http://docs.python.org/library/xmlrpclib.html) and that is working well. Then again, I obviously want to test the xmlrpc functionality also during regular unit and functional tests and not only using the client. What's more, having to instantiate a server to be able to run tests is cumbersome at best.

Unfortunatly, Pylons does not offer a method to test xmlrpc controllers out of the box. The solution I found is not quite as complicated as I had feared at first. Read more after the break.

For the above mentiond reasons, here is my solution for testing a XMLRPCController in Pylons using a mock transport for xmlrpclib.

This solution is largely based on the excellent post by [Jean Schruger on his Blog](http://schurger.org/wordpress/2009/12/unit-tests-with-pylons-and-its-xmlrpccontroller/) .

``` python
from myapp.tests import *

import sys
from StringIO import StringIO
import xmlrpclib
from xmlrpclib import ServerProxy

class WSGILikeHTTP(object):
  def __init__(self, host, app):
    self.app = app
    self.headers = {}
    self.content = StringIO()

  def putrequest(self, method, handler):
    self.method = method
    self.handler = handler

  def putheader(self, key, value):
    self.headers[key] = value

  def endheaders(self):
    pass

  def send(self, body):
    self.body = body

  def getfile(self):
    return self.content

  def getreply(self):
    if self.method == "POST":
      r = self.app.post(self.handler,
                        headers = self.headers,
                        params = self.body )
      self.content = StringIO(r.response.unicode_body)
    return (200, None, None)

class WSGIAppTransport(xmlrpclib.Transport):
  # Only here to pass the 'app'
  def __init__(self, app):
    xmlrpclib.Transport.__init__(self)
    self.app = app

  # return the fake httplib.HTTP(host)
  def make_connection(self, host):
    host, extra_headers, x509 = self.get_host_info(host)
    return WSGILikeHTTP(host, self.app)

class TestXmlrpcController(TestController):

    def test_index(self):
      server = ServerProxy('http://admin:admin@dummy/xmlrpc',
                            transport=WSGIAppTransport(self.app))
      print >> sys.stderr, server.system.listMethods()
```