---

title: Home Smart Home
date: 2014-11-10 22:34:46.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- smarthome
- zwave
author: Oliver van Porten
redirect_from:
  - /2014/11/home-smart-home/

excerpt: In this post we look at how my new
    smart home setup.
header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/smarthome_870x580.png
---
End of last week I finally ordered the first few components to start my Smart-Home project. I am basing my setup on [Z-Wave](http://www.z-wave.com/ "Z-Wave") because I like the fact that it is an open standard plus there is a USB-controller I can plug into my [RaspberryPI](http://www.raspberrypi.org/).

I've now ordered the following components to get started. The goal is to automate illumination of our driveway plus yard:

*   [Z-Wave.me ZStick](http://www.z-wave.me/index.php?id=28)
*   2x [DuWi Switch](http://www.zwave4u.com/Switches-Dimmers/Switches/Duwi-Switch-Set-for-Duro-2000-DUW_05457::762.html)
*   Vision Security [ZP3102 PIR Sensor](http://www.pepper1.net/zwavedb/device/197)
*   [Z-Wave.me KFOB](http://www.z-wave.me/index.php?id=31)

The ZStick goes straight into my Raspberry and that then runs [openHAB](http://www.openhab.org/ "openHAB"). I am already positvely impressed by what openHAB can do. Configuring the binding is also straight forward so far - I have only attached the PIR sensor to trigger virtual light. I do hope to find the time to wire my two switch actors to the outdoor lighting this weekend. I'll post some pictures as work progresses.