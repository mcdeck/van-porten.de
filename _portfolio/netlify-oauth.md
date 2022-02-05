---
title: netlify-cms-oauth-provider-php
date: '2022-02-05T21:44:06.836Z'
published: true
status: publish
categories: []
tags: []
header:
  teaser: /assets/images/2016-05-15-23_25_54-cmd-python-service.py_-300x178.png
group: code
---

A netlify-cms has its own github OAuth client. This implementation was created by reverse engineering the results of that client, so it's not necessary to reimplement client part of netlify-cms.

Github, Github Enterprise and Gitlab are currently supported, but as this is a general Oauth client, feel free to submit a PR to add other git hosting providers.

https://github.com/mcdeck/netlify-cms-oauth-provider-php