---
title: Home
date: 2014-06-19 10:33:44.000000000 +02:00
published: true
categories: []
tags: []
permalink: /
---

Seit mehr mehr als 15 Jahren im Bereich Software Engineering und Software Architektur. 

Auf der [Über Mich Seite]({{ site.baseurl }}/about/) als auch auf [Xing](https://www.xing.com/profile/Oliver_vanPorten) und [LinkedIn](https://de.linkedin.com/in/ovanporten/) finden Sie weitere Informationen über meinen Lebenslauf.

Blog.
=====

[In meinem Blog]({{ site.baseurl }}/blog/) schreibe ich zu allen möglichen Themen rund um die IT. Zur Zeit beschäftige ich mit intensiv mit Themen rund um das Internet of Things und SmartHome. Meinen Blog verfasse ich normalerweise auf Englisch. 

Die aktuellsten Einträge:

{% for post in site.posts limit:2 %}
  * [{{ post.title }}]({{ post.url }}) ({{ post.date }})
{% endfor %}
  * [mehr ...]({{ site.baseurl }}/blog/) 

Projekte und Referenzen
=======================

Einen Auszug aus meinem [Portfolio gibt es hier]({{ site.baseurl }}/portfolio/).
