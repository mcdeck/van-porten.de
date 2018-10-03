---
layout: page
title: Task Board
date: 2014-08-20 21:02:09.000000000 +02:00
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
author: Oliver van Porten

description: >-
  A task board is typically a phyisical whiteboard that an agile team uses to track their progress. The notion of a task board is most prominently used in 
  [Software Kanban](http://en.wikipedia.org/wiki/Kanban_%28development%29), where the board is the one central information hub the team works with.
---

What is a task board?
=====================

A task board is typically a phyisical whiteboard that an agile team uses to track their progress. The notion of a task board is most prominently used in [Software Kanban](http://en.wikipedia.org/wiki/Kanban_%28development%29), where the board is the one central information hub the team works with.

Why a web-based tool?
=====================

Unfortunately it is not always possible to colocate teams. Traceability requirements also might force the use of a digital tool for tracking user stories or tasks.

A web-based tool can offer almost the same features that a phyisical board can do. It provides a simple web-based view on team commitments and lets the team work with this.

How is this board different from others?
========================================

There are a million other great tools out there (for example, [Rally](http://www.rallydev.com/) and [Jira with Jira Agile](https://www.atlassian.com/software/jira/agile), just to name two). However, there is a common flaw in al those tools: They require you switch your your tracking tool completely.

While that might be possible in some situations, in others you might be tied to a certain tool and cannot change. And for that tool there might just be no task boards available.

Finally, switching to a completely new tool is disruptive. Why swap out a complete (working) stack of software for something else, just to have a digital task board?

The Idea
========

The idea of this task board is hence to offer a vendor-independant board. That is, there will be adapters for various vendors. Currently, the plan foresees to support Mantis and Bugzilla.

The concept has already been proven to work with a prototype on FogBugz, so a FogBugz port of this new version will also be done in due time.

Other systems depend on community support (or can become sponsored development efforts if someone is willing to pay for it instead of doing it themselves - [get in touch]({{ site.baseurl }}/contact)).

Technology
==========

Not decided yet. The prototype is based on [Python](http://www.python.org) and [Django](https://www.djangoproject.com/). I am thinking of developing the final version in [Grails](https://grails.org/) or maybe [Spring](https://spring.io/) directly.

Screenshots
===========

Here is a first screenshot of a design-concept for the new version. The old one does look a lot uglier (still get's the job done perfectly).

![Taskboard Redesign Draft]({{ site.baseurl }}/assets/Screenshot-2014-06-22-22.44.39.png)

Downloads
=========

Not available yet, obviously. I will update the pages here as soon as versions become available.

License
=======

Will be something open-source, haven't finally decided which license exactly.