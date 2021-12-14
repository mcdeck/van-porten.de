---

title: dad-on-tech.com
date: 2021-12-10 20:59:44.000000000 +02:00
published: true
status: publish
categories: []
tags: []

header: 
  # image: /assets/images/developia_current.png
  teaser: /assets/images/dadontech.png
  technology:
  - html
  - hugo

excerpt:
  Dad on Tech is my pet project of late. I publish articles 
  about everything tech there. Driven by Hugo and GitHub.

---

> Technologie 💻 und Gadgets 🎮 🤖 für die ganze Familie. Kann Spuren von Spielzeug 🕹️ 🃏 enthalten.

Dad on Tech is my pet project of late. At [dad-on-tech.com](https://dad-on-tech.com) I publish articles (in German, oddly enough) about 
technology, gadgets, smart home, toys and anything that catches my eye, really. I use it as my outlet for talking about all the things
I like to play with, that I do not find a good place to talk about otherwise (so also not on my [blog]({{ site.baseurl }}/blog) here)

![dad-on-tech.com]({{ site.baseurl }}/assets/images/dadontech.png)

The page is built using [Hugo](https://gohugo.io/) and the theme based on [geeky-hugo](https://github.com/gethugothemes/geeky-hugo), albeit with some modifications.
In particular I added some code to support the GDPR as best as I could based on [Klaro](https://github.com/kiprotect/klaro). 

The site gets built using a github pipeline with the [hugo action from peaceiris](https://github.com/peaceiris/actions-hugo). At some point I tried to
content manage everything with [forestry.io](https://forestry.io/) and then also using [netlify-cms](https://www.netlifycms.org/) but did not like
either very much. I am now using simple vscode with the [frontmatter](https://marketplace.visualstudio.com/items?itemName=eliostruyf.vscode-front-matter) addon, 
which is kind of nice.

For the record, I like hugo a lot better than Jekyll and may eventually switch also [van-porten.de](https://van-porten.de) to use it. 
