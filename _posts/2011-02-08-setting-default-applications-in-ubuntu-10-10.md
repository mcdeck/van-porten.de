---
layout: post
title: Setting default applications in Ubuntu 10.10
date: 2011-02-08 23:15:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- linux
- ubuntu
author: Oliver van Porten
redirect_from:
  - /2011/02/setting-default-applications-in-ubuntu-1010/
  - /2011/02/setting-default-applications-in-ubuntu-10-10/
---
After installing Adobe Reader into my Ubuntu installation I noticed that the Adobe Reader was actually making itself at home as the default viewer for PDF files. However, I do only rarely use it because I feel that the Ubuntu Document Viewer (aka evince) is the quicker and better solution most of the time.

Now, I could change the default for double-clicking by going through any PDF file's **Properties->Open With** and selecting _Document Viewer_ there. Firefox and Thunderbird for one thing did not really seem to care at all about this, though. Both kept using Adobe Reader to open PDF files when double-clicking in the download window and only offered the reader as the default in the file save dialog.

To work around this problem, I came up with a solution using **xdg-mime**.

In a terminal, I did

``` bash
porten@lx-porten:~$ xdg-mime query default application/pdfacroread.desktop
porten@lx-porten:~$ sudo xdg-mime default evince.desktop application/pdf
porten@lx-porten:~$ xdg-mime query default application/pdfevince.desktop
```

Obviously the important part is the **xdg-mime default**. I would actually have expected setting the default via the file properties to have the same effect, but alas, it does not.

**References:**

[https://bbs.archlinux.org/viewtopic.php?pid=732724](https://bbs.archlinux.org/viewtopic.php?pid=732724)

[http://manpages.ubuntu.com/manpages/maverick/man1/xdg-mime.1.html](http://manpages.ubuntu.com/manpages/maverick/man1/xdg-mime.1.html)