---
layout: post
title: "JavaScript权威指南 读书笔记-L"
categories: javascript
description: JavaScript权威指南读书笔记
tags: javascript
---

* content
{:toc}

全书的第二编：客户端JavaScript

第19章：jQuery类库

第20章：客户端存储

第21章：多媒体和图形编程

第22章：HTML5 API





### 19 jQuery类库

主要是由于浏览器之间严重的不兼容性，导致客户端的API复杂得很，js必须使用框架和类库，简化操作，隐藏差异，于是出现了jQuery

**jQuery能做什么**

在文档中轻松找到想要的元素并且操作，添加内容，编辑属性和css样式，定义事件处理程序，执行动画。

方法会尽可能返回对象本身，这样子链式调用就可以了

#### 19.1 jQuery基础

全局方法jquery()，这个方法使用太频繁，有个别名就是美元符号$，这是核心查询方法

```
var divs = $("div");
```

##### 19.1.1 jQuery()函数

##### 19.1.2 查询与查询结果

#### 19.2 jQuery的getter和setter

##### 19.2.1 获取和设置HTML属性

```
$("form").attr("action");
```

##### 19.2.2 获取和设置CSS属性

```
$("h1").css("font-weight");
```

##### 19.2.3 获取和设置CSS类

```
$("h1").addClass("h1lite");
```

##### 19.2.4 获取和设置HTML表单值

##### 19.2.5 设置和获取元素内容

##### 19.2.6 获取和设置元素的位置高宽

##### 19.2.7 获取和设置元素数据

#### 19.3 修改文档结构

html()和text()方法可以用来设置元素内容

##### 19.3.1 插入和替换元素

![](http://ww4.sinaimg.cn/large/8d6a2535gw1f9clitmg3aj20m8066gmt.jpg)

##### 19.3.2 复制元素

##### 19.3.3 包装元素

##### 19.3.4 删除元素

#### 19.4 使用jQuery处理事件

##### 19.4.1 事件处理程序的简单注册

简单的事件注册方法，可用于常用的每一一个浏览器事件，比如给单价注册一个事件处理程序

```
$("p").click(function() { $(this).css("background-color", "gray"); });
```

下面是jQuery定义的简单事件处理程序注册的方法

![](http://ww4.sinaimg.cn/large/8d6a2535gw1f9cln9u25pj20g503rgm6.jpg)

##### 19.4.2 jQuery事件处理程序

##### 19.4.3 jQuery事件对象

通过定义自己的Event对象来隐藏浏览器之间的实现差异

对象的属性和方法

![](http://ww4.sinaimg.cn/large/8d6a2535gw1f9clpe2yxlj20hj04hgm7.jpg)

![](http://ww1.sinaimg.cn/large/8d6a2535gw1f9clq020fkj20hg01kdft.jpg)

![](http://ww3.sinaimg.cn/large/8d6a2535gw1f9clqbbgccj20g501xmxe.jpg)

##### 19.4.4 事件处理程序的高级注册

使用bind方法来为命名的事件类型绑定处理程序

```
$('p').bind('click', f);
```


##### 19.4.5 注销事件处理程序

bind来绑定之后，可以使用unbind来解绑

##### 19.4.6 触发事件

##### 19.4.7 自定义事件

##### 19.4.8 实时事件

#### 19.5 动画效果

##### 19.5.1 简单动画

fadeIn，fadeOut，fadeTo

show，hide，toggle

slideDown，slideUp，slideToggle

##### 19.5.2 自定义动画

##### 19.5.3 动画的取消，延迟和队列

#### 19.6 jQuery中的Ajax

##### 19.6.1 load()方法
 load是jQuery中最简单的，传入一个url，异步加载url的内容，然后将内容插入元素中，替换原有内容

 ```
setInterval(function() { $('status').load("status_report.html"); }, 60000);
 ```

##### 19.6.2 Ajax工具函数

 - jQuery.getScript() 异步加载js文件，执行完成后调用
 - jQuery.getJson() 获取文本，然后特殊处理一下

##### 19.6.3 jQuery.ajax()函数

所有的ajax工具最后都会调用ajax函数，这是整个类库中最复杂的函数

```
jQuery.ajax({
  type: "GET",
  url: url,
  data: null,
  dataType: "script",
  success: callback
  });
```

##### 19.6.4 Ajax事件

#### 19.7 工具函数

jQuery.browser 提供浏览器相关的信息

jQuery.contains()

#### 19.8 jQuery选择器和选取方法

##### 19.8.1 jQuery选择器

##### 19.8.2 选取方法

#### 19.9 jQuery的插件扩展

#### 19.10 jQuery UI类库

### 20 客户端存储

存储形式：

- Web存储，H5的API
- cookie
- IE user data
- 离线Web应用
- Web数据库
- 文件西戎

#### 20.1 localStorage和sessionStorage

##### 20.1.1 存储有效期和作用域

##### 20.1.2 存储API

##### 20.1.3 存储事件

#### 20.2 cookie

##### 20.2.1 cookie属性：有效期和作用域

##### 20.2.2 保存cookie

##### 20.2.3 读取cookie

##### 20.2.4 cookie的局限性

##### 20.2.5 cookie相关的存储

#### 20.3 利用IE userData持久化数据

#### 20.4 应用程序存储和离线Web应用

##### 20.4.1 应用程序缓存清单

##### 20.4.2 缓存的更新

##### 20.4.3 离线Web应用

### 21 多媒体和图形编程

使用js来操作图片，控制音频和视频流以及画图

#### 21.1 脚本化图片

#### 21.2 脚本化音频和视频

##### 21.2.1 播放类型选择和加载

##### 21.2.2 控制媒体播放

##### 21.2.3 查询媒体状态

##### 21.2.4 媒体相关事件

#### 21.3 SVG：可伸缩的矢量图形

SVG是用于描述图形的XML语法，不同于光栅图像格式，GIF，JPEG，PNG等，用像素来庙会矩阵，一个svg表示的画该图形的时候必要路径的一种精准，分辨率无关的描述

#### 21.4 canvas中的图形

##### 21.4.1 绘制线段和填充多边形

##### 21.4.2 图形属性

##### 21.4.3 画布的尺寸和坐标

##### 21.4.4 坐标系变换

##### 21.4.5 绘制和填充曲线

##### 21.4.6 绘制矩形

##### 21.4.7 颜色，透明度，渐变以及图案

##### 21.4.8 线段绘制相关的属性

##### 21.4.9 画布上绘制文本

##### 21.4.10 裁剪

##### 21.4.11 阴影

##### 21.4.12 图片

##### 21.4.13 合成

##### 21.4.14 像素操作

##### 21.4.15 命中检测

##### 21.4.16 画布例子：迷你图

### 22 HTML5 API

H5不仅仅是最新的HTML标准，也是一整套目前的Web应用技术，

#### 22.1 地理位置

#### 22.2 历史记录管理

#### 22.3 跨域消息传递

#### 22.4 Web Worker

客户端js的一个基本特性就是单线程，浏览器无法同事运行两个事件处理程序，客户端程序员不需要关心并行编程

worker是执行代码的并行现成，有自己的上下文

##### 22.4.1 Worker对象

##### 22.4.2 Worker作用域

##### 22.4.3 Web Worker 的例子

#### 22.5 类型化数组和ArrayBuffer

#### 22.6 Blob

大数据块的不透明引用或者句柄，Binary Large Object

##### 22.6.1 文件座位Blob

##### 22.6.2 下载Blob

##### 22.6.3 构造Blob

##### 22.6.4 Blob URL

##### 22.6.5 读取Blob

#### 22.7 文件系统API

#### 22.8 客户端数据库

#### 22.9 Web 套接字，Socket

允许客户端脚本在客户端和支持WebSocket协议的服务器端创建双向的套接字类型的连接，而不是局限于HTTP这种相对比较特殊的网络协议
