---
layout: default
title: Using Liquibase with Sprint Boot
date: 
type: post
published: false
status: draft
categories: []
tags: []
author: Oliver van Porten
---

Gist: Getting it to work following multiple tutorials, in the end needed to specify exact version of liquibase-hibernate5 to make hibernate referenceUrl work correctly:

    				<dependency>
						<groupId>org.liquibase.ext</groupId>
						<artifactId>liquibase-hibernate5</artifactId>
						<version>4.1.0</version>
					</dependency>

other good starting points:
* https://www.sipios.com/blog-tech/generate-spring-boot-migrations-from-hibernate-entities
* https://reflectoring.io/database-migration-spring-boot-liquibase/
* https://www.baeldung.com/liquibase-refactor-schema-of-java-app
* https://blog.quadiontech.com/database-migrations-with-springboot-maven-and-liquibase-9fe7a7b8b8df
* https://docs.liquibase.com/tools-integrations/springboot/using-springboot-with-maven.html


Importing runtime data - base on initial data generated via database loader, but can also be handcrafted (which is tedious, of course ...)

--> find out how to do it in hibernate without duplicating data all the time 
    maybe this would be usefule: https://docs.spring.io/spring-boot/docs/2.1.x/reference/html/howto-database-initialization.html

essentially, do data export, using mvn goal:

 mvn -Dliquibase.diffTypes=data -Dliquibase.dataDir=src/main/resources/db/changelog/data liquibase:generateChangeLog

 puts CSV files into data directory

 tune generated changelog:
  remove src/main/resources from paths of CSV files

  possibly need to re-orderd import in changelog -> my issue was that it cause database foreign key constraint error because join table was imported prior to object table