---
layout: post
title: "JavaScript权威指南 读书笔记-K"
categories: javascript
description: JavaScript权威指南读书笔记
tags: javascript
---

* content
{:toc}

全书的第二编：客户端JavaScript

第17章：事件处理

第18章：脚本化HTTP




### 17 事件处理

客户端js是异步事件驱动编程模型，程序的驱动有时候是依赖某些事件的发生，比如文档加载完成，点击鼠标等。如果关注某种特定类型的时间，就可以注册事件发生要调用的函数，基本上所有的UI程序都是这个模型

事件类型，是一个说明发生了什么的字符串，比如mousemove，keydown，load，用这个字符串来标识所谈论的特定类型的事件

事件目标是发生的事件与之相关的对象，一个时间，肯定有相关的类型和目标，比如window上的load事件和button的click事件，在客户端js中window，document和element是最常见的事件目标

**事件处理程序**，event handler，或者说**事件监听程序**，event listener 是处理或相应事件的函数

事件发生时候，对象上注册的事件处理程序被调用的时候，会说浏览器触发或者派发了事件

**事件对象**，最为参数传递给事件处理函数，都会有包含type属性和target属性

**事件传播**，是浏览器决定那个对象触发其事件处理程序的过程，类似的概念是事件捕获

**事件类型**，各种各样的事件

#### 17.1 事件类型

web初期的事件已经有很好的支持了，新的事件api定义来源有3个，w3c的新标准草案，H5规范产生的新事件，移动端的发展带来的新事件

**事件分类**

1. 依赖于设备的输入事件，比如鼠标和键盘，mousedown，mousemove，mouseup，keydown，keypress，touchmove，gesturerechange

2. 独立于设备的输入事件，没有直接相关的输入设备，click事件，textinput

3. 用户界面事件，较高级的事件，通常出现在定义web应用UI的html表单元素上，文本输入获取键盘焦点的focus事件，用户改变表单元素显示的嫦娥事件，单机表单中提交按钮的submit事件

4. 状态变化事件，有些时间不是用户触发，而是网络或者浏览器触发，表示某种状态的变化，比如文档加载完成的load事件，还有I/O的异步通知

5. 特定API事件，拖放的事件dragstart，dragenter，dragover，drop，H5的video和audio元素有很多事件来控制音视频播放

6. 计时器和错误处理程序

##### 17.1.1 传统事件类型

很多老API都是常用并且广泛被支持的

- 表单相关事件，submit，reset，文本域change的事件等等

- window事件，浏览器窗口本身触发的事件，而不是文档元素触发的

- 鼠标事件，在文档上移动或者单击鼠标都会产生鼠标事件

- 键盘事件，按下或者释放键盘按键都会产生事件

##### 17.1.2 DOM事件

DOM Level 3 Events，W3C的规范

##### 17.1.3 HTML5事件

HTML5加入的新元素，audio和video元素，都有很长的事件列表

拖放API，历史管理机制，表单的重新定义，离线的web应用支持

##### 17.1.4 触摸屏和移动设备事件

一般来讲使用的是和传统事件的映射，比如点击，但是有些比较特殊，比如旋转设备，手势事件等，在iPad和iphone的safari上有所实现

#### 17.2 注册事件处理程序

注册事件处理有两个方式，第一种比较老，是在对象中的属性设定函数，第二种是将事件处理传递给对象或者元素的一个方法

##### 17.2.1 设置JavaScript对象属性为事件处理程序

注册事件处理程序最简单的方式就是设置事件目标的属性为所需事件处理程序函数，比如onclick，onchange，onload，onmouseover等

```
window.onload = function() {
  var elt = document.getElementById("shipping_address");
  elt.onsubmit = function() {return validate(this);}
}
```

##### 17.2.2 设置HTML标签属性为事件处理程序

程序代码直接写在html元素的属性里面

```
<button onclick="alert('Thank you');">click here</button>
```

H5定义了事件处理程序的完整列表

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f9bakqlnhlj20ga037q3b.jpg)

##### 17.2.3 addEventListener()

这个方法可以为事件目标注册一个事件处理程序，addEventListener()接受三个参数，第一个是要注册的事件类型，或者名字自妇产，不包含前缀on，第二个参数是当指定类型的时间繁盛时候应该调用的函数，最后一个参数是布尔值，通常是false，如果传递了true，那么函数将注册为捕获事件处理程序，在事件的不同的调度阶段使用

```
<button id = "mybutton"> click me</button>
<script>
var b = document.getElementById("mybutton");
b.onclick = function() {alert("Thanks for clicking me! ");};
b.addEventListener("click", function() { alert("Thanks again!");}, false);
</script>
```

addEventListener的好处是可以为一个对象注册多个事件处理程序函数，相对的还有removeEventistener方法来删除事件处理函数

##### 17.2.4 attachEvent

IE9 之前不支持addEventListener和removeEventistener

#### 17.3 事件处理程序的调用
一旦注册事件处理程序成功之后，浏览器就会在指定对象上发生事件的时候自动调用

##### 17.3.1 事件处理程序的参数

通常事件处理程序的调用会把事件对象作为他们的一个参数，事件对象的属性提供了事件有关的信息

##### 17.3.2 事件处理程序的运行环境

##### 17.3.3 事件处理程序的作用域

##### 17.3.4 事件处理程序的返回值

##### 17.3.5 调用顺序

文档语速或其他对象可以为指定注册事件类型注册多个事件处理程序，事件发生的时候，浏览器必须按照如下规则调用所有的事件处理程序

- 通过设置对象属性会HTML属性注册的处理程序一直优先调用
- 使用addEventListener函数注册的处理程序按照他们的注册顺序调用
- 使用attachEvent注册的处理程序可能按照任何顺序调用，所以代码不应该以来于调用顺序

##### 17.3.6 事件传播

##### 17.3.7 事件取消

#### 17.4 文档加载事件 onload

#### 17.5 鼠标事件

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f9bjrs02ukj20lv0fwq66.jpg)

#### 17.6 鼠标滚轮事件

#### 17.7 拖放事件

#### 17.8 文本事件

#### 17.9 键盘事件

### 18 脚本化HTTP

脚本如何实现Web浏览器与服务器之间的通信

Ajax，描述的是主要使用脚本操纵HTTP的Web应用架构，Asynchronous Javascript and XML
异步的js脚本

#### 18.1 使用XMLHttpRequest
XMLHttpRequest的每一个实例都表示一个独立的请求/响应，并且这个对象的属性和方法允许指定请求细节和提取响应数据

使用这个HTTP API的第一件事就是实例化XMLHttpRequest对象

```
var request = new XMLHttpRequest();
```

一个http请求由4部分组成

- htto请求方法或者动作，method
- 正在请求的url
- 一个可选的请求头集合，其中可能包括身份验证信息
- 一个可选的请求主体

服务器返回的HTTP响应包含3部分

- 一个数字和文字组成的状态吗，用来显示请求的成功和失败
- 一个响应头集合
- 响应主体

##### 18.1.1 指定请求

创建XHR对象之后，发起HTTP请求的下一步是调用XHR的open方法去指定这个请求的两个必须的部分：方法和URL

```
request.open("GET", "data.csv");
```

##### 18.1.2 取得响应

##### 18.1.3 请求body的编码

表单编码是跟在url后面，以requestparam的形式，

还有json编码和xml编码

##### 18.1.4 HTTP进度事件

##### 18.1.5 终止请求和超时

##### 18.1.6 跨域HTTP请求

#### 18.2 借助script发送HTTP请求：JSONP

#### 18.3 基于服务器顿推送事件的Comet技术
