---
layout: post
title: "Spring MyBatis SpringMVC 框架基本整合"
categories: spring
excerpt: 
tags: spring mybatis springmvc webservice Java 后端
---

* content
{:toc}

Spring框架整合第三弹；
使用SSM框架搭建最基本的web service




### 基本问题

- 如何做一个最基本的 web service

- SSM框架怎么整合使用？最小集合的基本使用？

### 事前准备

- 本地的MySQL服务创建配置OK

### 具体手顺

#### 项目创建

- 使用maven进行构建，创建新项目，使用模板webapp

- 项目Github地址：[ssmdemo](https://github.com/AllenChyou/ssmdemo)

#### 数据准备

- 创建数据库表结构

    文件：src/main/resources/sql/schema.sql

#### DAO代码生成

- 使用mybatis-generator根据数据库生成代码

    文件：src/main/resources/generatorConfig.xml

- 添加生成代码用的maven插件

- 生成之后的目录结构

![](http://ww4.sinaimg.cn/large/8d6a2535gw1f8qpzx3t9ij208u0e2wfw.jpg)

#### 编辑MyBatis配置文件

- 文件：src/main/resources/mybatis-config.xml

#### 添加pom.xml中的依赖

- 文件：pom.xml

- 依赖包括mybatis相关和spring相关包

- maven-jetty-plugin插件是项目运行的web容器

#### 配置web.xml文件

- 容器根据这个文件加载context文件

#### 编辑ssmdemo-dispatcher-servlet.xml文件

- 这个文件的名字是固定的，项目名称-dispatcher-servlet.xml

#### 构建UserService接口和实现

- UserService接口

- UserServiceImpl实现

#### 构建Controller

- UserController实现

### 小结

- 最最基本的SSM搭建，只是跑通了，web service起来了

- 有待完善的点

    - 只有查询方法，CRUD的添加有待完成

    - 数据交互没有JSON格式化，只是文本



