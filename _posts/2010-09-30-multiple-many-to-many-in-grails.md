---

title: Multiple Many-to-Many in Grails
date: 2010-09-30 08:02:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- gorm
- grails
- groovy
author: Oliver van Porten
redirect_from:
  - /2010/09/multiple-many-to-many-in-grails/

excerpt: In this post we look at creating Multiple Many-to-Many in Grails

header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/keyboard_870x580.png
---
Creating many-to-many relationships in [Grails](http://www.grails.org) is quite simple. It is also possible to have multiple many-to-many relationships in a single class, but for some reason I found little documentation on how to do this. It is actually quite simple once you know how to and pretty much comes down to syntactic sugar, so to speak. Read more after the break.

Let's assume you wanted to model two distinct domain classes which both can have **Tags**.

![Many-to-Many UML Diagram]({{ site.baseurl }}/assets/images/manytomany.jpg)

Now, the owning side of the relationship should be the **DomainClass1** and **DomainClass2** respectively.

Your domain class code would look something like this:

``` groovy
class DomainClass1 {
  ...
  static hasMany = [
    tags: Tag
  ]
  static mappedBy = [
    tags: "domainClass1s"
  ]
}

class DomainClass2 {
  ...
  static hasMany = [
    tags: Tag
  ]
  static mappedBy = [
    tags: "domainClass2s"
  ]
}
```

Next, you need to define the Tag class:

``` groovy
class Tag {

  String value

  static hasMany = [
    domainClass1s: DomainClass1,
    domainClass2s: DomainClass2
  ]

  static mappedBy = [
    domainClass1s: "tags",
    domainClass2s: "tags"
  ]

  static belongsTo = [
    DomainClass1, DomainClass1
  ]

  static constraints = {
    value(unique:true)
  }

  @Override public String toString() {
    return value
  }
}
```

The part that is rarely documented online is the **belongsTo** statement.

``` groovy
static belongsTo = [
  DomainClass1, DomainClass1
]
```

This tells groovy the owners are DomainClass1 and DomainClass2. You're done. Pretty simple, isn't it? Hope this helps someone.

**References**

[http://www.grails.org/doc/latest/guide/single.html#5.5.2%20Custom%20ORM%20Mapping](http://www.grails.org/doc/latest/guide/single.html#5.5.2%20Custom%20ORM%20Mapping)

[http://osdir.com/ml/lang.groovy.grails.user/2008-05/msg02094.html](http://osdir.com/ml/lang.groovy.grails.user/2008-05/msg02094.html)