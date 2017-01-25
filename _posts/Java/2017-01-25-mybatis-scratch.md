---
layout: post
title: "MyBatis的配置细节和理解使用"
categories: Java
tags: MyBatis
---

* content
{:toc}


#### mybatis代码使用

mybatis是用来访问数据库的框架，直接抽象jdbc的模板，方便使用类似sql进行数据库操作的目的，从配置细节来看，可以很直观的看出和sql语句的相关性；

我们结合maven来使用惯用的代码布局，看看怎么手撸一个mybatis的使用环境，简单的创建table，然后select一下；

大部分工作和配置可以使用generator来替代；

#### 手动配置相关代码


##### 第一阶段-环境准备-依赖处理

一切的一切，还是要从数据库开始，首先我们需要一个schema和一张建好的table来举例子；

```
create schema if not exists test;
use test;
drop table if exists students;
create table students (
stud_id int(11) not null auto_increment,
name varchar(45) not null,
primary key (stud_id)
)ENgine=InnoDB DEFAUlt charset = utf8;
```

表创建OK之后，我们接下来需要一个maven项目来做代码依赖管理，在pom文件中添加mybatis的依赖包

```
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
```

之后需要运行单元测试的依赖，可以选择junit或者testng使用

```
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.12</version>
</dependency>
```

##### 第二阶段-对应表建模-对应mapper配置

文件的处理顺序，我们先从简单抽象一些的再到具体细致的文件，根据mybatis的要求和一般的名称习惯来写

首先是与table记录对应的model，Student类

```
package com.zzj.model;
// 模型类存放在model包中
/**
 * Created by zhangzhoujian on 1/25/17.
 */
public class Student {
    private Integer studId;
//字段的类型对应java中的额数据类型
    private String name;
//接下来是setter和getter
    public Integer getStudId() {
        return studId;}
    public void setStudId(Integer studId) {
        this.studId = studId;}
    public String getName() {
        return name;}
    public void setName(String name) {
        this.name = name;}
// toString不是必须的，就是打印结果的时候会明了一些
    @Override
    public String toString() {
        return "Student{" +
                "studId=" + studId +
                ", name='" + name + '\'' +
                '}';}}
```

接着是dao层的接口和配置文件，一个是StudentMapper接口，一个是同名的xml文件

```
package com.zzj.dao;
import com.zzj.model.Student;
import java.util.List;
/**
 * Created by zhangzhoujian on 1/25/17.
 */
public interface StudentMapper {
    List<Student> findAllStudents();
    Student findStudentById(Integer id);
    void insertStudent(Student student);
}
```

接口声明的方法分别要和xml中的id对应才能让mybatis找到

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.zzj.dao.StudentMapper">
<!-- 映射到对应的mapper接口 -->
    <resultMap id="StudentResult" type="Student">
        <id property="studId" column="stud_id"/>
        <result property="name" column="name"/>
    </resultMap>
    <select id="findAllStudents" resultMap="StudentResult">
        SELECT * FROM STUDENTS
    </select>
    <select id="findStudentById" parameterType="int" resultType="Student">
SELECT stud_id AS studid, NAME FROM students where stud_id=#{id}
    </select>
    <insert id="insertStudent" parameterType="Student">
        insert into students(name) VALUEs (#{name})
    </insert>
</mapper>
```

##### 第三阶段-运行相关文件

sql语句的查询还有建立session和close等操作需要做，这些封装成一个工厂来执行，从全局的配置文件mybatis-config.xml中读取相应的配置

```
package com.zzj.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by zhangzhoujian on 1/25/17.
 */
public class MyBatisSqlSessionFactory {
    private static SqlSessionFactory sqlSessionFactory;
    public static SqlSessionFactory getSqlSessionFactory() {
        if (sqlSessionFactory == null) {
            InputStream inputStream;
            try {
                inputStream = Resources.getResourceAsStream("mybatis-config.xml");
                sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            } catch (IOException e) {
                throw new RuntimeException(e.getCause());
            }
        }
        return sqlSessionFactory;
    }
    public static SqlSession openSession() {
        return getSqlSessionFactory().openSession();
    }
}
```

配置mybatis的运行文件

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <!--<typeAliases>-->
        <!--<package name="com.zzj.model"/>-->
    <!--</typeAliases>-->
<typeAliases>
<package name="com.zzj.model"/>
    <!--<typeAlias type="Student" alias="com.zzj.model.Student" />-->
</typeAliases>
    <environments default="dev">
        <environment id="dev">
            <transactionManager type="JDBC"></transactionManager>
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.jdbc.Driver" />
                <property name="url" value="jdbc:mysql://localhost:3306/test"/>
                <property name="username" value="root"/>
                <property name="password" value="12345678"/>
            </dataSource>
        </environment>
    </environments>
    <mappers>
        <mapper resource="mappers/UserMapper.xml"/>
        <mapper resource="mappers/StudentMapper.xml"/>
    </mappers>
</configuration>
```

再具体的使用需要service层的抽象和测试代码调用运行

```
package com.zzj.service;


import com.zzj.dao.StudentMapper;
import com.zzj.model.Student;
import com.zzj.util.MyBatisSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * Created by zhangzhoujian on 1/25/17.
 */
public class StudentService {
    private Logger logger = LoggerFactory.getLogger(getClass());

    public List<Student> findAllStudents() {
        SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();
        try {
            StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
            return studentMapper.findAllStudents();
        } finally {
            sqlSession.close();
        }
    }

    public Student findStudentById(Integer studId) {
        logger.info("Select by student id : " + studId);

        SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();
        try {
            StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
            return studentMapper.findStudentById(studId);
        } finally {
            sqlSession.close();
        }
    }

    public void createStudent(Student student) {
        SqlSession sqlSession = MyBatisSqlSessionFactory.openSession();
        try {
            StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
            studentMapper.insertStudent(student);
            sqlSession.commit();

        }finally {
            sqlSession.close();
        }
    }
}
```

测试代码构建

```
package com.zzj.test;

import com.zzj.model.Student;
import com.zzj.service.StudentService;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.List;

/**
 * Created by zhangzhoujian on 1/25/17.
 */
public class StudentServiceTest {
    private static StudentService studentService;

    @BeforeClass
    public static void setUp() {
        studentService = new StudentService();
    }

    @AfterClass
    public static void tearDown() {
        studentService = null;
    }

    @Test
    public void testFindAllStudents() {
        List<Student> students = studentService.findAllStudents();
        Assert.assertNotNull(students);
        for (Student student: students) {
            System.out.println(student);
        }
    }

    @Test
    public void testFindStudentById() {
        Student student = studentService.findStudentById(1);
        Assert.assertNotNull(student);
        System.out.println(student);
    }

    @Test
    public void testCreateStudent() {
        Student student = new Student();
        student.setName("1234");
        studentService.createStudent(student);
        testFindAllStudents();
    }
}
```

##### 最终阶段-分析

一切的问题都在于变化，mybatis的作用就是简化sql的调用，访问数据库更加的方便，增删改查都可以使用构造的sql直接搞定

当字段发生变化的时候，需要改动的地方要相应改动，比如加一个字段column，就需要更改模型，mapperxml文件来适应
