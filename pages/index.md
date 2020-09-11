---
title: Home
date: 2020-09-11
published: true
categories: []
tags: []
permalink: /
# author_profile: true
---

Wilkommen auf meiner Webseite. 

Computer und Software sind und waren schon immer meine Leidenschaft. 
Seit mehr als 15 Jahren bin ich beruflich im Bereich Software Engineering und Software Architektur tätig.  

Unter [Über Mich]({{ site.baseurl }}/about/) als auch auf [Xing](https://www.xing.com/profile/Oliver_vanPorten) 
und [LinkedIn](https://de.linkedin.com/in/ovanporten/) gibt es weitere Informationen über mich und meinen Lebenslauf.

Blog.
=====

[In meinem Blog]({{ site.baseurl }}/blog/) schreibe ich zu allen möglichen Themen rund um die IT. 
Zur Zeit beschäftige ich mit intensiv mit Themen rund um das CI/CD, Cloud, DevOps und Full Stack Web Entwicklung.
Andere Dauerbrenner sind das Internet of Things und SmartHome. Meinen Blog verfasse ich normalerweise auf Englisch. 

Die aktuellsten Einträge:

{% for post in site.posts limit:2 %}
  * [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%-d %B %Y" }})
{% endfor %}
  * [mehr ...]({{ site.baseurl }}/blog/) 

Projekte und Referenzen
=======================

Einen Auszug aus meinem [Portfolio gibt es hier]({{ site.baseurl }}/portfolio/).
