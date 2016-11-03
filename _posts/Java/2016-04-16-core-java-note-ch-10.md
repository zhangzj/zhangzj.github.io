---
layout: post
title: Core Java读书笔记-Chapter 10 部署用用程序和applet
categories: Java
description: Java核心技术第一卷读书笔记
tags: Java Java核心技术
---

* content
{:toc}





怎么把应用程序打包给用户呢？怎么部署到计算机上呢？怎么存储配置信息和用户首选项？

### JAR文件

一个软件，给出一个文件就好了，给出大量的类就很差劲的体验，JAR文件出现了。

使用jar命令来打包

```Java
$ jar cvf JARFileName File1 File2 ...
$ jar cvf CalculatorClasses.jar *.class icon.gif
```

#### 1.清单文件

#### 2.可运行JAR文件

#### 3.资源

#### 4.密封

### Java Web Start

### applet

### 应用程序首选项存储

#### 1.属性映射

#### 2.Preferences API

undone
