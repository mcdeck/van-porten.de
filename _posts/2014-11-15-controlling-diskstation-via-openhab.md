---

title: Controlling Diskstation via openHAB
date: 2014-11-15 23:47:59.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- network
- smarthome
author: Oliver van Porten
redirect_from:
  - /2014/11/controlling-diskstation-via-openhab/

excerpt: In this post we look at how to control a
    Synology Diskstation via openHAB.
header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/smarthome.png
---
While building my Smart Home system I figured I might as well attach my Diskstation DS212 to the controls so I can turn it on and off at will. To make this work, I used the [exec binding](https://github.com/openhab/openhab/wiki/Exec-Binding), the [network health binding](https://github.com/openhab/openhab/wiki/Network-Health-Binding) and the [WOL binding](https://github.com/openhab/openhab/wiki/Wake-on-LAN-Binding-%28WoL%29) combined into one neat little Switch:

``` text
Switch DS212 "DiskStation DS212" (Network) {
 nh="192.168.0.19", 
 exec="OFF:plink root@192.168.0.19 -pw password poweroff", 
 wol="192.168.0.255#00:11:32:0F:7F:2C" }
```

The corresponding sitemap entry look like this then:

``` text
Frame label="Network" {
 Switch item=DS212
}
```