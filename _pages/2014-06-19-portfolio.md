---
layout: page
title: Portfolio
date: 2014-06-19 11:38:06.000000000 +02:00
type: page
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
author: Oliver van Porten
---
<ul>
  {% for project in site.portfolio %}
    <li>
      <a href="{{ project.url }}">{{ project.title }}</a>
      <p>{{ project.description | markdownify}}</p>
    </li>
  {% endfor %}
</ul>