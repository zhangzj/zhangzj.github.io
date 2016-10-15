---
layout: post
title: "Maven仓库更换阿里源"
categories: maven
description: Insert some config sentence in setting.xml
tags: maven
---

* content
{:toc}





maven的中央仓库实在是太慢了，直接替换阿里的mirror

- 阿里源

在maven的setting.xml文件中，找到mirrors节点插入以下mirror

Ubuntu系统下的settings.xml路径
```
/etc/maven/settings.xml
```

Windows系统下的settings.xml路径
```
~/.m2/settings.xml
```

```
<mirror>
  <id>nexus-aliyun</id>
  <mirrorOf>*</mirrorOf>
  <name>Nexus aliyun</name>
  <url>http://maven.aliyun.com/nexus/content/groups/public</url>
</mirror> 
```

试一下。嗖嗖地~~  XIUXIUXIU~~~