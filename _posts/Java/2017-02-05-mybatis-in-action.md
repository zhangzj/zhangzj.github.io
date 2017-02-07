---
layout: post
title: "MyBatis实战总结"
categories: Java
tags: MyBatis
---

* content
{:toc}


#### 什么是MyBatis？

MyBatis是支持普通SQL查询，存储过程和高级映射的优秀持久层框架。消除了几乎所有的JDBC代码和参数的手工设置以及结果集的检索。
使用简单的XML或注解用于配置和原始映射，将接口和Java的POJOs（Plan Old Java Objects，普通的Java对象）映射成数据库中的记录。

#### ORM工具及其思想

无论是用过的hibernate,mybatis,你都可以法相他们有一个共同点：

1. 从配置文件(通常是XML配置文件中)得到 sessionfactory.
2. 由 sessionfactory 产生 session
3. 在session 中完成对数据的增删改查和事务提交等.
4. 在用完之后关闭session 。
5. 在java 对象和 数据库之间有做mapping 的配置文件，也通常是xml 文件。

#### 开发环境的搭建

我们直接使用maven工具搭建web环境，添加mybatis依赖和mysql-connector依赖到项目

schema.sql
```

Create TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_address` varchar(200) DEFAULT NULL,
  `option_json` JSON DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


Insert INTO `user` VALUES ('1', 'summer', '100', 'shanghai,pudong');
```

mybatis-config.xml配置文件
```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">

<configuration>
    <typeAliases>
        <typeAlias alias="User" type="com.zzj.model.User"/>
    </typeAliases>

    <environments default="development">
        <environment id="development">
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://127.0.0.1:3306/test" />
                <property name="username" value="root"/>
                <property name="password" value=""/>
            </dataSource>
        </environment>
    </environments>

    <mappers>
        <mapper resource="mappers/UserMapper.xml"/>
    </mappers>
</configuration>
```

下面对这几个配置文件解释下：
1.mybatis-config.xml 是 mybatis 用来建立 sessionFactory 用的，里面主要包含了数据库连接相关东西，还有 java 类所对应的别名，比如 <typeAlias alias="User" type="com.zzj.model.User"/> 这个别名非常重要，你在 具体的类的映射中，比如UserMapper.xml 中 resultType 就是对应这里的。要保持一致，当然这里的 resultType 还有另外单独的定义方式，后面再说。
2.  Configuration.xml 里面 的<mapper resource="com/zzj/dao/UserMapper.xml"/>是包含要映射的类的xml配置文件。
3. 在UserMapper.xml 文件里面 主要是定义各种SQL 语句，以及这些语句的参数，以及要返回的类型等.
