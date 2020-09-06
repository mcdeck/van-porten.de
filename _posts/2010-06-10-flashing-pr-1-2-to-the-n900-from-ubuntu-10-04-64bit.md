---

title: Flashing PR 1.2 to the N900 from Ubuntu 10.04 64bit
date: 2010-06-10 13:47:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- N900
- ubuntu
author: Oliver van Porten
redirect_from:
  - /2010/06/flashing-pr-12-to-the-n900-from-ubuntu-1004-64bit/
  - /2010/06/flashing-pr-12-to-the-n900-from-ubuntu-10-04-64bit/
  - /2010/06/flashing-pr-1-2-to-the-n900-from-ubuntu-10-04-64bit/
---
To install flasher, do

``` bash
sudo dpkg -i --force-architecture maemo_flasher-3.5_2.5.2.2_i386.deb
```

afterwards, install ia32-libs from multiverse:

``` bash
sudo apt-get install ia32-libs
```

Before installing ia32-libs flasher kept telling me this:

``` bash
ubuntu@ubuntu:~/Desktop$ flasher-3.5
bash: /usr/bin/flasher-3.5: No such file or directory
```

Now, to flash PR1.2 and the vanilla eMMC content, issue the following two commands:

``` bash
sudo flasher-3.5 -F RX-51_2009SE_10.2010.19-1_PR_COMBINED_MR0_ARM.bin -f
sudo flasher-3.5 -F RX-51_2009SE_10.2010.13-2.VANILLA_PR_EMMC_MR0_ARM.bin -f -R
```

This will flash and reboot after flashing the eMMC contents.