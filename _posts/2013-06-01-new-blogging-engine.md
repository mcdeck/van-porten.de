---
layout: post
title: New blogging engine
date: 2013-06-01 10:10:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- blog
- software
author: Oliver van Porten
redirect_from:
  - /2013/06/new-blogging-engine/
---
Finally, after a year of almost no activity, I have updated my blog with new software. I used to run [Wordpress](http://www.wordpress.org) for the past seven or so years but finally decided it was time for something new. As of today, I am running on [Pelican](http://blog.getpelican.com/), a Python-based static website generator. This means good-bye to the php-based dynamic colution. I hope this will give this blog some more security. Comments will be via [Disqus](http://www.disqus.com) for the moment, for want of a better alternative. I still plan to eventually migrate to completely static comments, but for now Disqus will do.

Also, you might notice that the theme I use looks a lot like the one from [Octopress](http://octopress.org/). This is because I use the fabolous Pelican Octopress theme by [Maurizio Sambati](http://blogs.skicelab.com/maurizio/). I don't use Octopress itself at the moment because I still have a hard time working with [Ruby](http://www.ruby-lang.org/) on Windows. Also, Pelican easily supports [reStructured Text](http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html) out of the box which I do in fact like better than [Markdown](http://daringfireball.net/projects/markdown/) (and have used it more often).

My new setup includes some more nifty technical details.

For ease of deployment, I have devised a workflow that is based on [RhodeCode](http://rhodecode.org/) and [Jenkins](http://jenkins-ci.org/). I have setup a [RhodeCode instance](http://rc.van-porten.de) on my local server where I store the source to my blog. At the moment I use [Mercurial](http://mercurial.selenic.com/) to manage the versions. Furthermore, I have a [Jenkins installation](http://ci.van-porten.de/) on the same server that pulls from the RhodeCode instance, builds the blog contents and publishes the result here afterwards. To avoid frequently polling on Mercurial, I have also installed a trigger in Mercurial (or RhodeCode respectively) that triggers the rebuild of the blog. The following figure gives an overview.

![new publishing workflow]({{ site.baseurl }}/assets/workflow.png)

Now, this might seem like a bit of overhead on the setup side, but I had a lot of fun automating it this way. Technically I could just as well pusblish the blog from my personal PC everytime, but I found that to be an unworthy alternative ;)