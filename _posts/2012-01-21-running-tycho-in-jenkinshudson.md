---
layout: post
title: Running Tycho in Jenkins/Hudson
date: 2012-01-21 17:56:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- ci
- eclipse
- hudson
- jenkins
- maven
- tycho
author: Oliver van Porten
---
When I first started running my Tycho/Maven build of my visual editor in Jenkins the build would always fail if a single test failed. That was mainly because the Maven build would run the surefire test automatically but cancel the build if there were any failures in them. In turn, this would not keep artifacts from being generated and thus not create a new snapshot release. To make matters worse, my tests are not that stable yet - running them on Linux sometimes fails for no reason whatsoever, leading to yet another broken build.

Now, this is obviously not what you (or Jenkins, for that matter) would expect to happen. What I wanted and what I guess you would normally want is for the build to pass but for Jenkins to mark the build as "unstable".

To acomplish this on the command line, you simply need to tell Maven to ignore test failures

``` console
mvn clean install -Dmaven.test.failure.ignore=true
```

With Jenkins, this is equally straight forward:

![image0]({{ site.baseurl }}/assets/vREST-Config-Jenkins-Mozilla-Firefox_2012-01-21_17-45-38.png)

Now Jenkins acts nicely and reports unstable builds while still producing all artifacts.