---
title: Home
date: 2020-09-11
published: true
categories: []
tags: []
permalink: /
# author_profile: true
---

Welcome!

Computer and Software have always been my passion, and I am fortunate enough to have worked for more than 15 years in this field as a professional, focusing on Software Engineering and Software Architecture.  

You can find more information about me on the the [About]({{ site.baseurl }}/about/) page as well as on [Xing](https://www.xing.com/profile/Oliver_vanPorten) and [LinkedIn](https://de.linkedin.com/in/ovanporten/).

Blog
====

[On my Blog]({{ site.baseurl }}/blog/) I write about all sorts of topics related to IT. I am currently spending a lot of time and effort with `CI/CD`, `Cloud`, `DevOps` and `Full Stack Web Development`. Another constant area of interested is the `Internet of Things` and `SmartHome`. 

Latest entires:

{% for post in site.posts limit:2 %}
  * [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%-d %B %Y" }})
{% endfor %}
  * [more ...]({{ site.baseurl }}/blog/) 

YouTube
=======

I am currently trying to start [YouTube Channel](https://www.youtube.com/user/mcdeck), just out of curiosity and to see if I can. I post videos around my DIY activities, development projects as well as let's plays - and a lot more soon, I hope.

Projects and References
=======================

You can find a curated List of projects in [my portfolio]({{ site.baseurl }}/portfolio/).
