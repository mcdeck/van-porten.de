---
layout: post
title: vRest maven build finally working
date: 2011-11-26 22:23:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- eclipse
- FernUni
- java
author: Oliver van Porten
redirect_from:
  - /2011/11/vrest-maven-build-finally-working/
---
I finally managed to get the Maven-based build of my Eclipse-based graphical editor to work - including unit and swtbot-ui tests:

``` text
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO]
[INFO] de.van_porten.vrest.build ......................... SUCCESS [0.077s]
[INFO] de.van_porten.vrest.target-platform ............... SUCCESS [0.112s]
[INFO] de.van_porten.vrest.core .......................... SUCCESS [2.842s]
[INFO] de.van_porten.vrest.core.edit ..................... SUCCESS [0.869s]
[INFO] de.van_porten.vrest.core.editor ................... SUCCESS [0.829s]
[INFO] de.van_porten.vrest.bundle ........................ SUCCESS [0.105s]
[INFO] de.van_porten.vrest.help .......................... SUCCESS [0.076s]
[INFO] de.van_porten.vrest.ui ............................ SUCCESS [1.387s]
[INFO] de.van_porten.vrest.ui.properties ................. SUCCESS [3.650s]
[INFO] de.van_porten.vrest.feature ....................... SUCCESS [0.113s]
[INFO] de.van_porten.vrest ............................... SUCCESS [1:08.099s]
[INFO] de.van_porten.vrest.tests.core .................... SUCCESS [4.087s]
[INFO] de.van_porten.vrest.tests.ui ...................... SUCCESS [13.315s]
[INFO] de.van_porten.vrest.p2-repository ................. SUCCESS [2.498s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 3:02.410s
[INFO] Finished at: Sat Nov 26 22:22:30 CET 2011
[INFO] Final Memory: 97M/231M
[INFO] ------------------------------------------------------------------------
```

I'll push to Jenkins now and see if the continous build and test also works there. Cross your fingers.

The one thing that is bugging me is an oddness with my target platform defintion that for some reason doesn't want to resolve org.apache.batik.\* properly - once I switch target to the development platform everything works as expected. But I will figure that one out eventually ..

More on the culprits and solutions I have to follow shortly.