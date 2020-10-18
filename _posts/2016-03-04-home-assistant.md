---

title: Home Assistant
date: 2016-03-04 22:05:46.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- home assistant
- home automation
- homematic
- mqtt
- smarthome
author: Oliver van Porten
redirect_from:
  - /2016/03/home-assistant/

excerpt: In this post we look at how to set up home assitant together
    with some other tools and infrastructure such as homematic, mqtt,
    Grafana and InfluxDB that I use to run my smart home.
header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/smarthome.png
---
I believe home automation, at least for me, is to a large extent driven by the joy of trying out new things and extending my system. I think this is why, despite my previous endeavors into FHEM, I kept on tinkering with Home Assistant. I am a big Python fanboy and do dislike PERL with a passion, so it seems in a way natural to do so.

[![Home Assistant States]({{ site.baseurl }}/assets/images/Screenshot-2016-02-22-22.14.27-300x151.png)]({{ site.baseurl }}/assets/images/Screenshot-2016-02-22-22.14.27.png "Snapshot of my Home Assistant setup - obviously it is a work in progress.") 

There are a lot of things going on around [Home Assistant](https://home-assistant.io/) at the moment and I think that is quite fantastic. In this post I'd like to take a moment to describe the basic steps needed to get up and running with Home Assistant on a Raspberry Pi, including setting up InfluxDB and Grafana for all your graphing needs.

But first things first. Let's start with an inventory of services that I need to run on my Raspberry.

*   [Home Assistant](https://home-assistant.io/): obviously
*   [HMLANd](https://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb): because my Raspberry Pi doubles as [HomeMatic](http://www.homematic.com/) LAN adapter for devices I installed in the basement
*   [InfluxDB](https://influxdata.com/): Database for all kinds of measurements
*   [Grafana](http://grafana.org/): Graphical front end to InfluxDB for charting
*   [Mosquitto](http://mosquitto.org/): An MQTT broker
*   [hm2mqtt](https://github.com/owagner/hm2mqtt): To translate [HomeMatic](http://www.homematic.com/) to [MQTT](http://mqtt.org/). This doesn't run on the RPi in my setup, though, but on the [CCU2](http://www.eq-3.de/produkt-detail-zentralen-und-gateways/items/homematic-zentrale-ccu-2.html) directly instead.

Mosquitto
---------

I firmly believe that eventually there will be one protocol to emerge in the whole Home Automation world that will finally allow connecting a myriad of devices and will be supported by virtually all vendors. While this is not the case today I am kind of betting [MQTT](http://mqtt.org/) (and so are others). Home Assistant has excellent support for it, too, so it is the foundation of my setup.

Installation is pretty straight forward:

``` bash
wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key
cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-jessie.list
sudo apt-get update
sudo apt-get install mosquitto
```

Done. I will describe securing your local MQTT server in a future post, but we don't need any further setup for now. The MQTT broker is reachable on :1883.

I found that [mqtt-spy](https://kamilfb.github.io/mqtt-spy/) is an incredibly useful tool to see what is going on in detail, so I suggest [grabbing a copy immediately](https://github.com/kamilfb/mqtt-spy/wiki/Downloads).

Installing hm2mqtt
------------------

hm2mqtt offers a bridge from HomeMatic to MQTT. It can run either directly on the CCU2 or on a separate system - I let it run on the CCU2 because I find that more convenient.

To install, your first need to build it. Simply clone the git repository of [hm2mqtt from owagner](https://github.com/owagner/hm2mqtt) and let gradle build your addon package afterwards.

``` bash
git clone https://github.com/owagner/hm2mqtt hm2mqtt
cd hm2mqtt
gradle addon
```

This will generate **_hm2mqtt/build/distributions/_****_hm2mqtt-addon.tar.gz_** which can be deployed to the CCU2.

To install the addon, point your browser to http://homematic-ccu2/ (or whatever hostname you chose for your CCU2) and navigate to the system settings, add ons dialog. 

[![The CCU2 addon dialog.]({{ site.baseurl }}/assets/images/Screenshot-2016-03-04-14.00.54-300x197.png)](https://www.van-porten.de/wp-content/uploads/2016/03/Screenshot-2016-03-04-14.00.54.png "The CCU2 addon dialog.")

At the bottom of the dialog, point the _choose file_ dialog to the _hm2mqtt-addon.tar.gz_ we built previously and select install. After the CCU2 reboots, you should see a hm2mqtt button in the system settings. This will take you to the configuration page of the hm2mqtt addon where we can set the broker address correctly.

[![CCU2 system settings with hm2mqtt button]({{ site.baseurl }}/assets/images/Screenshot-2016-03-04-14.35.03-300x116.png)]({{ site.baseurl }}/assets/images/Screenshot-2016-03-04-14.35.03.png "CCU2 system settings with hm2mqtt button.")

Enter the address of the system you installed Mosquitto on, leaving the port 1883 as is. Save settings and then stop and start the daemon.

[![hm2mqtt settings]({{ site.baseurl }}/assets/images/Screenshot-2016-03-04-14.35.32-300x205.png)]({{ site.baseurl }}/assets/images/Screenshot-2016-03-04-14.35.32.png "hm2mqtt settings")

That's it. You can now fire up mqtt-spy, connect it to your broker and subscribe to **hm/#.**

[![mqtt-spy]({{ site.baseurl }}/assets/images/Screenshot-2016-02-22-22.40.24-300x220.png)]({{ site.baseurl }}/assets/images/Screenshot-2016-02-22-22.40.24.png "A screenshot of mqtt-spy connected to my local broker, receiving messages from HomeMatic")

You should start seeing MQTT messages from your CCU2 coming in.

HMLANd
------

As I wrote previously, my Home Assistant server doubles as a HMLANd range extender for my HomeMatic CCU2, allowing me to more reliably communicate with my sensors and actors that are currently placed in my basement.

Installing HMLANd is really straight forward. Simply grab the latest deb package from the [HMLANd release repository.](https://git.zerfleddert.de/hmcfgusb/releases/) For a RaspberryPi you obviously want to pick the armhf package. In my case the latest available version was 0.102.

``` bash
wget https://git.zerfleddert.de/hmcfgusb/releases/debian/hmcfgusb_0.102-1_armhf.deb
```

First we install some dependencies via apt and then install HMLANd via dpkg:

``` bash
apt-get install libusb-1.0-0-dev build-essential git
dpkg -i hmcfgusb_0.102-1_armhf.deb
```

I also needed to configure some additional options to make it work.

``` bash
nano /etc/default/hmland
```

For me I needed to emulate a LAN interface (the -I switch) and needed to make HMLANd listen on all interfaces (-l 0.0.0.0)

``` bash
HMLAND_OPTS="-l 0.0.0.0 -I"
```

You should now be able to connect you CCU2 to the HMLANd via the system settings interface (LAN Gateway button).

[![HMLAN configuration]({{ site.baseurl }}/assets/images/Screenshot-2016-03-04-21.53.42-300x138.png)]({{ site.baseurl }}/assets/images/Screenshot-2016-03-04-21.53.42.png "Connecting HMLANd to a CCU2")

After a reboot of the CCU2 the interface should be usable. The LAN Gateway page should show status as _**connected**_.

Influx DB and Grafana
---------------------

Influx DB is the database backend I use to store data from sensors. It is specifically built to do this, so seems like a good choice, plus there is native support for it in Home Assistant (and that is in fact where I got the idea of using it, to be honest).

Grafana is a web front end that allows you to create various views on the data in Influx DB (and some other databases, actually).

[![Grafana graph view]({{ site.baseurl }}/assets/images/Screenshot-2016-02-22-22.13.17-300x184.png)]({{ site.baseurl }}/assets/images/Screenshot-2016-02-22-22.13.17.png "Grafana plotting data taken from my InfluxDB, filled by Home Assistant")

Installing everything is again very straight forward. Unless you want to compile all packages yourself I suggest you download the pre-built debs from here. The packages provided here are a mirror of those built by [padcom](http://padcom13.blogspot.de/2015/12/influxdb-telegraf-and-grafana-on.html). You can also [go to his page and get the original files](http://padcom13.blogspot.de/2015/12/influxdb-telegraf-and-grafana-on.html).

*   [influxdb\_0.9.6.1\_armhf.deb](https://github.com/mcdeck/mcdeck.github.io/releases/download/1.0.0/influxdb_0.9.6.1_armhf.deb)
*   [telegraf\_0.3.0-beta2\_armhf.deb](https://github.com/mcdeck/mcdeck.github.io/releases/download/1.0.0/telegraf_0.3.0-beta2_armhf.deb)
*   [grafana\_2.6.0\_armhf.deb](https://github.com/mcdeck/mcdeck.github.io/releases/download/1.0.0/grafana_2.6.0_armhf.deb)

Once you downloaded the deb simply install them using dpkg and fix missing dependencies afterwards.

``` bash
sudo dpkg -i influxdb_0.9.6.1_armhf.deb
sudo dpkg -i telegraf_0.3.0-beta2_armhf.deb
sudo dpkg -i grafana_2.6.0_armhf.deb
sudo apt-get install -f
``` 

With that done, we can finalize the setup and start the Grafana server. Note that we need to create an empty **_/etc/default/telegraf file_** - otherwise you will see errors when starting Telegraf.

``` bash
sudo touch /etc/default/telegraf
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server
sudo /bin/systemctl start grafana-server
```

As a final step, we setup a database for use in Home Assistant (see also the [post in the home assistant blog](https://home-assistant.io/blog/2015/12/07/influxdb-and-grafana/) for further details)

``` bash
$ influx
Visit https://enterprise.influxdata.com to register for updates, InfluxDB server management, and monitoring.
Connected to http://localhost:8086 version 0.9.5.1
InfluxDB shell 0.9.5.1
> CREATE DATABASE home_assistant
> CREATE DATABASE telegraf
> CREATE USER "home-assistant" WITH PASSWORD 'home-assistant!'
```

The one thing we want to do for Grafana now is setting up InfluxDB as a data source. The [Grafana documentation](http://docs.grafana.org/datasources/influxdb/) describes how to do this in great detail, so I will not repeat it here. I think once you have this done it is a matter of evaluating that data that is logged and sorting it into meaningful views and plots. That is in fact something I also still have to do :)

Installing Home Assistant
-------------------------

Finally. The main piece of software we are doing all this for. We will cover two things here. First, we'll install home assistant in a central location using a virtual environment. Secondly, we will make it start automatically at boot time.

I will talk about the procedure to install a development snapshot here, because that is what I typically use and play around with. Installing a release version is simply a matter of using _**pip install**_ after you've setup the virtual environment, I think.

First, we install some prerequisites:

``` bash
sudo apt-get install git
sudo apt-get install python3.4 virtualenv python-pip
sudo pip install build-essential
sudo apt-get install python3.4-dev
```

We then create the directories where we want our configuration and virtual environment to live, and install the virtual environment:

``` bash
sudo mkdir /opt/home-assistant
sudo chown pi:pi /opt/home-assistant
virtualenv -p python3.4 /opt/home-assistant/virtualenv
```

Once we have that, we clone the official home assistant repo dev branch and

``` bash
git clone https://github.com/balloob/home-assistant
```

With the clone done, we are now ready to install Home Assistant into our virtual environment (mind the _source_ to activate the virtual environment first):

``` bash
source /opt/home-assistant/virtualenv/bin/activate
cd home-assistant
python setup.py install
pip install -r requirements_all.txt
```

Doing the final install of everything that is in the requirements\_all.txt is actually not needed - HomeAssistant will install dependencies into **/opt/home-assistant/config/lib** - but I tend to do that anyway to more easily see when things go wrong. It will also come in handy when you want to install a custom version of some dependency.

Automatically starting Home Assistant
-------------------------------------

The [Home Assistant documentation](https://home-assistant.io/getting-started/autostart/) covers the procedure to start Home Assistant as a service quite well, so I will be brief. The hass-daemon startup script can be [downloaded from the git repository](https://raw.githubusercontent.com/balloob/home-assistant/dev/script/hass-daemon) and just needs some small modifications.

``` bash
wget https://raw.githubusercontent.com/balloob/home-assistant/dev/script/hass-daemon
sudo cp hass-daemon /etc/init.d/hass-daemon
sudo chmod +x /etc/init.d/hass-daemon
```

Once this is done, we can make the necessary adjustments:

``` bash
sudo nano /etc/init.d/hass-daemon
```

Simply update the following variables at the top of the file:

``` bash
PRE_EXEC="source /opt/homea-ssistant/virtualenv/bin/activate;"
RUN_AS="pi"
PID_FILE="/opt/home-assistant/run/hass.pid"
CONFIG_DIR="/opt/home-assistant/config"
```

Finally, we create the run directory, add it to the default startup sequence and install the hass-daemon properly

``` bash
mkdir /opt/home-assistant/run
sudo update-rc.d hass-daemon defaults
sudo service hass-daemon install
```

And then we start it up:

``` bash
sudo service hass-daemon start
```

You should now be able to browse to ``http://<your server>:8123/`` and see you new Home Assistant installation.

I will cover the details of my current setup in detail in a future post. For now please refer to the [excellent Home Assistant documentation](https://home-assistant.io/getting-started/configuration/) to get started.