---

title: pilight2mqtt update
date: 2016-06-20 22:00:14.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- home assistant
- mqtt
- pilight
author: Oliver van Porten
redirect_from:
  - /2016/06/pilight2mqtt-update/

excerpt: I finally found a moment to make a bit more usable 
    and also add some infrastructure.

header: 
  # image: /assets/images/pilight_update.png
  teaser: /assets/teasers/smarthome_870x580.png
---
Today I finally found a moment to make [pilight2mqtt]({{ site.baseurl }}/blog/2016/05/pilight2mqtt/) a bit more usable and also add some infrastructure.

I basically refactored the code a little and added a launcher script. Installing is now as easy as executing setup.py and running the pilight2mqtt executable afterwards.

``` bash
python setup.py install
pilight2mqtt --help
```

Parameters for pilight2mqtt are really not that many

``` bash
> python -m pilight2mqtt --help
usage: __main__.py [-h] [--version] [--mqtt-server MQTT_SERVER]
                   [--mqtt-port MQTT_PORT] [--mqtt-topic MQTT_TOPIC]
                   [--pilight-server PILIGHT_SERVER]
                   [--pilight-port PILIGHT_PORT] [--debug] [--verbose]
                   [--pid-file path_to_pid_file]

pilight2mqtt: Translate pilight events to MQTT.

optional arguments:
  -h, --help            show this help message and exit
  --version             show program's version number and exit
  --mqtt-server MQTT_SERVER
                        Address of the MQTT server to talk to.
  --mqtt-port MQTT_PORT
                        Port of the MQTT server to talk to.
  --mqtt-topic MQTT_TOPIC
                        MQTT topic to use.
  --pilight-server PILIGHT_SERVER
                        Set the address of the pilight server to use. If not
                        specified will try to auto discover
  --pilight-port PILIGHT_PORT
                        Port of the pilight server. Only used when pilight-
                        server is also specified
  --debug               Start pilight2mqtt in debug mode
  --verbose             Start pilight2mqtt in verbose mode
  --pid-file path_to_pid_file
                        Path to PID file useful for running as daemon
```

You can find the updated [code on GitHub](https://github.com/mcdeck/pilight2mqtt). There is now also a [Travis-CI project](https://travis-ci.org/mcdeck/pilight2mqtt) that builds automatically. I will cover how to setup [Home Assistant](https://home-assistant.io/) and connect it to pilight2mqtt in a future article.

Stuff still on my to do list:  
- improve build & test infrastructure  
- write tests  
- support for DHT11 sensor  
- support for other stuff I missed in the initial version