---
layout: default
title: Connecting your local MQTT broker to Owntracks
date: 
type: post
parent_id: '0'
published: false
status: draft
categories: []
tags: []
author: Oliver van Porten
---
OwnTracks hosted no longer available - rewrite to use local broker ... damn it.

Yesterday I [posted about setting up Home Assistant](https://www.van-porten.de/blog/2016/03/home-assistant/). As a follow up, today, I'll briefly explain how to attach [OwnTracks hosted](http://owntracks.org/booklet/features/hosted/), private broker to your local MQTT instance. You will need this, because, as far as I know, Home Assistant only [allows having a single MQTT broker](https://home-assistant.io/components/mqtt/). Alternatively you could also connect you [OwnTracks](http://owntracks.org/) client to your local MQTT broker, but I found that a lot less convenient.

But first you may wonder what OwnTracks is all about. I will simply quote the [OwnTracks Booklet](http://owntracks.org/booklet/guide/whathow/):

> The OwnTracks app runs in the background on your Android or iOS device and waits for the smart phone to tell it that the device has moved, whereupon OwnTracks sends out a message with its current coordinates (and a few other things we'll discuss in a moment).

So, what the OwnTracks app on your smartphone will do essentially is send location updates to the MQTT broker. We can use that information in our automation tasks, because [Home Assistant supports this quite well.](https://home-assistant.io/components/automation/#zone-trigger) Configuring [OwnTracks in Home Assistant](https://home-assistant.io/components/device_tracker.owntracks/) is quite straight forward, too. We just need to make sure the messages arrive in the MQTT broker we configured in Home Assistant - which is what I will cover in this post.

So, we assume you have OwnTracks installed on your smartphone, Home Assistant is configured to use a local MQTT broker (the one [we installed in my previous post](https://www.van-porten.de/blog/2016/03/home-assistant/)), and you configure OwnTracks for use in Home Assistant by putting the following lines somewhere into your config.

``` yaml
device_tracker:
  platform: owntracks
```

With that done, we can now simply connect to the other tracker by mo