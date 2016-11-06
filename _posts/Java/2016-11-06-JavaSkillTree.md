---
layout: post
title: "Java后端技能树"
categories: Java
tags: Java
---

* content
{:toc}




## 问题

一个合格的初级后端程序员需要掌握哪些技能，精通哪些知识，具备什么素质？

想要从基础开始成为一个Java方向的后端程序员的路线图是什么?

## 推论

### Java后端程序员的任职要求

```
Java工程师
1. 负责核心业务模块的架构设计，系统性能优化、接口设计等;
2. 负责技术相关分析，研究及制订相关的技术解决方案;
3. 负责服务器改造、技术优化、项目重构.
岗位要求：
1. 计算机相关专业本科以上学历，三年以上Java开发工作经验；
2. 熟悉Restful API和HTTP 协议等。
3. 精通Java，J2ee相关技术和体系架构；
4. 熟悉掌握Spring等主流Web框架的开发；
5. 熟悉MySQL数据库开发、配置、维护、性能优化；
6. 熟悉Redis缓存的开发;
7. 熟悉SOCKET编程，有高并发、大数据处理开发经验者优先;
8. 熟悉服务器管理，系统部署;
9. 具备敏捷开发的工作经验，具有较强的团队合作意识，具有较强的分析、设计能力和语言文字表达能力;
```

- 来自Quora-MAtt Pickering-[How-much-Java-do-you-need-to-know-to-get-a-job](https://www.quora.com/How-much-Java-do-you-need-to-know-to-get-a-job)

```
学校里面是不会教任何工作向Java的东西的，像Swing这种东西，基本上是没什么用，大部分Java的工作是面向Web或者JavaEE的

定位在入门级别的Java，概念上必须知道一些东西，并知道怎么描述和应用

Understanding of all basic Java control structures, able to declare methods and a working understanding of pass-by-value and pass-by-reference.
所有的Java控制结构，声明方法，了解传址和传值的区别
A understanding of classes vs. interfaces.
知道什么是接口什么是类
Understand the role of the public/private/protected modifiers.
理解修饰符，public private protected的角色
Understanding of Strings as immutable objects.  How to create mutable Strings via StringBuilder and other classes.
String是不可修改的，知道如何通过Stringbuilder来创建一个可变的String
Creation of a basic Java POJO/bean (data entity).
基本的POJO，数据实体的创建
Understand how statics work.
理解静态块的工作方式
Know how to declare constants.
如何声明常量
Understand basic class, variable and constant naming conventions.
理解基本的类，变量和常量的命名方式
Know how to organize code into packages.
怎么使用Package来组织代码
Understand the role and usage of JAR library files and how to reference them in your application.
理解jar库文件的角色和使用方式，知道怎么在代码中应用jar包
Have a working understanding of the core Java API and where to find stuff.  At a minimum, know the roles and uses of classes in java.lang, understand and able to use the Java Collections API correctly (i.e. declare variables of List type, not ArrayList) and know some of the utility classes in java.util, java.text and java.math.
了解JDK的基本API，几个重要的包中的类是做什么的，都有什么功能，Java的核心API
Knowledge and theory of some basic design patterns (Singleton, Factory, Facade, DAO, MVC).
基础的设计模式理论，单例模式，工厂模式，MVC等等
Know what the CLASSPATH is!
Know how the main() method works and how to pass arguments to basic programs.
main方法的工作方式，知道怎么给程序传参数
```

对于web开发或者EE的话，掌握以下方面是比较有帮助的

```
Familiarity with SQL databases and programming against them via JDBC.
熟悉SQL数据库，并且可以通过JDBC来编程
For web, understand how the HTTP protocol works and how basic web interaction takes place.
WEB向的开发，理解HTTP协议，和web交互的流程
A basic knowledge of HTML.  Specifically, basic page structure and how HTML forms work.  Difference between GET and POST.
对于前端的基本了解，页面结构和html form，GET和POST的区别
Any knowledge of the Servlet/JSP API, how web containers work and the Servlet lifecycle.
ServletAPI，web容器和servlet的生命周期
Any understanding of XML.  Web services and WSDL theory is a bonus.
XML，webservice和WSDL理论就更好了
Any understanding of TCP/IP networking (TCP vs UDP, role of IP, DNS, network addressing).
TCPIP网络
Use of any logging framework.
怎么使用log框架
Know what Apache Commons is!
apache common的使用
Any understanding or exposure to source code control systems and why they are important.
版本控制和开发流程
Any understanding of software project management and the software development lifecycle.
软件项目管理和软件发布流程生命周期的了解
```

### 拆解任职要求成技能树

### 网络协议
HTTP协议和Restful API

HTTP协议，HyperText Transfer Protocol，超文本传输协议，互联网上应用最广泛的应用层协议

REST，Representational State Transfer，一种万维网软件架构风格。
目前在三种主流的Web服务实现方案中，因为REST模式与复杂的SOAP和XML-RPC相比更加简洁，越来越多的web服务开始采用REST风格设计和实现。

### Java相关技术和J2EE体系架构

JavaEE是一套使用Java进行企业级Web应用开发的大家都会遵循的工业标准；

随着Java的发展，它不仅仅是一种标准平台，更多的是表达一种软件架构和设计思想

**组件**

```
Applet - Java Applet
EJB - 企业级JavaBean（Enterprise Java Beans）
JAAS - Java Authentication and Authorization Service
JACC - J2EE Authorization Contract for Containers
JAF - Java Beans Activation Framework
JAX-RPC - Java API for XML-Based Remote Procedure Calls
JAX-WS - Java API for XML Web Services
JAXM - Java API for XML Messaging
JAXP - Java XML解析API（Java API for XML Processing）
JAXR - Java API for XML Registries
JCA - J2EE连接器架构（J2EE Connector Architecture）
JDBC - Java数据库联接（Java Database Connectivity）
JMS - Java消息服务（Java Message Service）
JMX - Java Management
JNDI - Java名称与目录接口（Java Naming and Directory Interface）
JSF - Java Server Faces
JSP - Java服务器页面（Java Server Pages）
JSTL - Java服务器页面标准标签库（Java Server Pages Standard Tag Library）
JTA - Java事务API（Java Transaction API）
JavaMail
Servlet - Java Servlet API
StAX - Streaming APIs for XML Parsers
WS - Web Services
```

#### JavaEE的13种核心技术规范

部分内容转载自-[从懵逼到再入门——JavaEE完整体系架构](http://www.jianshu.com/p/83385852f711)

1. JDBC-一组用于之心SQL的Java API，统一访问数据库的途径，几乎所有的DB都会提供JDBC的服务或者驱动

![JDBC模型](http://ww1.sinaimg.cn/large/8d6a2535jw1f9iayndtfuj20ea0kfq4g.jpg)

2. JNDI（Java Naming and Directory Interfaces）Java 的命名和目录接口
JNDI是命名目录服务的抽象接口集合，为企业级应用提供了统一的标准化连接，使Java能够无缝地获取任何可目录化的企业信息。在JavaEE体系中，JNDI用来定位各种对象，包括EJB、数据库驱动、JDBC数据源及消息连接等。由于JNDI是独立于目录协议的，因此还可以用JNDI访问各种特定的目录服务，如LDAP（轻量目录访问协议）、NDS（服务器目录访问服务）。

![](http://ww2.sinaimg.cn/large/8d6a2535jw1f9ib1848s6j20yg0citaq.jpg)

3. EJB：感觉像是Spring的官方版本

![](http://ww1.sinaimg.cn/large/8d6a2535jw1f9ib3x31eaj20ui0lodil.jpg)

4. RMI：Remote Method Invoke 远程方法调用

  可以向调用本地对象一个调用另一个JVM中的对象上的方法，使用序列化方式在客户端和server端传送数据。

![](http://ww4.sinaimg.cn/large/8d6a2535jw1f9ib6bg2jgj20t00klacd.jpg)

5. Java IDL, Interface Description Language / CORBA, Common Object Broker Architecture

  IDL是描述软件组件接口的一种计算机语言，通过这种中立的方式来描述接口，使得在不同平台上运行的对象和用不同语言编写程序可以相互通信交流

6. JSP，Java Server Pages

  在HTML代码中夹带着Java代码，在接受到client的请求之后，server会处理这些jsp文件，处理文件中的Java代码，生成html文件返回

  jsp可以使用servlet提供的API，一般和javabean结合使用，从而将表现和业务逻辑分离

![](http://ww1.sinaimg.cn/large/8d6a2535jw1f9ibbjmaq7j20yg07wdgu.jpg)

7. Servlet：小型的Java程序，扩展了Web server 的功能，在被请求的时候就会开始执行

8. XML，Extensible Markup Language 可扩展的标记语言，平台独立的数据共享方式

9. JMS，Java Message Service，消息服务

  JMS的客户端之间可以通过JMS服务进行异步的消息传输；支持点对点的也支持发布订阅模型

![](http://ww4.sinaimg.cn/large/8d6a2535jw1f9iblnkfi2j20yg0co0u8.jpg)

10. JTA，Java Transaction API，Java事务API

![](http://ww3.sinaimg.cn/large/8d6a2535jw1f9ibnkanmzj20xl0i077h.jpg)

11. JTS，Java Transaction Service，Java事务服务

12. Java Mail，用于存取邮件服务器的API

13. JAF，JavaBean Activation Framework

#### JavaEE软件开发体系架构

**两层架构**：传统CS模型仅仅是简单基于两层架构，也就是客户端，前台和MIS后台，没有任何中间件，业务逻辑和表示层和数据层混杂在一起，这样子的设计都不利于开发部署扩展维护。

**三层架构**：自上而下，表示层，逻辑层，持久层；表示层由处理用户交互的客户端组件和容器组成；业务逻辑层是解决业务问题的；数据层就是一个或者多个数据库，可以包含数据库相关的存储过程；餐曾经爱狗的好处是在处理请求的时候不用进行复杂的数据库处理；搭建大型的分布式应用比较方便

![](http://ww2.sinaimg.cn/large/8d6a2535jw1f9iby5vp79j20yg0m3juq.jpg)

**MVC**：mvc模型将应用程序划分成Model，View，Controller三个部分；Servlet+JSP+JavaBen这种模式比较适合开发Web应用，servlet负责处理用户请求，JSP负责数据显示，JavaBean封装数据

![](http://ww4.sinaimg.cn/large/8d6a2535jw1f9icg866uzj20v50io40e.jpg)

**基于JavaEE架构模式下的MVC**：这个模式下，DAO层封装数据访问，业务逻辑层封装需求定义的功能

![](http://ww3.sinaimg.cn/large/8d6a2535jw1f9icj3xrr3j20yg118792.jpg)

### Web框架

Spring+SpringMVC+MyBatis

Web框架是开发者在使用某种语言编写Web应用服务端时关于架构的最佳实践。很多Web框架是从实际的Web项目抽取出来的，仅和Web的请求和响应处理有关，形成一个基础，在开发别的应用项目的时候则可以从这个剥离出来的基础做起，让开发者更关注更具体的业务问题，而不是Web的请求和响应的控制。

**异见**

> 所谓的框架，只是帮你完成一些基础，琐碎工作的工具，使你能够更好的关注自己的业务逻辑。不要本木倒置，为了框架而框架。对于一个新的项目，如果时间充足，你可以好好了解，仔细选型；如果时间不允许，果断选择自己最熟悉，最信得过的上...

从最精简的Eclipse和jetty开始研究，了解什么是servlet和filter

Servlet 是 J2EE 最重要的一部分，有了 Servlet 你就是 J2EE 了，J2EE 的其他方面的内容择需采用。而 Servlet 规范你需要掌握的就是 servlet 和 filter 这两项技术。绝大多数框架不是基于 servlet 就是基于 filter，如果它要在 Servlet 容器上运行，就永远也脱离不开这个模型。

总结的意见有几点：
- 熟知 Servlet 规范之前，请不要学习任何框架
- 使用最简单的工具，不要任何向导和可视化
- 熟知 HTTP 协议

等你真的掌握了 Servlet 规范再去看框架，便会觉得一些都小菜。总之一点：不要被框架牵着鼻子走，框架是你的工具，它应该听你的！

**框架小结**

基础的servlet学习和框架学习必须互相促进，双管齐下两手抓；完全拒绝框架，作为菜鸟没有办法马上做出东西，学习动力比较受挫；完全依赖框架，无法深入理解运行机制，出错不好调试，很难进一步发展，所以呀两手抓，框架用起来的同时兼顾基础。万丈高楼平地起，地基夯扎实了之后构件做的建筑也是可以接受的。

### 数据库开发
MySQL数据库的开发，配置，维护，性能优化

网易2008-[深入浅出MySQL数据库开发、优化与管理维护](https://book.douban.com/subject/3012338/)

### Redis

Redis是一个远程内存数据库，它不仅性能强劲，而且还具有复制特性以及为解决问题而生的独一无二的数据模型。对于关系数据库有很好的补充作用

### Socket编程

套接字编程，高并发，大数据处理

TCPIP协议通信，Socket通常也称作"套接字"，用于描述IP地址和端口，是一个通信链的句柄。网络上的两个程序通过一个双向的通讯连接实现数据的交换，这个双向链路的一端称为一个Socket，一个Socket由一个IP地址和一个端口号唯一确定。应用程序通常通过"套接字"向网络发出请求或者应答网络请求。 Socket是TCP/IP协议的一个十分流行的编程界面，但是，Socket所支持的协议种类也不光TCP/IP一种，因此两者之间是没有必然联系的。在Java环境下，Socket编程主要是指基于TCP/IP协议的网络编程。

### 服务器管理系统部署

### 团队
敏捷开发，分析设计和表达能力

### 其他
名校背书，相关工作经验3年

因为是所有技术的基础没有被提及的方面，默认需要精通的基础课程：设计模式；算法与数据结构；Java编程基础；

## Java后端工程师学习大纲

### 版本管理+项目管理

基本上是每一个程序员的必备基础，Git+Maven

资料链接-[微博新兵训练营-环境与工具](http://weibo.com/p/1001643874239169320051)

### Java编程

- 书籍

```
Java核心技术卷一
Java核心技术卷二
Java并发编程实战
Effective Java
写给大忙人看的Java SE 8
```

- 入门资料

  - Socket编程：[http://ifeve.com/java-socket/](http://ifeve.com/java-socket/)
  - NIO：[http://ifeve.com/java-nio-all/](http://ifeve.com/java-nio-all/)
  - 序列化：[http://ifeve.com/java-io-s-objectinputstream-objectoutputstream/](http://ifeve.com/java-io-s-objectinputstream-objectoutputstream/)
  - RPC框架：[http://dubbo.io](http://dubbo.io)
  - 并发编程：[http://ifeve.com/java-concurrency-constructs/](http://ifeve.com/java-concurrency-constructs/)

### 常用开发框架

- Sping：[跟开涛学Spring3](http://jinnianshilongnian.iteye.com/blog/1482071)
- Spring MVC：[跟凯涛学SpringMVC](http://www.cnblogs.com/kaitao/archive/2012/07/16/2593441.html)
- MyBatis：[MyBatis实战教程](http://www.yihaomen.com/article/java/302.htm) [MyBatis学习](http://limingnihao.iteye.com/blog/781671)

资料可以帮助快速入门这些开发用的软件框架，但是最终的底线还是在**官方文档**，更进一步说，这些框架的源码阅读学习也是要跟进才好，阅读源代码的步骤和方法

```
1) 先阅读架构文档
2) 根据架构，将源码文件以模块（或上下层级）分类
3) 从最独立（依赖性最小）的模块代码读起
4) 阅读该模块功能文档
5) 阅读该模块源代码
6) 一边阅读一边整理「调用关系表」
7) goto 3
```

### 性能优化与诊断-系统

- 书籍与学习内容

  《Linux服务器性能调整》
  - Linux概述
  - 性能分析工具
  - 系统调优
  - Linux服务器应用的性能特征
  - 调优案例分析

### 性能优化与诊断-JVM

- 书籍与学习内容

  - 《Java性能优化权威指南》
  - JVM概述
  - JVM性能监控
  - JVM性能剖析与工具
  - JVM参数与调优步骤
  - JVM调优案例分析
  - 《深入理解Java虚拟机》

### 消息中间件

JMS：Java消息服务指的是两个应用程序之间进行异步通信的API，它为标准消息协议和消息服务提供了一组通用接口，包括创建、发送、读取消息等，用于支持JAVA应用程序开发。

  - 大规模分布式消息中间件简介：http://blog.csdn.net/huyiyang2010/article/details/5969944
  - JMS Overview: http://docs.oracle.com/javaee/6/tutorial/doc/bncdr.html
  - Basic JMS API Concepts: http://docs.oracle.com/javaee/6/tutorial/doc/bncdx.html
  - The JMS API Programming Model: http://docs.oracle.com/javaee/6/tutorial/doc/bnceh.html
  - Creating Robust JMS Applications:http://docs.oracle.com/javaee/6/tutorial/doc/bncfu.html
  - Using the JMS API in Java EE Applications: http://docs.oracle.com/javaee/6/tutorial/doc/bncgl.html
  - Further Information about JMS: http://docs.oracle.com/javaee/6/tutorial/doc/bncgu.html

RabbitMQ：基于AMQP协议的实现，适用于需要事务管理，对消息丢失很敏感的场景

Kafka：基于日志的消息队列

### OAuth认证技术

OAuth是目前最为流行的第三方认证技术，基于自己账户系统的体系的认证给第三方应用，像微博，微信，qq，FB等等-[OAuth的机制与安利讲解和开发流程](http://blog.jobbole.com/49211/)

- 开源实现

  - Google oauth core：http://oauth.net/code/
  - Spring oauth: http://projects.spring.io/spring-security-oauth/

### Redis设计与实现


[《Redis设计与实现》](http://redisbook.com)
- 学习内容
  - 常用命令以及数据结构
  - 内部数据结构
  - 内存映射数据库结构
  - redis数据类型
  - 功能的实现
  - 内部运作机制

[Redis命令：](http://redisdoc.com)

## Java后端知识技能树-思维导图

![](http://ww2.sinaimg.cn/large/8d6a2535jw1f9hm5uk8d5j215y2s6ako.jpg)
