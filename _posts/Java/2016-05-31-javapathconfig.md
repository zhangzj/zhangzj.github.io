---
layout: post
title: "Linux JDK Environment Variables Config"
categories: Java JDK
tags: JDK Linux
description: Java config memo
---

* content
{:toc}





Java Develop Kit need to be find in system.

Edit /etc/profile, maybe need to be root.

Append these sentence.

```
export JAVA_HOME=/home/username/JavaDevEnv/jdk[version]
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
```

then logout and login.

Try some command to see if worked.

```
>java -version
```