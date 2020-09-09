---

title: Home Automation with FHEM
date: 2016-01-10 21:38:05.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- fhem
- homematic
- openhab
- smarthome
author: Oliver van Porten
redirect_from:
  - /2016/01/home-automation-with-fhem/
---
For a while I was fairly happily running [OpenHAB](http://www.openhab.org/) to control and automate my [HomeMatic](http://www.homematic.com/) devices. I had a few rules configured to trigger outdoor lighting and the like. There were a few delays occasionally, though, which I think may have been due to network timing or simply due to a delay in receiving the events from the [CCU2](http://www.eq-3.de/produkt-detail-zentralen-und-gateways/items/homematic-zentrale-ccu-2.html).

At some point a few weeks ago I decided that enough was enough. I moved all automation rules directly onto the [CCU2](http://www.eq-3.de/produkt-detail-zentralen-und-gateways/items/homematic-zentrale-ccu-2.html). After some playing around and struggling with a few details I have a setup that works quite well now. Most importantly it is faster than it used to be, which was the whole point of the exercise.

Next to the slowness in automation I never liked the OpenHAB UI - the classic UI that is. The [paper UI](https://www.youtube.com/watch?v=NolVoL8ewO0) looks a lot nicer, but also that lacks a few features I would like to have plus is not really release for production yet.

In any case I decided it was time to move to something else. I started by exploring the benefits of using [MQTT](http://mqtt.org/). I did that with the help of [Mosquitto](http://mosquitto.org/), [hm2mqtt](https://github.com/owagner/hm2mqtt) and [Home Assistant](https://home-assistant.io/). I even contributed some code to [Home Assistant](https://home-assistant.io/) to make it [work with the json messages sent by hm2mqtt](https://github.com/balloob/home-assistant/pull/811). I like [Home Assistant](https://home-assistant.io/) a lot, simply because it is written in [Python](https://www.python.org/) and as such makes contributing easy for me. However, also the UI did not completely satisfy me, so I kept looking.

Sometime last week then I revisited [FHEM](http://fhem.de/fhem.html). I had looked at [FHEM](http://fhem.de/fhem.html) in the beginning of my home automation journey and abandoned it at the time. The two main reasons were the UI, but more importantly the lack of support for using a [CCU2](http://www.eq-3.de/produkt-detail-zentralen-und-gateways/items/homematic-zentrale-ccu-2.html) to control [HomeMatic](http://www.homematic.com/) devices.

Luckily that has changed a lot now. While [MQTT](http://mqtt.org/) is of course always an option there is the [HMCCU](http://forum.fhem.de/index.php?topic=40189.0) module now. That finally provides a way to control a [CUU2](http://www.eq-3.de/produkt-detail-zentralen-und-gateways/items/homematic-zentrale-ccu-2.html) plus the module is under active development (as opposed to the old [HMRPC](http://homematic-forum.de/forum/viewtopic.php?t=7309) module).

Next to that, there is also the new [Tablet UI](http://www.fhemwiki.de/wiki/FHEM_Tablet_UI) now that is visually appealing and really is absolutely what I was looking for. It is based on HTML , CSS and JavaScript and as such works in virtually any modern browser. More importantly, it is easy enough to customise the interface.

[![FHEM Tablet UI]({{ site.baseurl }}/assets/images/Screenshot-2016-01-10-18.17.22-1024x576.png)]({{ site.baseurl }}/assets/images/Screenshot-2016-01-10-18.17.22.png)

What you see here is a snapshot of my current setup. It is very much a work in progress now, but it already covers a lot more features than I used to have when still running on [OpenHAB](http://www.openhab.org/). I will post more detailed instructions and lessons learned once I am done, of course.

The one thing I currently find lacking in [FHEM](http://fhem.de/fhem.html) is the connectivity from outside your home. OpenHAB's [my.openhab.org](https://my.openhab.org/) service is quite a nice feature which I'd like to see in FHEM as well. Using simple port forwarding will also work, I guess, but also that I still need to setup.

The other downside of FHEM is, obviously, that it is written in Perl, which I hate with a passion. I did [share my first fix for HMCCU](http://forum.fhem.de/index.php/topic,46652.msg383843.html#msg383843) already, though, so I guess I will adapt over time. :)