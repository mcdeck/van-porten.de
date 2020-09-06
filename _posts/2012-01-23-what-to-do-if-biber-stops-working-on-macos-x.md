---

title: What to do if biber stops working on MacOS X
date: 2012-01-23 20:36:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- biber
- biblatex
- latex
author: Oliver van Porten
redirect_from:
  - /2012/01/what-to-do-if-biber-stops-working-on-macos-x/
---
Yesterday evening I ran into a bit of a problem when I tried building my latex document that uses biblatex/biber. For some reason, biber would not generate any output but fail with

``` bash
Olivers-MacBook-Air:~ porten$ biber
data source /var/folders/5c/y7ssnfgj2fz1fnx1gz_z7ng80000gn/T/par-porten/cache-5a7f3069e2a4d51fd3557003fc55ec74c554c947//inc/lib/Biber/LaTeX/recode_data.xml not found in .
Compilation failed in require at Biber/Utils.pm line 21.
BEGIN failed--compilation aborted at Biber/Utils.pm line 21.
Compilation failed in require at Biber/Internals.pm line 8.
BEGIN failed--compilation aborted at Biber/Internals.pm line 8.
Compilation failed in require at (eval 22) line 2.
    ...propagated at /opt/local/lib/perl5/5.14.1/base.pm line 94.
BEGIN failed--compilation aborted at Biber.pm line 5.
Compilation failed in require at script/biber-darwin line 20.
BEGIN failed--compilation aborted at script/biber-darwin line 20.
```
Now, what fixes this is simply deleting the par cache:

``` bash
sudo rm -rf /var/folders/5c/y7ssnfgj2fz1fnx1gz_z7ng80000gn/T/par-porten/
```

Sources:
   * [Andrew Goldstone's Blog](http://humtex.wordpress.com/2011/11/29/biber-first-aid-for-data-source-not-found/)