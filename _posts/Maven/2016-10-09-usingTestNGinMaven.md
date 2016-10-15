---
layout: post
title: Using TestNG in Maven
categories: maven
description: TestNG is a Java unit testing framework, This post is using xml to run testng in maven.
tags: maven
---

* content
{:toc}





To run testng in maven, you need to configure a plugin named with surefire in pom.xml.

```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>xyz.zhangzhoujian</groupId>
  <artifactId>hello</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>jar</packaging>

  <name>hello</name>
  <url>http://maven.apache.org</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>

  <dependencies>
    <!-- http://mvnrepository.com/artifact/org.testng/testng -->

  <dependency>
    <groupId>org.testng</groupId>
    <artifactId>testng</artifactId>
    <version>6.9.10</version>
    <scope>test</scope>
  </dependency>

  </dependencies>

  <build>
  <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>2.19.1</version>
        <configuration>
          <suiteXmlFiles>
            <suiteXmlFile>testng2.xml</suiteXmlFile>
          </suiteXmlFiles>
        </configuration>
      </plugin>
</plugins>
</build>
</project>
```

Of course, you also need make a testng.xml to config some test class.

testng.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">
<suite name="Suite">
    <test name="TestDebug" preserve-order="true">  
        <classes>
            <class name="xyz.zhangzhoujian.helloTest.WorldTest" />
        </classes>
    </test> <!-- Test -->
</suite> <!-- Suite -->
```

Maven is cool.
