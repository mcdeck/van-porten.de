---

title: Running WindowTester Pro from Maven/Tycho
date: 2012-01-22 12:40:00.000000000 +01:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags:
- eclipse
- maven
- tycho
- windowtester pro
author: Oliver van Porten
redirect_from:
  - /2012/01/running-windowtester-pro-from-maventycho/

excerpt: In this post we look at how to run Window Tester
    Pro from Myven and Tycho.

header: 
  # image: /assets/images/cuxd_settings.png
  teaser: /assets/teasers/construction_870x580.png
---
Running SWTBot tests as part of your maven/tycho build cycle is rather well documented and pretty straight forward (see for example the [sonatype docs](https://docs.sonatype.org/display/TYCHO/How+to+run+SWTBot+tests+with+Tycho)). Doing so with a [WindowTester Pro](http://code.google.com/javadevtools/wintester/html/index.html) recorded test is not - but then again it is pretty straigt forward as well.

There are just two things that you need to change from the SWTBot tests pom.xml (as presented in the [sonatype docs](https://docs.sonatype.org/display/TYCHO/How+to+run+SWTBot+tests+with+Tycho)):

*   have **useUIThread = true**
*   add a dependecy to **com.windowtester.runtime.feature.group** to pull in platform specific plugins

You will also need to tell maven/tycho where to find the latter feature, of course, by adding  
[http://dl.google.com/eclipse/inst/windowtester/beta/3.7](http://dl.google.com/eclipse/inst/windowtester/beta/3.7) to your  
repositories.

A sample pom.xml looks like this:

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<project xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"
  xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <modelversion>4.0.0</modelversion>
  <parent>
    <artifactid>de.van_porten.vrest.build</artifactid>
    <groupid>de.van_porten</groupid>
    <version>0.0.1-SNAPSHOT</version>
    <relativepath>../de.van_porten.vrest.build</relativepath>
  </parent>
  <groupid>de.van_porten</groupid>
  <artifactid>de.van_porten.vrest.tests.recorded</artifactid>
  <version>1.0.0-SNAPSHOT</version>
  <packaging>eclipse-test-plugin</packaging>

  <repositories>
    <repository>
      <id>windowtester</id>
      <layout>p2</layout>
      <url>http://dl.google.com/eclipse/inst/windowtester/beta/3.7</url>
    </repository>
  </repositories>

  <build>
    <plugins>
      <plugin>
        <groupid>org.eclipse.tycho</groupid>
        <artifactid>tycho-surefire-plugin</artifactid>
        <version>${tycho-version}</version>

        <configuration>
          <testsuite>de.van_porten.vrest.tests.recorded</testsuite>
          <testclass>de.van_porten.vrest.tests.recorded.AllTests</testclass>

          <useuiharness>true</useuiharness>
          <useuithread>true</useuithread>
          <!-- use our product and application to launch the tests -->
          <product>de.van_porten.vrest.bundle.product</product>
          <application>org.eclipse.ui.ide.workbench</application>

          <dependencies>
            <dependency>
              <type>p2-installable-unit</type>
              <artifactid>com.windowtester.runtime.feature.group</artifactid>
              <version>0.0.0</version>
            </dependency>
          </dependencies>
        </configuration>

      </plugin>
    </plugins>
  </build>

  <profiles>
    <profile>
      <id>osx</id>
      <activation>
        <property>
          <name>java.vendor.url</name>
          <value>http://www.apple.com/</value>
        </property>
      </activation>
      <build>
        <pluginmanagement>
          <plugins>
            <plugin>
              <groupid>org.eclipse.tycho</groupid>
              <artifactid>tycho-surefire-plugin</artifactid>
              <version>${tycho-version}</version>
              <configuration>
                <argline>-XstartOnFirstThread</argline>
              </configuration>
            </plugin>
          </plugins>
        </pluginmanagement>
      </build>
    </profile>
  </profiles>

</project>
```