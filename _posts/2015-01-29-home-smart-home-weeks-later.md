---

title: Home Smart Home - A Few Weeks Later
date: 2015-01-29 17:13:17.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- homematic
- smarthome
- zwave
author: Oliver van Porten
redirect_from:
  - /2015/01/home-smart-home-weeks-later/

excerpt: In this post I review my experience with
    Z-Wave so far.
header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/smarthome_870x580.png
---
After a few attempts to get my Z-Wave network to work reliably I finally decided to maybe try something else for the outdoor lights. The Z-Wave setup did not have the range to cover my driveway and yard, unfortunately.

Now, I decided to go with the [HomeMatic](http://www.homematic.com/). That really worked like a charm from day one. My current setup now looks like illustrated on the following picture.

![]({{ site.baseurl }}/assets/images/My-Smart-Home2.png)

I use three HomeMatic Actors to switch the five lamps in my yard and driveway (2+2+1). The HomeMatic motion detector is used to measure lumincance as well and switches on the lights when it gets dark permanently. At nine o'clock it then goes into motion detector mode and only switches the lights on if motion is detected. In the morning, I also turn on the lights at seven or so and turn t hem off when it gets too bright or after nine o'clock, whichever comes first.

The Z-Wave Plugin Switch control a chain of lights at the moment. Once winter is over I will find other uses for it. Finally, the WALLC-S is used to turn on the lights outside manually and I am planning on installing the AEO\_MULTISENS as a secondary motion detector at some point.

Control of course happens through my OpenHAB installation on my RaspberyPI that is now equipped with a Z-Wave Plus controller and also acts as the central control unit for the HomeMatic devices through a CCU2.

Of course I also use OpenHAB to [turn my DiskStation DS212+ on and off]({{ site.baseurl }}/blog/2014/11/controlling-diskstation-via-openhab/ "Controlling Diskstation via openHAB").

Finally a working setup - now off to the next advenctures in home automation. Automatic roller shutters probably. Or finally installation a tablet-based control unit in my living room. Or probably both :)