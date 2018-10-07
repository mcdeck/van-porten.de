---
layout: default
title: RaspBee on Raspberry Pi 3
date: 
type: post
published: false
status: draft
categories: []
tags: []
author: Oliver van Porten
---
Bought RaspBee (https://www.dresden-elektronik.de/funktechnik/solutions/wireless-light-control/raspbee/)

Running on Pi 3

Seems GPIO pins are no longer exactly the same as on RPi2

Need to put AMA0 back to GPIO pin 14/15

Expand Filesystem on your card in Preferences and disable serial. Reboot.  

``` bash
sudo apt-get update  
sudo apt-get upgrade  
sudo apt-get dist-upgrade
sudo rpi-update
```

Disable bluetooth and put ttyAMA0 back on BCM gpio’s 14&15:

``` bash
sudo nano /boot/config.txt
```

Add the following:

``` bash
dtoverlay=pi3-miniuart-bt  
```

exit and save file

Stop the Bluetooth device from attempting to connect with uart:

``` bash
sudo systemctl disable hciuart  
sudo nano /lib/systemd/system/hciuart.service  
```

change the first ttyAMA0 in ttyS0

If not already, remove console=serial0,115200 in/boot/cmdline.txt

``` bash
sudo nano /boot/cmdline.txt  
```

delete: console=serial0,115200

References  
* UART  
  https://openenergymonitor.org/emon/node/12412  
  http://pinout.xyz/pinout/uart
* Disable service on AMA0  
  https://github.com/InitialState/rpi-gps/wiki/2-Part-1.-Raspberry-Pi-Setup  
  http://spellfoundry.com/sleepy-pi/setting-arduino-ide-raspbian/
* General instructions  
  http://www2.htw-dresden.de/~wiki\_sn/index.php5/ZigBee/RaspBee  
  http://www2.htw-dresden.de/~wiki\_sn/index.php5/ZigBee/RaspBee/Funklichtsteuerung\_mit\_FHEM
* https://www.dresden-elektronik.de/funktechnik/service/downloads/software/#c3946  
  https://www.dresden-elektronik.de/funktechnik/products/software/pc/deconz/
* REST API  
  http://www2.htw-dresden.de/~wiki\_sn/index.php5/ZigBee/RaspBee/deCONZ\_REST\_Plug-in
