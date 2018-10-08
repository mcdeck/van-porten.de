---
title: Converting Wordpres sto GitHub Pages
date:
published: false
author: Oliver van Porten
---

useful links
- https://domchristie.github.io/turndown/
- https://blog.jmtalarn.com/migrate-blog-from-wordpress-to-jekyll/


What I tried before:
/blog/2013/06/new-blogging-engine

export from wordpress site to xml (include everything)

``` ruby
require "jekyll-import";
JekyllImport::Importers::WordpressDotCom.run({
    "source" => "_import/olivervanporten.wordpress.2018-10-01.xml",
    "no_fetch_images" => false,
    "assets_folder" => "assets"
})
```

for fav icons
https://realfavicongenerator.net/
https://editor.method.ac/
