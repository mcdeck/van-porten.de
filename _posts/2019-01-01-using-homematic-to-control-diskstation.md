---

title: Using Homematic / CUxd to control Synology Diskstation
date: 2019-01-01 23:23:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: 
- smart home
tags:
- homematic
- smart home
author: Oliver van Porten

excerpt: In this post we are looing at how to set up HomeMatic to be able to control
    a Synology Diskstation using cuxd.

header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/teaser_empty_870x580.png
---
First of all, Happy New Year! I thought I'd start this year with an attempt at being more active again here on my blog. So this is it. :)

I was trying to control my [Synology DS212](https://www.custompcreview.com/reviews/synology-diskstation-ds212-nas-review/) directly 
through my [CCU2](https://www.eq-3.de/produkte/homematic/zentralen-und-gateways/homematic-zentrale-ccu-2.html) such that I could power 
it on and off by pressing a button on a [wall-mounted Homematic IP six-way switch](https://www.homematic-ip.com/en/products/detail/homematic-ip-wall-mount-remote-control-6-buttons.html).

[CUx-Daemon](https://github.com/jens-maus/cuxd) prooves to be the swiss-army knife when it comes to these things in the Homematic universe. 
Configuring the virtual switch was a bit tricky, though, so I will briefly explain how to do it here. I will not go into the details of installing
CUxd, though.

As for configuration, I ended up creating a new Switch through the CUxd interface, e.g. http://homematic-ccu2/addons/cuxd/index.ccc?m=4.

![CUxd Settings]({{ site.baseurl }}/assets/images/cuxd_settings.png)

It's a **system** switch, type **exec** and use a virtual switch, set to **switch mode** - this allows me to trigger actions and capture 
state with a single virtual device. 

![CUxd Device]({{ site.baseurl }}/assets/images/cuxd_switch.png)

I then configured the device to only have one channel and report as unreachable if any of the commands returns any error.

![CUxd Device General Parameters]({{ site.baseurl }}/assets/images/cuxd_general_params.png)

Now comes the tricky bit - the actual channel settings.

![CUxd Device Channel 1 Parameters]({{ site.baseurl }}/assets/images/cuxd_channel1_params.png)

**CMD_SHORT** is executed when the switch is turned off. It essentially logs into the diskstation and executes `poweroff`. This
requires root access, hence the need to `echo` the admin password to `sudo`. 

```
SWITCH|CMD_SHORT	
/usr/bin/ssh -o 'StrictHostKeyChecking no' -o 'UserKnownHostsFile /dev/null' -i /etc/ssh_host_rsa_key admin@diskstation 'echo XXXXXXXX | sudo -S poweroff'
```

**CMD_LONG** is executed when the switch is turned on. This simply uses `ether-wake`, obviosuly you want to provide to correct MAC.
```
SWITCH|CMD_LONG	
/usr/local/addons/cuxd/extra/ether-wake 00:11:XX:XX:XX:XX
```

Set timeout for execution of each of these to one minute.

```
SWITCH|EXEC_TIMEOUT	
1
```

Run the command in **CMD_TIMER** every 15 seconds.

```
SWITCH|TIMER_PRESET	
15
```
 	 
This one took me a while to figure out. For some reason the webui does not like a couple of characters to be put into the input boxes.
Specifically the equal sign (=) leads to the field being empty or partial. I was able to work around this by url-encoding the http call to set the 
switch state - maybe there is a more elegant solution, but this works.

To still explain a bit more, when the switch is set to on/off via the web interface that sets the state, but that state has nothing to do
with the actual state of the diskstation. So I use ping to check if it is up. Then I call **SET_STATE** of the virtual button (CUX2801003)
with the (inverted) result of that ping command. **SET_STATE** modifies the button state without triggering a switch action, i.e. by
doing **SET_STATE** to on that does not execute ether-wake but just modified button state.
  
```
SWITCH|CMD_TIMER	
! ping -q -c 1 diskstation; wget -q -O /dev/null http://homematic-ccu2:8181/cuxd.exe?x%3Ddom.GetObject%28%22CUxD.CUX2801003%3A1.SET_STATE%22%29.State%28$?%29
```

That, in short, summarizes what I did. It does work quite well now and I am happy with it. 
