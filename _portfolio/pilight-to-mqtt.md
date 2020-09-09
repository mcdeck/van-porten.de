---

title: pilight2mqtt
date: 2018-01-01 20:59:44.000000000 +02:00
published: true
status: publish
categories: []
tags: []

header: 
  # image: /assets/images/2016-05-15-23_25_54-cmd-python-service.py_-300x178.png
  teaser: /assets/images/2016-05-15-23_25_54-cmd-python-service.py_-300x178.png

---

**pilight2mqtt** passes messages between [pilight](https://www.pilight.org/) and any [mqtt](https://mqtt.org/) broker. What it does is basically talk to the [pilight API](https://manual.pilight.org/en/api#pf1) and broker between an [MQTT](http://mqtt.org/) channel and [pilight](https://www.pilight.org/) that way.

[![pilight2mqtt]({{ site.baseurl }}/assets/images/2016-05-15-23_25_54-cmd-python-service.py_-300x178.png)]({{ site.baseurl }}/assets/images/2016-05-15-23_25_54-cmd-python-service.py_.png)

The following video gives an impression of how it works. 
I'm using the awesome [mqtt-spy](https://kamilfb.github.io/mqtt-spy/) to send MQTT messages, in case you are wondering.

{% include youtubePlayer.html id="dgzDq1y2D3g" %}

**pilight2mqtt** is written in [python](https://www.python.org/), using [paho-mqtt](https://pypi.python.org/pypi/paho-mqtt/1.1) for the MQTT part, which makes things fairly easy. The idea is to eventually install this as a service on my [Raspberry Pi](https://www.raspberrypi.org/) and transfer messages that way. 

Sources are available in the [pilight2mqtt project on GitHub](https://github.com/mcdeck/pilight2mqtt). There is also a [Travis-CI project](https://travis-ci.org/mcdeck/pilight2mqtt) that builds automatically.

## Usage

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


## ToDo list

- improve build & test infrastructure  
- write tests  
- support for DHT11 sensor  
- support for other stuff I missed in the initial version