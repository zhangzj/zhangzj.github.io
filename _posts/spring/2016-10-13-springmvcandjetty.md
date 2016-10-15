---
layout: post
title: "SpringMVC使用maven jetty插件运行"
categories: spring maven-jetty-plugin
excerpt: 
tags: spring springmvc maven-jetty-plugin
---

* content
{:toc}

Spring框架整合第二弹；
SpringMVC单独使用maven-jetty-plugin运行服务




### 基本问题

- 如何搭建一个可用的本地测试server？

- 怎么使用SpringMVC开发一个API？ 

### 事前准备

- maven webapp项目创建

- 完成后的文件布局

![文件布局](http://ww3.sinaimg.cn/large/8d6a2535gw1f8qh78xqt5j20930abdh2.jpg)

### pom.xml中的配置

- 添加property节点，统一管理spring那么多包的版本

```
<properties>
    <spring.version>4.0.2.RELEASE</spring.version>
</properties>
```

- 添加Spring相关依赖

```
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-core</artifactId>
    <version>${spring.version}</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-web</artifactId>
    <version>${spring.version}</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>${spring.version}</version>
</dependency>
```

- 添加maven-jetty-plugin插件

```
<plugins>
    <plugin>
        <groupId>org.eclipse.jetty</groupId>
        <artifactId>jetty-maven-plugin</artifactId>
        <version>9.2.13.v20150730</version>
    </plugin>
</plugins>
```

### 配置web.xml文件

- 这个文件是webapp的配置文件

```
<!DOCTYPE web-app PUBLIC
        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
        "http://java.sun.com/dtd/web-app_2_3.dtd" >
<web-app>
    <display-name>Archetype Created Web Application</display-name>
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>/WEB-INF/mvc-dispatcher-servlet.xml</param-value>
    </context-param>
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>
    <servlet>
        <servlet-name>mvc-dispatcher</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>mvc-dispatcher</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
</web-app>
``` 

### 配置mvc-dispatcher-servlet.xml文件

- springmvc的配置文件

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd">
    <context:component-scan base-package="com.zzj.controller"/>
    <mvc:annotation-driven/>
</beans>
```

### 新建Controller

- 需要用注解来驱动

```
package com.zzj.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by zhangzj on 2016/10/13.
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity getUser(){
        return new ResponseEntity("user body", HttpStatus.OK);
    }
}
```

### 运行服务

- 在项目目录下运行命令

```
mvn jetty:run
```

### 小结

- SpringMVC作用貌似是根据请求路径反应的这个一个东西，注解驱动很有趣

- maven-jetty-plugin内置的webserver，部署测试很方便

