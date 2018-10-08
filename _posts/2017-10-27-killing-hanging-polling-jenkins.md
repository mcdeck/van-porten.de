---
layout: post
title: Killing hanging polling in Jenkins
date: 2017-10-27 14:01:17.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags: []
author: Oliver van Porten
redirect_from:
  - /2017/10/killing-hanging-polling-jenkins/
---
For one reason or another Jenkins sometimes gets stuck when polling SCM (which is, apparently, a known issue, cf [[JENKINS-5413] SCM polling getting hung - Jenkins JIRA](https://issues.jenkins-ci.org/browse/JENKINS-5413)).

This can lead to a variety of problems.

For us, some pipelines simply would not run anymore automatically.

To get rid of the hanging polling jobs, I came up the following **Groovy System Script** (note the "system" part). You can simply add this to a freestyle job and run at regular intervals or via the script console of the master (``Manage Jenkins -> Script Console``)

``` groovy
import hudson.model.Hudson
import hudson.model.Hudson
import hudson.triggers.SCMTrigger

now_ms = new Date().getTime()
hour_ms = 1000 * 60 * 60
// 6 hours
threshold = 6 * hour_ms 

SCM_TRIGGER_DESCRIPTOR = Hudson.instance.getDescriptorOrDie(SCMTrigger.class)
runners =  SCM_TRIGGER_DESCRIPTOR.getRunners()
runners.each() { it ->
  def tgt_name = it.target.asItem().getName()
  def dur = now_ms - it.startTime
  
  println tgt_name + ' running for ' + it.duration
  if(dur > threshold) { 
    tgt = Thread.getAllStackTraces().keySet().find() { item ->
      item.getName().contains("SCM polling") && item.getName().contains(tgt_name)
    }
    
    if (tgt) {
      println '-- stuck in polling, canceling '
      println '---> ' + tgt
    
      tgt.interrupt()
    } else {
      println '-- not stuck in polling '
    }
  } else {
    println '-- below threshold '
  }
  println '---'
}
```