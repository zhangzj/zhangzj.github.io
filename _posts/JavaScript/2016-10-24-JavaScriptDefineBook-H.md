---
layout: post
title: "JavaScript权威指南 读书笔记-H"
categories: javascript
description: JavaScript权威指南读书笔记
tags: javascript 正则表达式
---

* content
{:toc}

全书的第二编：客户端JavaScript

第13章：web浏览器中的js





## 第二部分 客户端JavaScript

- 主要讲JS在Web浏览器中是如何实现的，

- 介绍大量的脚本宿主对象，可以表示浏览器窗口，DOM和内容等

- 涵盖重要的web应用所需的网络编程API，本地存储和检索数据，画图等

### 13 Web浏览器中的JavaScript

- 俗称客户端js，提供一个可以运行js的上下文

#### 13.1客户端js

- window对象所有特性和api的主要接入点，表示浏览器的一个窗口或者窗体，可以使用window来引用，window对象定义了一些属性，比如，只带Location的location属性，指定显示在窗口中的url，并允许脚本往窗口中载入新的url

- 浏览器中，window对象就是全局对象，位于作用域链的顶部，他的属性和方法实际上就是全局变量和全局函数

- document属性是Document对象，表示显示在窗口中的文档，可以用js操作文档中的元素

```
var timestamp = document.getElemntById("timestamp");
```

- 事件处理相关的属性，在脚本中保定毅格函数，函数会在时间发生的时候异步执行

```
<script type="text/javascript">
var timestamp = document.getElementById("timestamp");
timestamp.appendChild(document.createTextNode(new Date().toString()));
timestamp.onclick = function() {this.innerHTML = new Date().toString();};
</script>
```

- window对象的onload处理程序，事件处理程序中，嵌套函数在客户端js中使用普遍

##### 13.1.1 Web文档里的JavaScript

- js可以操作document对象和包含的element对象遍历和管理内容，可以操作css样式来更改显示，可以通过注册事件来定义行为。内容，呈现和行为的组合叫做动态html或者dhtml

- web文档中js的用处，ja的铮铮角色是增强用户的浏览体验，使得信息的获取和传递更加容易。创建动画和视觉效果；表格分组；隐藏内容，逐渐展示

##### 13.1.2 Web应用里的js

- 在web文档之上，web应用除了内容，呈现，操作api之外，还依赖web浏览器环境提供的更基础的服务

- 浏览器已经不仅仅是显示文档的角色了，绅士可以属是一个简易的操作系统，web应用就是用js访问高级服务的web页面

- 高级服务：XMLHttpRequest对象，用来发出请求，可以请求数据，不用重新载入页面，ajax技术

- html5的新特性，有数据存储和图像api，地理位置，历史管理和后台线程等等

- webapp的本质就是js程序

#### 13.2 在html中嵌入js

- 4种引入方式

1. 内敛，在标签script之间

2. 外部链接，放在script标签的src属性引用地址

3. 放在html事件处理程序中，由onclick这样的标签属性指定

4. 放在url中，使用特殊的javascript协议

- 后两种已经很少使用了，内联脚本也用得少，有个概念是让js代码和html进行分离，不要写在一起

##### 13.2.1 script元素

- 嵌入在htm文件中的，放在标签里面的脚本

##### 13.2.2 外部文件中的脚本

- src属性的用法

```
<script src="../../scripts/util.js"></script>
```

##### 13.2.3 脚本类型

- 除了js，还有vbscript，默认是js

##### 13.2.4 HTML中的事件处理顺序

- 先注册事件处理程序，为了之后的调用做准备

##### 13.2.5 URL中的JavaScript

- 之前说的协议限定javascript的方式来写入代码

```
<a href="javascript:new Date().toLocalTimeString();">Whta time is it?</a>
```

#### 13.3 JS程序的运行

- 所有的js程序共用一个window对象，也是一个全局的环境

- js程序执行的两个阶段，第一阶段，载入文档内容，执行script标签里的代码，文档载入完成后，第二阶段，异步执行事件驱动的代码，使用之前注册的函数

- 事件驱动阶段的第一个时间是load事件，表示文档完全载入，可以操作

##### 13.3.1 同步，异步和延迟的脚本

- 浏览器渲染页面的时候，先把script标签的代码执行ok，所以是同步和阻塞的，script标签可以有，defer和async属性，来改变脚本的执行方式，

```
<script defer src="deferred.js"></script>
<script async src="async.js"></script>
```

- defer和async表示，脚本不会对文档内容产生影响，可以在下载脚本的时候渲染和解析文档，defer使得脚本延迟执行，直到文档渲染完成；async会使得浏览器尽快执行脚本，而不用在下载脚本的时候阻塞文档解析

##### 13.3.2 事件驱动的JS

- 注册处理事件最简单的方法就是把函数赋值给目标对象的属性

```
window.onload = function() {...};
document.getElementById("button1".onclick = function() {...});
function handleResponse() {...}
request.onreadystatechange = handleResponse;
```

- 约定：事件处理程序都是on开头的，后面跟着事件的名字

- 当一个事件需要有多个监听注册的时候，可以添加一个监听器监听事件的发生

##### 13.3.3 客户端js线程模型

- js语言核心不包含线程机制，客户端js依然严格单线程工作，也就说，在脚本运行的时候，用户交互要停止

- H5有一个新的东西叫webworker，就是后台线程

##### 13.3.4 js时间线

1. 浏览器创建document对象，开始解析页面

2. 执行同步的脚本，下载脚本

3. 遇到async的脚本的话，下载脚本的同时解析文档

4. 文档解析完成，document.readyState变成interactive

5. 异步运行defer的脚本

6. 浏览器document对象的时间DOMContentLoaded触发，程序从执行同步脚本阶段，转换到异步事件驱动阶段

7. 文档解析完成，不过有些内容可能还在加载，如图片等，readyState变成complete，浏览器触发window对象的load事件

8. 调用异步事件，异步响应用户输入等

#### 13.4 兼容性和互用性

- 有无数的OS的浏览器的版本，环境差异还是很大，大家都喜欢的js程序还是蛮有挑战的

- 兼容性问题的分类，

1. 演化，web标准的变更，看浏览器厂商是不是对应

2. 未实现，不同的浏览器开发商对一个特性并没有统一的观点，有些没有大家都实现

3. bug，各个浏览器中的各种bug

##### 13.4.1 处理兼容性问题的类库

- 曲线救国的方式，别人实现的js类库来解决

- jQuery框架，重新定义客户端API并兼容所有的浏览器

##### 13.4.2 分级浏览器支持

- yahoo提出的测试技术，A级C级X级，表示不同的可用性

##### 13.4.3 功能测试

##### 13.4.4 怪异模式和标准模式

##### 13.4.5 浏览器测试

- 客户端js中检测浏览器类型和版本的方法是使用navigator对象，确定当前浏览器厂商和版本的代码叫做浏览器嗅探器或者客户端嗅探器

##### 13.4.6 Internet Explorer里的条件注释

- 跟C里面的条件编译很相似

#### 13.5 可访问性

- 残障人士的辅助技术

- 只用键盘，不用鼠标的解决方式

#### 13.6 安全性

- 很多api会被恶意利用

##### 13.6.1 j不能做什么

- 没有权限写入或者删除客户机上的任意文件或者列出任何目录，防止病毒

- 没有任何通用的网络能力

- 限制任意打开窗口，不能任意关闭其他窗口

##### 13.6.2 同源策略

##### 13.6.3 脚本化插件和ActiveX插件

##### 13.6.4 跨站脚本

- XSS，攻击者向目标站点注入HTML标签脚本

##### 13.6.5 拒绝服务攻击

#### 13.7 客户端框架

- 封装底层的代码，开放高级API的框架，比如jQuery

- 框架：Prototype，Dojo，YUI，Closure，GWT，

