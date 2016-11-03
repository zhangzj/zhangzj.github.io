---
layout: post
title: "Mybatis-Generator生成ORM代码"
categories: mybatis
tags: mybatis Java maven MySQL
---

* content
{:toc}

自己手写DAO太真诚，使用生成器可以套路一下





### 事前准备

- MySQL数据库准备OK（IP地址，密码，ssh连接）

- maven构建环境和IDE准备（IntelliJ）

### 配置依赖插件

- pom.xml文件中的配置maven插件（其他的运行方式也是可以的）见文档：[mybatisgenerator运行方式](http://www.mybatis.org/generator/running/running.html)

```
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
```

- 新建生成所需的配置文件：文件名和路径是插件指定写死的

```
src\main\resources\generatorConfig.xml 
```

- generatorConfig.xml文件配置：[相关文档](http://www.mybatis.org/generator/configreference/xmlconfig.html)

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>

    <classPathEntry
            location="C:\Users\(绝对路径)\.m2\repository\mysql\mysql-connector-java\5.1.38\mysql-connector-java-5.1.38.jar"/>

    <context id="user" targetRuntime="MyBatis3">
        <plugin type="org.mybatis.generator.plugins.RowBoundsPlugin"/>

        <commentGenerator>
            <property name="suppressAllComments" value="true"/>
        </commentGenerator>
        <jdbcConnection driverClass="com.mysql.jdbc.Driver"
                        connectionURL="jdbc:mysql://(MySQL目标IP):3306/zzj_users"
                        userId="root" password="">
        </jdbcConnection>

        <javaTypeResolver>
            <property name="forceBigDecimals" value="false"/>
        </javaTypeResolver>

        <javaModelGenerator targetPackage="com.zzj.model" targetProject="src/main/java">
            <property name="enableSubPackages" value="false"/>
            <property name="trimStrings" value="true"/>
        </javaModelGenerator>
        
        <sqlMapGenerator targetPackage="mappers" targetProject="src/main/resources">
            <property name="enableSubPackages" value="false"/>
        </sqlMapGenerator>

        <javaClientGenerator type="XMLMAPPER" targetPackage="com.zzj.dao" targetProject="src/main/java">
            <property name="enableSubPackages" value="false"/>
        </javaClientGenerator>
        <table tableName="%"></table>
    </context>
</generatorConfiguration>
```

### 运行maven插件生成代码

- terminal运行maven命令

```
> mvn mybatis-generator:generate
```

### 小结

使用生成器自动生成DAO层的代码只是次要的，还是在使用MyBatis上。

代码生成需要的配置文件的具体细节还要查文档了解深入。

**使用生成器生成的mapperxml文件会追加而不是覆盖，一定删除之后再次生成**

 








