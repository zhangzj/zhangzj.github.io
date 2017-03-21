---
layout: post
title: "Linux JDK Environment Variables Config"
categories: Java
tags: JDK Linux
---

* content
{:toc}





Java Develop Kit need to be find in system.

Edit user home bashrc file `/home/username/.bashrc`

Append these sentence.

```
export JAVA_HOME=/home/username/JavaDevEnv/jdk[version]
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
```

then logout and login or just `source .bashrc`.

Try some command to see if worked.

```
>java -version
```
