---
title: Capture card config for MediaCenter and HVR-1100
date: 2006-11-12 20:00:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags: []
author: Oliver van Porten
redirect_from:
  - /2006/11/capture-card-config-for-mediacenter-and-hvr-1100/
---
As I am trying to setup my TV tuner for use with MediaPortal right now I had to write a configuration file for my card. Here is what I added to CaptureCardDefinitions.xml. The digital part actually seems to work, the analog however does not until now but I'm working on that one.

Here is what I've got so far:

``` xml
  <capturecard commercialname="Hauppauge HVR-1100 (67xx) Digital" capturename="Hauppauge WinTV-HVR 713X BDA Digital Capture" devid="ven_1131&amp;dev_7133&amp;subsys_67010070&amp;rev_d1"\>
    <capabilities tv="true" radio="true" mpeg2="false" mce="true" sw="true" bda="true"/>
    <tv>
      <interface cat="capture" video="2" audio="3" mpeg2="1" sectionsandtables="5"/>
      <filters>
        <filter cat="networkprovider" name="Microsoft DVBT Network Provider"                        checkdevice="false"/>
        <filter cat="tunerdevice"     name="Hauppauge WinTV-HVR 713X BDA DVBT Tuner"                checkdevice="true"/>
        <filter cat="capture"         name="Hauppauge WinTV-HVR 713X BDA Digital Capture"       checkdevice="true"/>
      </filters>
      <connections>
        <connection sourcefilter="networkprovider" sourcepin="0" sinkfilter="tunerdevice"   sinkpin="0"/>
        <connection sourcefilter="tunerdevice"     sourcepin="0" sinkfilter="capture"               sinkpin="0"/>
      </connections>
    </tv>
  </capturecard>

  <capturecard commercialname="Hauppauge HVR-1100 (67xx) Analog" capturename="Hauppauge WinTV-HVR 713X BDA Analog Capture" devid="ven_1131&amp;dev_7133&amp;subsys_67010070&amp;rev_d1"\>
    <capabilities tv="true" radio="true" mpeg2="false" mce="true" sw="true" bda="true"/>
    <tv>
      <interface cat="encoder" video="0" audio="1" mpeg2=""/>
      <filters>
        <filter cat="tvtuner"  name="Hauppauge WinTV-HVR 713X BDA Analog TV Tuner"                  checkdevice="true"/>
        <filter cat="tvaudio"  name="Hauppauge WinTV-HVR 713X BDA Analog TV Audio"          checkdevice="true"/>
        <filter cat="crossbar" name="Hauppauge WinTV-HVR 713X BDA Analog Xbar"              checkdevice="true"/>
        <filter cat="capture"  name="Hauppauge WinTV-HVR 713X BDA Analog Capture" checkdevice="true"/>
        <filter cat="encoder"  name="MainConcept (MCE) MPEG Encoder"        checkdevice="true"/>
        <filter cat="mux"  name="MainConcept (MCE) MPEG Encoder"    checkdevice="true"/>
      </filters>
      <connections>
        <connection sourcefilter="tvtuner"  sourcepin="0"   sinkfilter="crossbar"   sinkpin="0"/>
        <connection sourcefilter="tvtuner"  sourcepin="1"   sinkfilter="tvaudio"    sinkpin="0"/>
        <connection sourcefilter="tvaudio"  sourcepin="0"   sinkfilter="crossbar"   sinkpin="3"/>
        <connection sourcefilter="crossbar" sourcepin="0"   sinkfilter="capture"    sinkpin="0"/>
        <connection sourcefilter="crossbar" sourcepin="1"   sinkfilter="capture"    sinkpin="1"/>
        <connection sourcefilter="capture"  sourcepin="0"   sinkfilter="encoder"    sinkpin="0"/>
        <connection sourcefilter="capture"  sourcepin="2"   sinkfilter="encoder"    sinkpin="1"/>
      </connections>
    </tv>
  </capturecard>
```