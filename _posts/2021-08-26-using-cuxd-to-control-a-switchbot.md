---
title: Using CUxD to control a SwitchBot
type: post
date: 2021-08-26T19:35:51.135Z
published: true
status: publish
header:
  teaser: /assets/uploads/img_20210826_213701.jpg
categories: 
- smart home
tags:
- homematic
- smart home
author: Oliver van Porten

excerpt: In this post we are looking at how to set up HomeMatic to be able to control a SwitchBot switch using cuxd.

---


I recently got myself a [SwitchBot](https://www.amazon.de/dp/B07B7NXV4R/) switch to control [my printer](https://www.amazon.de/dp/B07QJD49QC/), because that only has a soft power button. That is, you cannot simply plug it into a switchable power outlet and control it that way. 

Without a SwitchBot Hub, however, you can only control that switch via a BLE connection. It is obviously a neat trick to be able to - you know - make the little arm appear by poking your phone, but it is only so useful. You have to be pretty close to the printer and the switch, so you may as well just push the button yourself.

Luckily, I run RaspberryMatic on a Raspberry Pi 3 that is quite close to both printer and switch. Even more luckily, said Pi does have Bluetooth built-in, so ahead I went, searching for a way to make the Pi talk BLE to my SwitchBot.

First, of course, I needed to enable Bluetooth on the Pi. By default this is turned off on the RaspberryMatic install, but that can be solved quickly by ssh-ing into the system (how to configure that is documented elsewhere).

Then all the is need is to enable bluetooth and reboot by doing the following

`touch /etc/config/enableBluetooth`\
`reboot`

Afterwards you should be able to play with your `hci0 `device:

`hciconfig hci0 down`\
`hciconfig hci0 up`\
`hcitool lescan`

The lescan command should shows a list of BLE MAC addresses, among which I found my SwitchBot. So the PI was close enough to work.

My first attempt at integrating the switch via some sort of NodeRed plugin failed miserably, though. None of the BLE plugins work on the RaspberryMatic due to lack of Python, apparently. So I gave up on that an resorted to an old friend: CUxD. I used CUxD for a virtual, command-line based switch before, so I though I can use that again. 

After some playing around and [some more google'ing](https://forum.smartapfel.de/forum/thread/3720-switchbot-smart-home-ger%C3%A4te-mit-und-ohne-homebridge/?pageNo=3) I finally found a command line call that would work and trigger to Switch:

`gatttool -b E7:E9:62:XX:XX:XX -t random --char-write-req -a 0x0016 -n 570100`

Note that my Switch is configured to act as a push button. The arm will "press" for a second or two, then retract. It does not maintain state. If you have your SwitchBot configured that way you will send other numeric values:

`570100 = Press`\
`570101 = ON`\
`570102 = OFF`\
`570103 = Hold`

With that knowledge I then went and created a CUxD Switch

![](/assets/uploads/2021-08-26-21_57_21-window.png)

The two important commands to set are obviously `CMD_SHORT `/ `CMD_LONG `to trigger `gatttool`, as well as `CMD_TIMER `which we use to set the switch state by pinging the Printer.

`CMD_SHORT/CMD_LONG = `

`CMD_TIMER = `

Yes, the timer command looks complicated, but it is just an URL encoded call to cuxd to set the state of the cuxd device `CUX2801002 `to the inverted result of a single ping. I have not found a cleaner solution yet and it works pretty well also for my other virtual switches.

![](/assets/uploads/2021-08-26-22_01_16-window.png)

And that's all it takes! Happy Switching!