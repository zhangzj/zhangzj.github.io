---
layout: post
title: "MyBatis的配置使用"
categories: mybatis
description: 不整合Spring的MyBatis使用
tags: mybatis Java MySQL ORM
---

* content
{:toc}

单独使用MyBatis访问DB，不配置Spring整合




### 基本问题

- 使用MyBatis需要哪些基本组件？构建什么，配置什么以及怎么配置？

### 事前准备

- MySQL数据库配置OK

- 数据库逆向生成ORM代码OK

### 准备数据

- 新建sql文件保存数据库的结构

```
-- ----------------------------
-- file: schema.sql
-- ----------------------------
DROP DATABASE IF EXISTS `zzj_users`;
CREATE DATABASE  IF NOT EXISTS `zzj_users` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zzj_users`;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名称',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```


### 生成DAO层 

- 参考配置生成器生成代码

- 确保配置plugin和dependency，反正后面也是要用的

```
<dependencies>
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis</artifactId>
        <version>3.4.0</version>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>5.1.38</version>
    </dependency>
</dependencies>
<build>
    <finalName>usermybatisdemo</finalName>
    <plugins>
        <plugin>
            <groupId>org.mybatis.generator</groupId>
            <artifactId>mybatis-generator-maven-plugin</artifactId>
            <version>1.3.5</version>
            <configuration>
                <verbose>true</verbose>
                <overwrite>true</overwrite>
            </configuration>
        </plugin>
    </plugins>
</build>
```

- 生成完毕的目录结构

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f8od6do2nyj208k0bkaaz.jpg)

### 配置mybatis-config.xml

- 使用MyBatis需要的配置文件: mybatis-config.xml

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <typeAliases>
        <package name="com.zzj.model"/>
    </typeAliases>
    <environments default="dev">
        <environment id="dev">
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://IP_Address/zzj_users"/>
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

### 使用MyBatis

- 使用主函数构建运行

```
package com.zzj.test;

import com.zzj.dao.UserMapper;
import com.zzj.model.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

/**
 * Created by zzj on 2016/10/11.
 */
public class Test {
    public static void main(String[] args) {
        // build SqlSessionFactory
        String resource = "mybatis-config.xml";
        Reader reader = null;
        try {
            reader = Resources.getResourceAsReader(resource);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

        // create user
        Integer userID = new Integer(1);
        String username = "zhang" + userID;
        // set User attributes
        User user = new User();
        user.setUserId(userID);
        user.setUserName(username);

        //add user to table
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            int result = userMapper.insert(user);
            System.out.println("result: " + result);
            sqlSession.commit();// 这里一定要提交，不然数据进不去数据库中
        } finally {
            sqlSession.close();
        }

        //get user from table by primary key
        sqlSession = sqlSessionFactory.openSession();
        try {
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            user = userMapper.selectByPrimaryKey(userID);
            System.out.println("name: " + user.getUserName() + "|ID: "
                    + user.getUserId());
        } finally {
            sqlSession.close();
        }

        //delete user from table by primary key
        sqlSession = sqlSessionFactory.openSession();
        try {
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            int result = userMapper.deleteByPrimaryKey(userID);
            System.out.println("result: " + result);
            sqlSession.commit();
        } finally {
            sqlSession.close();
        }
    }
}

```

### 小结

- MyBatis的使用数据库结构可以生成代码来使用，更方便，这是其一

- 生成器生成的代码有，model包中的模型，dao中的接口，还有mappers中的xml文件

- 运行MyBatis本身需要配置环境，可以使用XML配置，也可以Java配置

- 使用Mapper接口之后，基本的CRUD可以操作
