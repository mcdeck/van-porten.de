---

title: Resetting Z-Wave devices
date: 2015-01-29 14:41:26.000000000 +01:00
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
  - /2015/01/resetting-z-wave-devices/

excerpt: In this post we look at how reset zwave devices

---
Since I bought a new Z-Wave controller recently ([ZME\_UZB which support Z-Wave PLUS](http://www.z-wave.me/index.php?id=28 "ZME_UZB")) I was now facing an issue there I needed to remove a device from my old controller (ZME\_Z-StickC). However, I did not have the old controller available.

Including Z-Wave devices that are already registered with another Z-Wave network does not work immediately. The device needs to be factory reset first.

**Resetting the device is easy also without the original controller, once you know how:**  
Simply use _**ANY**_ controller and put into _EXCLUSION_ mode. Afterwards, follow the instructions for exclusion of your device (e.g. tripple-click one of the buttons on my switch).

After that, the device is excluded (from its original network, although another controller triggered the exclude) and thus reset to factory defaults. Once that has happened inclusion works again.