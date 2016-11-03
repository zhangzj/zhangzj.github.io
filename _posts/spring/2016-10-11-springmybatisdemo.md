---
layout: post
title: "Spring框架整合MyBatisDemo"
categories: spring mybatis
excerpt: 
tags: spring mybatis Java
---

* content
{:toc}

Spring框架与MyBatis框架整合第一弹；
最小集设定demo，以能跑起来为准；
仅使用XML文件配置，不使用注解配置；
先不实现Service层，直接使用mapper；




### 基本问题

- 如何使用Spring整合MyBatis框架，之后如何使用？

### 事前准备

- MySQL测试环境整个搭建OK，数据准备OK

- MyBatis配置OK，包括生成代码，单独访问数据库等等

### 添加Spring依赖

- 添加property节点，统一管理spring那么多包的版本

```
<properties>
    <spring.version>4.0.2.RELEASE</spring.version>
</properties>
```

- 添加Spring相关包和spring-mybtais

```
<!-- mybatis/spring包 -->
<dependency>
  <groupId>org.mybatis</groupId>
  <artifactId>mybatis-spring</artifactId>
  <version>1.3.0</version>
</dependency>
<!-- spring核心包 -->
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
  <artifactId>spring-oxm</artifactId>
  <version>${spring.version}</version>
</dependency>
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-tx</artifactId>
  <version>${spring.version}</version>
</dependency>
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-jdbc</artifactId>
  <version>${spring.version}</version>
</dependency>
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-webmvc</artifactId>
  <version>${spring.version}</version>
</dependency>
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-aop</artifactId>
  <version>${spring.version}</version>
</dependency>
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-context-support</artifactId>
  <version>${spring.version}</version>
</dependency>
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-test</artifactId>
  <version>${spring.version}</version>
</dependency>
```

### 编辑Spring的配置文件

- 新建Spring配置文件springConfig.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
    <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
        <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://IP_Address/zzj_users"/>
        <property name="username" value="root"/>
        <property name="password" value=""/>
    </bean>
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="configLocation" value="classpath:mybatis-config.xml"/>
        <property name="dataSource" ref="dataSource"/>
    </bean>
    <!-- Mapper Bean -->
    <bean id="userMapper" class="org.mybatis.spring.mapper.MapperFactoryBean">
        <property name="mapperInterface" value="com.zzj.dao.UserMapper"/>
        <property name="sqlSessionFactory" ref="sqlSessionFactory"/>
    </bean>
</beans>
```

- 在spring中配置了数据源之后，mybatis配置文件的DB配置可以删除了要

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <typeAliases>
        <package name="com.zzj.model"/>
    </typeAliases>
    <mappers>
        <mapper resource="mappers/UserMapper.xml"/>
    </mappers>
</configuration>
```

### 构建测试

- 新建类TestSecond搭建测试，直接使用ApplicationContext来获取对象

```
package com.zzj.test;
import com.zzj.dao.UserMapper;
import com.zzj.model.User;
import com.zzj.model.UserExample;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.util.List;

/**
 * Created by zhangzj on 2016/10/12.
 */
public class TestSecond {
    public static void main(String[] args){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("springConfig.xml");

        UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");

        User user = userMapper.selectByPrimaryKey(new Integer(1));
        System.out.println(user.toString() + user.getUserName());


        List<User> userList = userMapper.selectByExample(new UserExample());
        System.out.println(userList.toString());
        for (User u : userList) {
            System.out.println(u.getUserName());
        }
    }
}
```

- 成功运行的输出

```
十月 12, 2016 11:13:14 上午 org.springframework.context.support.ClassPathXmlApplicationContext prepareRefresh
信息: Refreshing org.springframework.context.support.ClassPathXmlApplicationContext@26a1ab54: startup date [Wed Oct 12 11:13:14 CST 2016]; root of context hierarchy
十月 12, 2016 11:13:14 上午 org.springframework.beans.factory.xml.XmlBeanDefinitionReader loadBeanDefinitions
信息: Loading XML bean definitions from class path resource [springConfig.xml]
十月 12, 2016 11:13:15 上午 org.springframework.jdbc.datasource.DriverManagerDataSource setDriverClassName
信息: Loaded JDBC driver: com.mysql.jdbc.Driver
com.zzj.model.User@76908cc0zhang1
[com.zzj.model.User@2145b572, com.zzj.model.User@39529185]
zhang1
zhang2

Process finished with exit code 0

```



