---

title: 'DIY NAS #1: Introduction'
date: 2011-08-07 11:41:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- DIY
- Hardware
- NAS
author: Oliver van Porten
redirect_from:
  - /2011/08/nas-diy-1-introduction/
  - /2011/08/diy-nas-1-introduction/

excerpt: In this post we look at options for a DIY
    NAS build
header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/hardware_870x580.png
---
I've been pondering the thought of buying a [NAS](http://en.wikipedia.org/wiki/Network-attached_storage) system for quite some time now but could not find a suitable one. My requirements are quite challenging though, I must admit:

*   Silent: I want to run the system near my desk so it has to be very silent. (And I mean super-silent - not just a little silent)
*   Fast: Access to the drives has to be fast.
*   Feature-Rich Software: I want to use the NAS primarily as a NAS, but it should offer features like BT downloading and the like. It should also act as a iTunes and/or DLNA server.
*   Hardware Features:  
    - Wake-On-Lan / Wake-on-Wan  
    - Inegrated WLAN Adapter  
    - Raid 1, 5 or 10; 10 preferred

I bought some off-the-shelf NAS, namely the [Synology DS411slim](http://www.synology.com/us/products/DS411slim/index.php) and the [Acer easyStore H341](http://www.acer.de/ac/de/DE/content/home-server). Both were decent devices but were not really up to the challenge. I ended up returning both of them.

The easyStore was fast and feature-rich, running [Windows Home Server](http://en.wikipedia.org/wiki/Windows_Home_Server) (not 2011, though, but the old one). However, it was noisy which I could not stand.

The DS411slim was silent enough and had some nice features via [DiskStation Manager](http://www.synology.com/dsm/index.php?lang=enu), but felt painfully slow when copying to and from the device. Plus it was rather expensive, working with 2.5" HDDs, and thus also very limited in storage capacity (4x1GB maximum).

After searching for some days now for suitably silent yet powerful device I could not come up with something good. There is the [Western Digitial MyBook WorldEdition II](http://www.wdc.com/en/products/products.aspx?id=290) but that did not receive many positive comments on Amazon (for example). Some even state it tends to loose data, which is quite against the point of buying a NAS in the first place. Also Buffalo seems to offers some decent devices but they are either only single drive solutions like the [LinkStation Live LS-CHL](http://www.buffalotech.com/products/network-storage/home-and-small-office/linkstation-live-ls-chl/) or - like the [LinkStation Pro Duo LS-WVLR1](http://www.buffalotech.com/products/network-storage/home-and-small-office/linkstation-pro-duo-ls-wvlr1/) - not very reliable (from what [reviews](http://www.smallnetbuilder.com/content/view/30295/75/) say).

Other devices from QNAP ([TS-419P+](http://www.qnap.com/pro_detail_feature.asp?p_id=183)), Synology ([DS411+II](http://www.synology.com/products/spec.php?product_name=DS411%2BII〈=enu#p_submenu), [DS410](http://www.synology.com/us/products/ds410/index.php)) and Thecus ([N4200](http://www.thecus.com/product.php?PROD_ID=30)) all seem viable options. I feel though that any single one of them has one flaw or another. The QNAP TS-419P+ seems to be quite silent (though I could not find any absolute numbers yet) and offers RAID5. It runs an embedded linux and has a download manager built in. It feels quite pricy though at about €480,- ([Amazon](http://www.amazon.de/gp/product/B0047WHUMS/ref=as_li_ss_tl?ie=UTF8&tag=deadia-21&linkCode=as2&camp=1638&creative=19454&creativeASIN=B0047WHUMS)) without HDDs. The same holds basically for the DS411+II, which is even more pricy at €520,- ([Amazon](http://www.amazon.de/gp/product/B004CRH8HA/ref=as_li_ss_tl?ie=UTF8&tag=deadia-21&linkCode=as2&camp=1638&creative=19454&creativeASIN=B004CRH8HA)) without any drives again. The same holds for the DS410 at around €450,- ([Amazon](http://www.amazon.de/gp/product/B003A7OMS6/ref=as_li_ss_tl?ie=UTF8&tag=deadia-21&linkCode=as2&camp=1638&creative=19454&creativeASIN=B003A7OMS6)).  Sadly, also the Thecus N4200 runs at a stunning €440,-  
([Amazon](http://www.amazon.de/gp/product/B0034EG0TO/ref=as_li_ss_tl?ie=UTF8&tag=deadia-21&linkCode=as2&camp=1638&creative=19454&creativeASIN=B0034EG0TO)).  Also none of the above come with an integrated WLAN adapter.

That said, you can begin to feel that you should check other options as well, but which would that be? Easy: build your own NAS! That can't be more expensive, can it? The downside obviously is that it is a bit more work to set up such a system and also the maintenance might be harder.  
On the upside, you are free in choice of operating system and features and you could think about transforming your NAS into a HTPC if you chose components carefully. Also of interest is the question of power consumption compared to the other, more integrated solutions and lastly also the price of the rig.

In the next part of this article series I will present a selection of components that could be used to build a DIY NAS/HomeServer to suit my needs.