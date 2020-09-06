---

title: Visual REST
date: 2016-01-10 22:01:22.000000000 +01:00
published: true
categories: []
tags: []

description: >-
  [Visual REST](https://github.com/mcdeck/visualrest/wiki) is a graphical modelling language for the design of resource-oriented applications. 
  I developed Visual REST as part of my [master's thesis at the University of Hagen](http://deposit.fernuni-hagen.de/2810/) in 2012.
  It is implemented as an [Eclipse](http://www.eclipse.org/)\-based editor using [Graphiti](http://www.eclipse.org/graphiti/) and enables
  creation of application models. As of today, code generation is not part of the IDE, though.
---
[Visual REST](https://github.com/mcdeck/visualrest/wiki) is a graphical modelling language for the design of resource-oriented applications. I developed Visual REST as part of my [master's thesis at the University of Hagen](http://deposit.fernuni-hagen.de/2810/) in 2012. It is implemented as an [Eclipse](http://www.eclipse.org/)\-based editor using [Graphiti](http://www.eclipse.org/graphiti/) and enables creation of application models. As of today, code generation is not part of the IDE, though.

Visual REST is ~~[available on Bitbucket.](https://bitbucket.org/visualrest/visual-rest/wiki/Home)~~ [available on GitHub](https://github.com/mcdeck/visualrest) It is, however, no longer actively developed. If you are looking for a graphical modelling language for RESTful applications I suggest taking a look at the [REST API design tool](http://www.visual-paradigm.com/solution/rest-api-design-tool/) developer by the people at [Visual Paradigm.](http://www.visual-paradigm.com/)

The views
---------

Visual REST as a language and thus also our Eclipse-based implementation consists of four types of views on an application model. The resource structure type overview diagram shows the complete resource-oriented application:

![bookshop_overview]({{ site.baseurl }}/assets/bookshop_overview-1024x361.png)

The resource type structure diagram shows a more verbose representation of resource types in an application. Visual REST also allows partitioning an application over more than one such diagram.

![bookshop_structure]({{ site.baseurl }}/assets/bookshop_structure-1024x395.png)

The resource type states diagram visualizes resource type states and the methods that are supported in each state. It also shows the transitions between states.

![bookshop_states]({{ site.baseurl }}/assets/bookshop_states-300x121.png)

Finally, the resource type method behavior diagram models the behaviour of each method.

![bookshop_methods]({{ site.baseurl }}/assets/bookshop_methods-300x262.png)

The following image shows how the different view of the language relate:

![model_layers]({{ site.baseurl }}/assets/model_layers-1024x740.png)

Syntax Elements
---------------

The following pages give an overview of the syntax elements available for the different Visual REST views:

*   [Overview Diagram](https://bitbucket.org/visualrest/visual-rest/wiki/StructureOverviewSyntax)
*   [Structure Diagram](https://bitbucket.org/visualrest/visual-rest/wiki/StructureSyntax)
*   [States Diagram](https://bitbucket.org/visualrest/visual-rest/wiki/StatesSyntax)
*   [Method Diagram](https://bitbucket.org/visualrest/visual-rest/wiki/MethodSyntax)

The Eclipse Editor
------------------

The editor supports developers by prodiving additional features besides editing the language itself. Amongst others, one of these features is the application outline which the following screenshots shows:

![editor]({{ site.baseurl }}/assets/editor-1024x749.png)

Obtaining the Editor
--------------------

The editor is built from source automatically. The latest stable builds can be obtained from our continuous integration server:

*   ~~[latest stable build (continuous build)](http://ci.van-porten.de/job/VisualREST/lastSuccessfulBuild/artifact/src/de.van_porten.vrest.p2-repository/target/products/)~~
*   nightly build (TBD)
*   release builds (TBD)

Continuous Integration
----------------------

More info can be found on the [ContinuousIntegration](https://bitbucket.org/visualrest/visual-rest/wiki/ContinuousIntegration) wiki page.

Publications
------------

*   Schreier, S.: Modeling RESTful applications. In: Proceedings of the Second International Workshop on RESTful Design. pp. 15-21. ACM, New York (2011)
*   van Porten, O.: Development and Evaluation of a Graphical Notation for Modelling Resource-Oriented Applications. Research Report 1/2012, FernUniversität in Hagen (2012), [http://deposit.fernuni-hagen.de/2810/](http://deposit.fernuni-hagen.de/2810/)
