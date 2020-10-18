---
title: Home
layout: single
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

<div class="entries-grid" style="float:left;">
    {% for post in site.posts limit:3 %}
    <div class="grid__item">
      <article class="archive__item" itemscope itemtype="https://schema.org/CreativeWork">
        <div class="archive__item-teaser">
          <img src="{{ post.header.teaser }}" alt="" style="height: 80px;">
        </div>
        <h2 class="archive__item-title no_toc" itemprop="headline">
            <a href="{{ post.url }}" rel="permalink">{{ post.title }}</a>
        </h2>
      </article>
    </div>
    {% endfor %}
    <div class="grid__item">
      <article class="archive__item" itemscope itemtype="https://schema.org/CreativeWork">
        <div class="archive__item-teaser">
          <img src="{{site.baseurl}}/assets/teasers/teaser_empty_870x580.png" alt="" style="height: 80px;">
        </div>
        <h2 class="archive__item-title no_toc" itemprop="headline">
            <a href="{{ site.baseurl }}/blog/" rel="permalink">more...</a>
        </h2>
      </article>
    </div>
</div>

YouTube
=======

I am currently trying to start a [YouTube Channel](https://www.youtube.com/user/mcdeck), just out of curiosity and to see if I can. 
I post videos around my DIY activities, development projects as well as let's plays - and a lot more soon, I hope.

Projects and References
=======================

You can find a curated List of projects in [my portfolio]({{ site.baseurl }}/portfolio/).
