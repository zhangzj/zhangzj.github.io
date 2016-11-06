---
layout: post
title: "Java语言整理总集篇"
category: Java
tags: [Java]
---
{% include JB/setup %}


* content
{:toc}




## 问题

- Java语言有哪些必须掌握的知识点？实际编程中着重需要哪些语言语言特性的支持？

- Java编程基础的知识树是什么样子？该由浅入深的掌握？

## 推论

收集大部分受好评的Java书籍中的信息，加上Java的官方文档整理出Java语言的大概布局，理清楚脉络

### 参考信息

- Agile Java Crafting Code with Test-Driven Development
- Java核心技术卷一、卷二
- Data Structures and Algorithm in Java-Robert Lafore
- Head First Design Patterns
- Head First Java
- Java Generics and Collections
- Java Puzzlers Traps Pitfalls
- Java The Complete Reference
- Java Concurrency in Practice
- Thinking in Java
- The Java Language Specification
- Effective Java
- [Java官方文档Tutorial](https://docs.oracle.com/javase/tutorial/)
- [The Java Language Specification](http://docs.oracle.com/javase/specs/)

- [The Java Virtual Machine Specification](http://docs.oracle.com/javase/specs/jvms/se7/html/)

### 语言布局

## 知识树

关于classpath的基本理解

classpath是路径列表，在windows中使用分号来分割列表中不同的路径名字，在Unix中使用冒号来分割，编译器和Java虚拟机都需要你提供classpath，路径名字可以使JAR文件，包含了class文件，或者是包含了class文件的目录

通过classpath，需要加载某一个类的时候，Java就会搜索这些列表，从而可以在编译和执行的时候，实现类的动态加载

从命令行，可以在编译源文件的同事指定classpath

```
javac -classpath c:\junit3.8.1\junit.jar StudentTest.java
```

### 基本程序结构

#### 注释

#### 数据类型

#### 变量

#### 运算符

#### 字符串

#### 输入输出 IO

#### 控制流

#### 大数值

#### 数组

### 对象与类

### 继承

### 接口与内部类

### 异常

### 断言

### 注解

### 日志

### 泛型

### 集合

### 多线程

### 流和文件

### XML

### 网络

### 数据库编程

### 国际化与本地化

### JavaBean

### 安全

### 脚本、编译和注解处理

### 分布式对象

### 本地方法

### 反射

### 单元测试

### 构建工具

### TDD 测试驱动开发

TDD意味着不仅需要为每一段代码编写测试用例，而且意味着测试优先。测试用例用来定义代码需要做什么，在完成相应的代码之后，运行测试用例来保证代码确实符合测试用例的规定。

### 软件工程模型，方法论

敏捷，瀑布，极限编程，Scrum


### UML 统一建模语言
