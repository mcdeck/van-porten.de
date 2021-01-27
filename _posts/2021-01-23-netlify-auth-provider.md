---
excerpt: Netlify CMS is a great content management system for Jekyll (which runs
  this page). In this article we look at how to set it up without relying on the
  netlify service for authentication.
author: Oliver van Porten
title: Netlify CMS GitHub Oauth
date: 2021-01-23 20:23:00.000000000 +02:00
published: true
header:
  teaser: /assets/teasers/keyboard_870x580.png
status: publish
tags:
  - development
  - php
  - symfony
type: post
categories:
  - software
---
I was looking at running [Netlify CMS](https://www.netlifycms.org/) to make posting on my new blog over at [Dad On Tech](https://www.dad-on-tech.com) a bit easier. 
After some initial tinkering I got it to work with GitHub-based authentication, but that still relied on and/or assumed I would be building with [Netlify Services](https://www.netlify.com/), but in fact I am using the fabulous [GitHub Actions](https://github.com/features/actions) for a while now. The solution seems to be to run your own Oauth server that talks to GitHub, but when I looked at the [Netlify CMS Docs](https://www.netlifycms.org/docs/intro/) the one PHP-based server they list there does not work for me (I actually think it misses a load of code in the repo). Since it was a good opportunity to pick up PHP again I just went and implemented 
something myself. But let's start at the beginning.

# Setting up Netlify CMS

For the initial setup I essentially followed [the guide in the netlify docs](https://www.netlifycms.org/docs/add-to-your-site/). That means creating a
somewhat simplistic `index.html` file that points to the [Netlify CDN](https://www.netlify.com/products/edge/) for the scripts for the moment and has some 
very minimal config, placed in a folder in my Jekyll installation called `admin`. This gets deployed together with the remainder of the site on every commit. 

`admin/index.html`:

```html
<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Content Manager</title>
</head>
<body>
  <!-- Include the script that builds the page and powers Netlify CMS -->
  <script src="https://unpkg.com/netlify-cms@^2.0.0/dist/netlify-cms.js"></script>
</body>
</html>
```

and `admin/config.yml`:

```yml
backend:
  name: github
  repo: mcdeck/dad-on-tech.com
  branch: master # Branch to update (optional; defaults to master)
  
publish_mode: editorial_workflow
media_folder: "assets/uploads" # Media files will be stored in the repo under images/uploads
public_folder: "/assets/uploads" # The src attribute for uploaded media will begin with /images/uploads

collections:
  - name: "blog" # Used in routes, e.g., /admin/collections/blog
    label: "Blog" # Used in the UI
    folder: "_posts" # The path to the folder where the documents are stored
    create: true # Allow users to create new documents in this collection
    slug: "{{year}}-{{month}}-{{day}}-{{slug}}" # Filename template, e.g., YYYY-MM-DD-title.md
    fields: # The fields for each document, usually in front matter
      - {label: "Layout", name: "layout", widget: "hidden", default: "blog"}
      - {label: "Title", name: "title", widget: "string"}
      - {label: "Publish Date", name: "date", widget: "datetime"}
      - {label: "Published", name: "published", widget: "boolean", default: true}
      - label: Header
        name: header
        widget: object
        collapsed: false
        fields:
          - {label: "Teaser", name: "teaser", widget: "image"}
      - {label: "Body", name: "body", widget: "markdown"}
      
```

I also configured a GitHub oauth application following [the instructions in the Netlify docs](https://docs.netlify.com/visitor-access/oauth-provider-tokens/). The finer details of how to set everything up to [work properly with Jekyll are also available in the Nelify docs](https://www.netlifycms.org/docs/jekyll/).

I will not go into the details of setting up Netlify's backend to make things work - I wanted my self-hosted solution instead of relying on 
the netlify services.

## GitHub authentication and why it works locally

This is a bit of a side-note, but when I was testing Netlify CMS in my locally served Jekyll everything worked fine without tinkering with any configuration
in the Netlify backed - which you have to if you want to make Netlify CMS work when deployed to a real server.

In essence, GitHub requires a server, provided by Netlify, but that only works when hosting on Netlify. However, for local deployment Netlify CMs [provides this server 
out of the box - but really only locally](https://github.com/netlify/netlify-cms/issues/1474#issuecomment-462425836). That is of course not avaialble anymore
once you deploy to your shared hosting environment, like I have.

# Implementing my own solution

Why PHP, you may ask, and the answer is simple: I wanted to host on a inexpensive hosting environment I own over at [All-Inkl.com](https://all-inkl.com/). However, the only viable solution 
then is obviously to have apache/php be the server, so I needed a PHP-version of the oauth server. And the one that was [linked to](https://github.com/TSV-Zorneding-1920/netlify-cms-oauth-provider-php)
in [the Netlify Docs](https://www.netlifycms.org/docs/external-oauth-clients/) seems to be broken.

So I sat down an got some inspiration from the [Python version](https://github.com/davidejones/netlify-cms-oauth-provider-python) as well as the
[Node.js](https://github.com/vencax/netlify-cms-github-oauth-provider) one and built my own solution based on PHP using [Symfony as a framework](https://symfony.com/) and relying 
on the [league/oauth2-client](https://github.com/thephpleague/oauth2-client) client for the heavy lifting (the [GitHub specific one, in fact](https://github.com/thephpleague/oauth2-github)).

Implementation is relatively straight forward. Head over [to the repository](https://github.com/mcdeck/netlify-cms-oauth-provider-php) to see the details 
(and I'll talk about open points later). I must say that PHP and it's ecosystem have come a long way since 15 years ago when I last used it in a real project.
Using `composer` to install and manage dependencies and `Symfony` and its dependency injection mechanism is really useful. (I still like Python better, though ;)).

# Setting everything up

Now that we have a working server we can go an install it. I chose to install mine on a custom sub-domain `https://auth.dad-on-tech.com` which requires some extra work as my site hostname is
different from my auth hostname and the javascript I borrowed from the other implementations did not work unless 
I would explicitly [set the origin in the code](https://github.com/mcdeck/netlify-cms-oauth-provider-php/blob/main/templates/redirect.html.twig). 

To setup the server, I created a `.env.local` file and deployed that together with the rest of the code. `https://auth.dad-on-tech.com` obviously points to the `public` folder of the app. So, 
to set things up I first did

```bash
git clone https://github.com/mcdeck/netlify-cms-oauth-provider-php
cd netlify-cms-oauth-provider-php
composer install
```

Then created `.env.local` with the `clientId` and `clientSecret` I configured in Github and finally uploaded everything via simple FTP.

```ini
OAUTH_CLIENT_ID=11111111111111
OAUTH_CLIENT_SECRET=22222222222222222222222222222222222
REDIRECT_URI=https://auth.example.com/callback/
ORIGIN=https://www.example.com
```

To make Netlify CMs use the new authentication server I only needed to update `admin/config.yml` and add this line

```yml
backend:
  ...
  base_url: https://auth.dad-on-tech.com
```

After redeploying the Jeklyll page everything now works as expected!

# Open points

There are certainly still things to do. For one I need to revisit my code after I take some more time to read through the Symfony docs. I would like
to revisit my architecture and how I split controller and service because that is not ideal. I would also want to add some tests but have do better
understand how to do that. 

I will also need to revisit this origin parameter thing in the Javascript code and, last but not least, look at automating deployment - uploading via FTP
is too cumbersome for my test.