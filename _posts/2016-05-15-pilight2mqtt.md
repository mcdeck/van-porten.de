---

title: pilight2mqtt
date: 2016-05-15 22:43:29.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- mqtt
- pilight
- Python
- smart home
author: Oliver van Porten
redirect_from:
  - /2016/05/pilight2mqtt/

excerpt: In this post we look at how to attach pilight to Home Assistant 
    using MQTT.

header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/smarthome.png
  
---
Some days ago [I blogged about my first experiments with pilight]({{ site.baseurl }}/blog/2016/03/pilight/) and mentioned that I intended to attach it to [Home Assistant](https://home-assistant.io/). Today I finally found the time to get started and now have a working prototype ready.

[![pilight2mqtt]({{ site.baseurl }}/assets/images/2016-05-15-23_25_54-cmd-python-service.py_-300x178.png)]({{ site.baseurl }}/assets/images/2016-05-15-23_25_54-cmd-python-service.py_.png)

I started a new project on GitHub called [pilight2mqtt](https://github.com/mcdeck/pilight2mqtt). What it does is basically talk to the [pilight API](https://manual.pilight.org/en/api#pf1) and broker between an [MQTT](http://mqtt.org/) channel and [pilight](https://www.pilight.org/) that way.

The following video gives an impression of how it works. I'm using the awesome [mqtt-spy](https://kamilfb.github.io/mqtt-spy/) to send MQTT messages, in case you are wondering.

{% include video id="dgzDq1y2D3g" provider="youtube" %}

The whole thing is based on [python](https://www.python.org/), using [paho-mqtt](https://pypi.python.org/pypi/paho-mqtt/1.1) for the MQTT part, which makes things fairly easy. The idea is to eventually install this as a service on my [Raspberry Pi](https://www.raspberrypi.org/) and transfer messages that way. Obviously it will work in Home Assistant the same way all other MQTT devices work there.

My to do list is still somewhat long-ish, the most important part being support for brokering message from pilight to MQTT (today only the other direction is implemented, as shown in the video).

Then there are still some more items on my list the will need a closer look

*   Robustness against connection loss
*   Infrastructure to install/run service
*   documentation

In any case, if you are interested, [head over to GitHub and check out the project](https://github.com/mcdeck/pilight2mqtt). I will post some more details on the implementation in the next days.