---
title: AWK Function
date: 2006-06-07 09:54:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags: []
author: Oliver van Porten
redirect_from:
  - /2006/06/awk-function/

excerpt: In this post we look at my first AWK function
---
Just for the hell of it. A little awk function to find a columns id in a  
csv file. Quite a handy one I might add:

```awk
function find_column(name,  column,i) {
    column = 0;
    i = 1;
    while( i != NF )
    {
        if( $i == name )
        {
            column = i;
        }
        i++;
    }
    return column;
}
```