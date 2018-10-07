---
layout: post
title: Fixing Boot Camp WiFi issues
date: 2016-05-09 21:33:20.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags: []
author: Oliver van Porten
---
After installing Windows 10 on my old MacBook Air I ran into some problems with my WiFi. Specifically, WiFi drops every so often when using Boot Camp. The network connection simply stalls for some time and then I would manually need to reconnect the connection to make it work again.

As it turns out, the solution that worked for me is quite simple: Going back to an older version of the Broadcom driver. Goto Device Manager, select "Network Adapater" and then pick the Broadcom 802.11n network adapter. The driver version used is probably something like 6.30.223.256.

[![2016-05-09 22_29_28-Clipboard]({{ site.baseurl }}/assets/2016-05-09-22_29_28-Clipboard-300x206.png)]({{ site.baseurl }}/assets/2016-05-09-22_29_28-Clipboard.png)

Select "Update Driver", then do "seach on this computer" and click on "select from list" From that list select version 5.106.199.1, click next - done.

[![Bootcamp]({{ site.baseurl }}/assets/2016-05-09-22_32_17-bootcamp-300x140.png)]({{ site.baseurl }}/assets/2016-05-09-22_32_17-bootcamp.png)