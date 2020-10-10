---

title: OctoPrint-Ender3tf2sd
date: 2019-11-28 20:59:44.000000000 +02:00
published: true
status: publish
categories: []
tags: []

header: 
  # image: /assets/images/developia_current.png
  teaser: /assets/images/ender3tf2sd.png
---

**OctoPrint-Ender3tf2sd** is a simple plugin to make OctoPrint recognize the SD card in your Ender 3 (Pro).

It seems that Marlin (depending on which version you use, I guess) sends TF card ok instead of SD card ok as OctoPrint expects. People in the OcotPrint community solved this by uploading a plugin via SSH (see Thread on the forums). I wanted this to be installable via the WebUI, though, which is why I made this plugin.

## Setup
Install via the bundled Plugin Manager or manually using this URL:

    https://github.com/mcdeck/OctoPrint-Ender3tf2sd/archive/master.zip

## Configuration
No configuration necessary.