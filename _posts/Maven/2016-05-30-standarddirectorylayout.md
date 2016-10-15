---
layout: post
title: Introduction to the Standard Directory Layout
categories: maven
description: There is a standard directory layout to make people comfort
tags: maven
---

* content
{:toc}





There is a standard layout about directory to make people feel at home. Maven will create it with initialization.

The first point to divide is which directory level file will be. Discription files will be in the top level.

##### Out of src/

- LICENSE.txt: this is the project's license
- NOTICE.txt: there are some projects or libraries need to be noticed, they will be depended.
- README.txt or markdown file: readme file.

Files that not in the top level of project will be in directories. Such as src, where to place source files.

##### Inside src/

In the src/ folder, many subfolders can place different files.

Folder|Function
:---|:---
src/main/java| 	Application/Library sources
src/main/resources| 	Application/Library resources
src/main/resources-filtered| 	Application/Library resources which are filtered. (Starting with Maven 3.4.0, not yet released.)
src/main/filters 	|Resource filter files
src/main/webapp 	|Web application sources
src/test/java 	|Test sources
src/test/resources| 	Test resources
src/test/resources-filtered| 	Test resources which are filtered by default. (Starting with Maven 3.4.0, not yet released.)
src/test/filters 	|Test resource filter files
src/it 	|Integration Tests (primarily for plugins)
src/assembly| 	Assembly descriptors
src/site |	Site

Note: This is just directory layout, not package name.