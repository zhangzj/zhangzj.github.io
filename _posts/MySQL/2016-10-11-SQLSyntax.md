---
layout: post
title: "SQL基本语法"
categories: MySQL SQL
description: SQL语言的基本语法
tags: MySQL SQL
---

* content
{:toc}


SQL的基本语法和操作示例





### 基本问题

- 如何操作数据库？

- 如何操作表本身？字段定义，表的属性等等？

- 如何操作表中的数据？增删改查操作等？

### 事前准备

- 事前环境准备MySQL安装OK

- 有连接好的GUI Client就更好了

### 操作数据库 

- 数据库的操作大概有，数据库的创建，删除，和显示现存的数据库

- 创建数据库

	```
	mysql> CREATE DATABASE databaseName;
	```
	
- 显示存在的数据库 

	```	
	mysql> SHOW DATABASES;
	```

- 删除数据库 

	```
	mysql> DROP DATABASE databaseName;
	```
	
### 操作表
	
- 表是数据库存储数据的基本单位，一个表包含若干字段定义。

- 对表的操作大概包括：创建表，查看表结构，修改表和删除表

#### 创建表

- 不带属性约束的创建表

```
mysql> CREATE TABLE example0( 
	id INT, 
	name VARCHAR(20)
);
```


#### 表中字段的属性约束

- 主键 PRIMARY KEY 是表的一个特殊字段，表中的每一条信息进行唯一标识
- 外键 FOREIGN KEY 表的一个特殊字段，是其他某一张表的主键
- 非空约束 NOT NULL 属性不能为空的约束
- UNIQUE 表示这个字段数据的唯一
- AUTO_INCREMENT 属性自动增加
- DEFAULT 设定属性的默认值

- 加上属性约束之后的创建表

```
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

#### 查看表结构

- 使用desccribe

	```
	mysql> DESCRIBE tableName;
	```

- 可以使用缩写 DESC

	```
	mysql> DESC tableName;
	```

- 查看表的详细结构的方法，MySQL会返回创建表的语句

	```
	mysql> SHOW CREATE TABLE tableName;
	```
	
```
CREATE TABLE `user` (
	`user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
	`user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名称',
	PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
```

#### 修改表

- 修改表名

	```
	mysql> ALTER TABLE oldTableName RENAME [TO] newTableName;
	```

- 修改表中字段的类型 

	```
	mysql> ALTER TABLE tableName MODIFY recordName newRecordType;
	```
	
- 同时修改字段名字和字段类型 

	```
	mysql> ALTER TABLE tableName CHANGE oldRecordName newRecordName newRecordType;
	```

- 增加字段

	```
	mysql> ALTER TABLE 表名字 ADD 属性名字 数据类型 [完整性约束条件] [FIRST| AFTER 属性名字];
	```
	其中前面的属性名字是新增加的字段，后面的属性名字表示要插入的位置，FIRST表示增加到最前面，AFTER表示增加到那个属性的后面，默认是会追加到所有字段的最后。

- 删除字段 

```
mysql> ALTER TABLE 表名字 DROP 属性名字;
```

- 修改字段的排列

```
mysql> ALTER TABLE 表名字 MODIFY 属性名字1 数据类型 FIRST|AFTER 属性名字2;
```

#### 删除表

- 删除没有被关联的普通表 

```
mysql> DROP TABLE 表名字;
```

- 被其他表所关联的父表没有那么好删除，需要在其他表中删除外键才能顺利删除。



> temp TODO 有关索引，触发器，视图等概念，之后再来补足












### 操作数据

- 以数据记录为对象的增删改查操作CRUD

#### 数据查询

- 查询语句的基本语法

	使用SELECT进行基本查询

```
SELECT 属性列表 FROM 表名字和视图列表
  [WHERE 条件表达式1]
  [GROUP BY 属性名1 [HAVING 条件表达式2]]
  [ORDER BY 属性名2 [ASC|DESC]]
```

	属性列表表示需要查询的字段名字，表和视图是指定查询的地方，可以有多个。条件表达式1表示查询的条件；

	属性名1表示按照这个字段进行分组；条件表达式2表示满足条件的数据才能输出；

	属性名2表示根据这个字段进行查询；后面的是排序方式，升序降序；

- 省略后面的条件之类的就会默认输出全部数据

```
SELECT num,name,age,sex,homeaddr FROM employee;
```

- 包含条件和排序的查询

```
SELECT num,d_id,name,age,sex,homeaddr
  FROM employee
  WHERE age<26
  ORDER BY d_id DESC;
```

##### 单表查询

- 查询所有字段

	使用 \* 查询所有字段

```
SELECT * FROM employee;
```


- 查询指定字段

```
SELECT num,name,sex,homeaddr FROM employee;
```

	将会显示的就是指定字段的数据，并且按照字段顺序出现，只要改变字段顺序就可以改变显示顺序。

- 查询指定的行

	指定查询的筛选条件WHERE

```
SELECT * FROM employee WHERE d_id=1001;
```


##### 查询条件

- 查询指定取值范围

```
SELECT * FROM employee WHERE age BETWEEN 15 AND 25;
SELECT * FROM employee WHERE age NOT BETWEEN 15 AND 25;
```

- 指定集合， IN, NOT IN

```
SELECT * FROM employee WHERE d_id IN( 1001, 1004 );
SELECT * FROM employee WHERE name NOT IN( '张三', '李四' );
```

- 匹配字符， LIKE, NOT LIKE

	匹配字符串的语法规则： [NOT] LIKE '字符串'

	字符串可以使用单引号包含或者双引号包含，可以使完整的字符串也可以包含百分号或者下划线作为通配符

	百分号 % 可以匹配任意长度的字符串
	
	下划线 _ 表示单个字符

```
SELECT * FROM employee WHERE name LIKE 'Aric';
SELECT * FROM employee WHERE hoemaddr LIKE '北京%';
SELECT * FROM employee WHERE name LIKE 'Ar_c';
SELECT * FROM employee WHERE name NOT LIKE 'Aric';
```

- 是否为空值， IS NULL, IS NOT NULL

```
SELECT * FROM work WHERE info IS NULL;
SELECT * FROM work WHERE info IS NOT NULL;
```

- 多条件查询 AND, OR

	AND连接多个需要同时满足的条件

```
SELECT * FROM employee WHERE
  d_id=1001 AND sex LIKE '男';
SELECT * FROM employee WHERE
  d_id=1001 AND age<26 AND sex LIKE '男';
```

	OR连接只需要满足其中一个条件的状况

```
SELECT * FROM employee WHERE
  d_id=1001 OR sex LIKE '男';

SELECT * FROM employee WHERE
  num IN (1,2,3) OR age BETWEEN 24 AND 25
  OR homeaddr LIKE '北京％';
```

- 查询结果不重复

	没有设定UNIQUE约束的字段，有可能会出现重复的情况，在语句中可以使用DISTINCT来消除重复的状况

```
SELECT DISTINCT 属性名字 FROM 表名字;
SELECT DISTINCT d_id FROM employee;
```

- 给查询结果排序

	升序的结果排序和降序结果排序

```
SELECT * FROM employee ORDER BY age ASC;
SELECT * FROM employee ORDER BY age DESC;
```

- 分组查询

	分组查询的语法

```
GROUP BY 属性名字 [HAVING 条件表达式][WITH ROLLUP]
```

#### 数据添加

#### 数据更新

#### 数据删除

