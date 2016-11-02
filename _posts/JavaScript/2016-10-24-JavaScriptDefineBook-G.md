---
layout: post
title: "JavaScript权威指南 读书笔记-F"
categories: javascript
description: JavaScript权威指南读书笔记
tags: javascript 正则表达式
---

* content
{:toc}

全书的第一编：JavaScript语言核心

第10章：正则表达式和模式匹配

第11章：JavaScript的子集和扩展

第12章：服务器端JavaScript





### 10 正则表达式和模式匹配

- 正则表达式， re，是一个描述字符模式的对象。JS的RegExp类表示正则表达式

#### 10.1 正则表达式的定义

- 可以使用RegExp()构造函数创建，不过一般是使用特殊的直接量语法来创建，在一对斜杠之间的字符

```
// 对象创建
var pattern = new RegExp("s$");

// 直接量创建
var pattern = /s$/; 

// 用来匹配所有s结尾的字符串
```

##### 10.1.1 直接量字符

- 正则中所有的字母和数字都是按照字面意义进行匹配的，非数字字母使用转义字符表示

![](http://ww4.sinaimg.cn/large/8d6a2535gw1f938tol5xsj20kc0cgdhb.jpg)

- 正则中有特殊含义的字符

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f938um1s6aj20ay017glf.jpg)

##### 10.1.2 字符类

- 将直接量字符单独放进方括号内就组成了字符类，一个字符类可以匹配他所包含的任意字符

```
/[abc]/
```

- 可以通过次方符号来表示字符类的非运算结果

```
/[^abc]/ //匹配的是abc之外的所有字符
```

- 可以使用连字符表示范围

```
/[a-zA-Z0-9]/
```

- 某些字符类在郑泽中有特殊的转义字符表示

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f93acv2pjuj20fl0c0myw.jpg)

##### 10.1.3 重复

- 描述重复任意多位的数字，或者描述由三个字符和一个数字构成的字符串

- 在正则模式之后跟随使用指定字符串重复的标记，某些比较常用的情况有特殊字符表示

![](http://ww1.sinaimg.cn/large/8d6a2535gw1f93ashuuzej20ib080jsg.jpg)

- 一些现实例子

![](http://ww3.sinaimg.cn/large/8d6a2535gw1f93at7s206j20eg02mglz.jpg)

- 贪婪与非贪婪的重复，模式会产生同一段字符串出现多个匹配的情况，，aaaaaaab，多个a以b结束，如何匹配就看怎么设置

##### 10.1.4 选择，分组和引用

- 多个选择项，可以匹配多项中的一个

```
/ab|cd|ef/

// 可以匹配 ab，cd或者ef
```

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f93b15pjzfj20md07s76f.jpg)

![](http://ww4.sinaimg.cn/large/8d6a2535gw1f93b2vdfjxj20lz08ggnn.jpg)

##### 10.1.6 修饰符

- 这个是放在斜线之外的，高级匹配模式规则，出现在两条斜线之后

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f93bdgnfoej20m404t3zm.jpg)

#### 10.2 用于模式匹配的String方法

- String对象的一些执行正则，检索替换的方法，String支持4中使用正则的方法，

- search()，参数是一个正则，返回第一个预支匹配的子串的位置，如果没有就返回-1

```
"JavaScript".search(/script/i); => 4
```

- replace() 替换，参数是一个正则和一个字符串，找到之后进行替换

- match() 返回一个由匹配结果生成的数组

#### 10.3 RegExp对象

- 构造函数在代码动态创建正则的时候很有用

##### 10.3.1 RegExp的属性

- 每一个正则对象都有5个属性，source是只读字符串，表示正则的文本，global是一个只读的布尔，说明这个正则是否有g修饰符，ignoreCase也是制度布尔，表示是否有修饰符i，布尔mutiline，类似最后一个lastIndex是一个可读写的整数，如果带有g修饰符，存储的就是下一次开始检索的位置

##### 10.3.2 RegExp的方法

- exec test

### 11 JavaScript的子集和扩展

- 子集的定义大部分是安全考虑

- Firefox使用一个机遇明教SpiderMonkey的js引擎，Mozilla开发的另一个基于Java的js引擎Rhino也支持大部分扩展特性

#### 11.1 JS的子集

- 大多数语言都有自己的子集，更安全之星不可信任的第三方代码

##### 11.1.1 精华

- 很多语言都有精华和鸡肋，只用精华，不用糟粕，可以升华每一个程序员的心灵

- 不包含with，continue和eval哈数，提倡使用函数定义表达式，不是函数定义语句来定义函数

- 循环和分值都用花括号包裹，不省略

- 不推荐使用不严格等于，使用严格等于的比较

##### 11.1.2 子集的安全性

- 代码静态安全检查的沙箱，必须移除一些特性

- eval和function构造函数都禁止使用，因为可以执行任意代码

- 禁止使用this关键字，可以访问全局对象

- 禁止with语句，

- 禁止某些全局变量

- 禁止某些属性和方法，比如caller，callee

- 静态分析防止带有点运算符的属性存取方式去读写特殊属性

#### 11.2 常量和局部变量

- 下面是语言的扩展

- const关键字来定义常量

- 块级作用域的支持，关键字let，作用域只属于最近的代码块

#### 11.3 解构赋值

- 多个值同时复制给多个值

```
let [x,y] = [1,2];
[x,y] = [x+1, y+1];
[x,y] = [y,x];
console.log([x,y]);
```

#### 11.4 迭代

- foreach循环和python风格的迭代器和生成器

##### 11.4.1 foreach循环

- 不是遍历对象的属性，而是遍历属性的值

##### 11.4.2 迭代器

##### 11.4.3 生成器

##### 11.4.4 数组推导

##### 11.4.5 生成器表达式

#### 11.5 函数简写

- 表达式闭包，函数只计算的一个表达式并返回值的话没return和花括号都可以省略

```
let succ = function(x)x+1, yes=function()true, no = function() false;
```

#### 11.6 多catch从句

#### 11.7 E4X：ECMAScript for XML

- js的标准扩展，为处理XML文档定义了一系列强大特性

### 12 服务器端JS

- 除了浏览器端，js也是一个通用的编程语言

- Rhino是基于Java的js解析器，实现了通过js程序访问整个Java API

- Node是Google的V8 JS解析器的特别版本，底层绑定了POSIX API，包括文件，进程，流和套接字等等，侧重于异步I/O，网络和HTTP

- Web浏览器之外，js的用武之地，服务器端，Rhino程序可以使用Java的Swing框架搭建UI，Node上的js程序可以向shell一样操作文件

#### 12.1 用Rhino脚本化Java

- Rhino是Java编写的js解析器，目的是使用Java品台的API实现js编写程序。

#### 12.2 用Node实现异步I/O

- Node是基于C++的告诉JS解释器，绑定了Unix API