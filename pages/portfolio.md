---

title: Portfolio
date: 2014-06-19 11:38:06.000000000 +02:00
published: true
categories: []
tags: []
permalink: /portfolio/
author_profile: true
---
<ul>
  {% for project in site.portfolio %}
    <li>
      <a href="{{ project.url }}">{{ project.title }}</a>
      <p>{{ project.description | markdownify }}</p>
    </li>
  {% endfor %}
</ul>