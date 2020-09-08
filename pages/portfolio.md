---

title: Portfolio
date: 2014-06-19 11:38:06.000000000 +02:00
published: true
categories: []
tags: []
permalink: /portfolio/

---

<ul>
  {% assign projects = site.portfolio | sort: 'date' | reverse %}
  
  {% assign projects_by_state = projects | group_by_exp: "prj",
        "prj.active | default: false" | sort: 'name' | reverse %}

  {% for a in projects_by_state %}
    {% if a.name == true %} 
      <h2>Active</h2>
    {% else %}
      <h2>Archived</h2>
    {% endif %}
    {% for project in a.items %}
      <li>
        {% if project.teaser %}
          <img src="{{ site.baseurl }}{{ project.teaser }}" />
        {% endif %}
        <a href="{{ project.url }}">{{ project.title }}</a>
        <p>{{ project.description | markdownify }}</p>
      </li>
    {% endfor %}
  {% endfor %}
</ul>