---

title: Installing Ubuntu 10.04 Server 64bit via USB Pendrive
date: 2010-06-20 20:24:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- linux
- ubuntu
- usb
author: Oliver van Porten
redirect_from:
  - /2010/06/installing-ubuntu-1004-server-64bit-via-usb-pendrive/
  - /2010/06/installing-ubuntu-10-04-server-64bit-via-usb-pendrive/
---
After struggling with installing [Ubuntu Server 10.04](http://www.ubuntu.com/server) from a bootable usb stick, here are some hints in case anyone else ever wants to do this. My problem was that the Server Installer kept trying to load files from the CD and could not find them, which made the installation fail. I actually wonder why it could not find anything because it was apparently looking in the right places (i.e. the USB stick mounted under /cdrom). Feel free to enlighten me. Read more after the break.

Anyway, first, you'll of course need the [Ubuntu Server Iso Image](http://www.ubuntu.com/server/get-ubuntu/download) and the [Universal USB Install](http://www.pendrivelinux.com/downloads/Universal-USB-Installer/Universal-USB-Installer.exe) in case you're on Windows or the 'Startup Disc Creator' in case you're already running Ubuntu.

Then, you'll need to follow the guide to creating a usb stick as posted on the[download page](http://www.ubuntu.com/server/get-ubuntu/download) when you click 'Show me how'. That is, run the Disc Create / USB Installer and follow the instructions. It's actually pretty straight forward so I'm not going to post it again. :)

**Next, and this is important, copy the iso you downloaded onto the USB stick, as we will need it later when we booted into the installation.**

Now, boot the system from the USB stick you just created. This will start the installation where you can first choose a language and the like. After a while, as I already wrote, the installer failed for me with "missing data from cdrom", bringing me to the installation menu. From there, you can choose to open a shell. Do so.

Once the shell is there, execute:

``` bash
mount
```

and note the device that is mounted as /cdrom. This is your usb stick.

Next, execute the following commands:

``` bash
umount /cdrom
mkdir /usb
#device\_name is the one from mount
mount /dev/device\_name /usb
mount -t iso9660 -o loop /usb/ubuntu-10.04-server-amd64.iso /cdrom
```

The iso name of course depends on the version of the server you downloaded. for me, it was the 64 bit version.

Next, you can exit the shell:

``` bash
exit
```

This will take you back to the installation menu.

Select "Load preseed" (or similiarly named - can't quite remember right now). The installation should now continue normally.