---
layout: blog
title: Using CUxD to control a SwitchBot
date: 2021-08-26T19:35:51.135Z
published: true
header:
  teaser: /assets/uploads/img_20210826_213701.jpg
---
I recently got myself a [SwitchBot](https://www.amazon.de/dp/B07B7NXV4R/) switch to control [my printer](https://www.amazon.de/dp/B07QJD49QC/), because that only has a soft power button. That is, you cannot simply plug it into a switchable power outlet and control it that way. 

Without a SwitchBot Hub, however, you can only control that switch via a BLE connection. It is obviously a neat trick to be able to - you know - make the little arm appear by poking your phone, but it is only so useful. You have to be pretty close to the printer and the switch, so you may as well just push the button yourself.

Luckily, I run RaspberryMatic on a Raspberry Pi 3 that is quite close to both printer and switch. Even more luckily, said Pi does have Bluetooth built-in, so ahead I went, searching for a way to make the Pi talk BLE to my SwitchBot.

First, of course, I needed to enable Bluetooth on the Pi. By default this is turned off on the RaspberryMatic install, but that can be solved quickly by