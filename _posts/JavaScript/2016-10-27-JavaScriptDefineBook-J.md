---
layout: post
title: "JavaScript权威指南 读书笔记-J"
categories: javascript
description: JavaScript权威指南读书笔记
tags: javascript 
---

* content
{:toc}

全书的第二编：客户端JavaScript

第16章：脚本化CSS





### 16 脚本化CSS

- js控制css可以制作酷炫的动画效果

- css本身就是很复杂的，了解基础之后进入js控制

- 主要内容有，css的基础，关键样式，怎么实现css脚本化，最常用和最重要的技术，利用sty属性，更改在webapp中的样式应用，查询元素的计算样式，开启关闭样式表，修改已经存在的样式表，添加新的样式表

#### 16.1 CSS概览

- 样式属性，指定字体，颜色，外边距，边框，北京图片，对其方式，元素尺寸和位置，定义HTML元素的视觉表现

##### 16.1.1 层叠

- css中的c表示的是cascading，层叠，意思就是来源于各处的样式，最终效果是层叠的，这些来源可能有，浏览器的默认样式表，文档本身的样式表和元素的内敛样式

##### 16.1.2 CSS历史

- css 有css1标准1996年，css2标准1998年，css2.1，css3正在工作中

##### 16.1.3 复合属性

- css 声明属性的值，可以使用词列表的方式，但是貌似要注意顺序

```
font: bold italic 24pt helvetica;
```

- 最明显的就是盒模型的几个属性

##### 16.1.4 非标准属性

- 非标准的属性，厂商一般会在前面加一个厂商前缀，FF使用-moz-，chrome使用-webkit-，IE使用-ms-

##### 16.1.5 CSS举例

- 一个小例子，说明怎么使用css，包括样式的引用方式，选择器的使用等等

![](http://ww3.sinaimg.cn/large/8d6a2535gw1f95hg37qxnj20jp0d7n0z.jpg)

```
<head>
<style type="text/css">
h1,h2 { 
	color: blue;
	font-style: italic;
}

.warning {
	font-weight: bold;
	font-size: 150%;
	margin: 0 1in 0 1in;
	background-color: yellow;
	border: solid red 8px;
	padding: 10px;
} 

.warning h1, .warning h2 {text-align: center;}

#special {
	text-align: center;
	text-transform: uppercase;
}
</style>
</head>
<body>
<h1>Cascading Style Sheets Demo</h1>

<div class="warning">

<h2>Warning</h2>
</div>

<p id="special">
<span style="text-transform: none;"></span>
</p>
</body>
```

##### 前沿的CSS

- 正在添加一些功能演示属性，border-radius，text-shadow， box-shadow，column-count

- web字体，利用css的@font-face规则可以下载使用自定义字体

- css过度，自动将css演示转换成平滑的动画过度，现在是css草案

- css变换，对于任何元素应用任意的2d仿射变换

#### 16.2 重要的css属性

- 可以控制每个元素外观，位置，尺寸的属性，肯定是首当其冲的属性，还有其他的css属性指定，堆叠次序，透明度，裁剪区域，外边距，内边距，边框和颜色。理解这些样式属性的工作原理

![](http://ww3.sinaimg.cn/large/8d6a2535gw1f95hy97tqwj20lp0fltbb.jpg)

##### 16.2.1 用CSS定位元素

- position属性指定应用到元素上的定位类型，有4个可能值

	- static 默认，按照常规的内容流向，从上到下，从左到右进行定位，静态的定位不能使用top，left和类似属性

	- absolute，相对于他包含的元素进行定位，绝对定位的元素是独立定位的，不是静态定位的元素中文档流的一部分，要么是相对于最近的定位祖先元素，要么是相对于文档本身

	- fixed，相对于浏览器窗口进行定位，不会随着其他元素滚动

	- relative，按照常规的文档流布局，相对于文档流中的位置进行调整

- 4种定位方式可以在文档中指定元素的定位位置，和与其他元素，浏览器的的定位方式

- 定位的标准单位，一般是使用像素px，也有其他的

	- 英寸单位， in
	- 厘米，cm
	- 点， pt
	- 字体行高， em

- 也可以使用百分比指定容器元素的百分比

```
<div style="position: absolute; left: 25%; top: 25%; width: 50%; height: 50%; border: 2px solid black;">
</div>
```

- 第三个维度：z-index，可以指定元素的堆叠次序，z-index默认是0，可以是正负整数

	- 兄弟元素之间才有重叠的概念，如果不是两兄弟元素之间的重叠z-index也没啥用

- CSS定位示例：文本阴影，css3有一个属性在文本下产生阴影效果text-shadow

##### 16.2.2 边框，外边距和内边距

- 边框和边距，border，margin，padding的设置

##### 16.2.3 CSS盒模型和定位细节

- 绝对定位的话，外边距没有任何意义

![](http://ww4.sinaimg.cn/large/8d6a2535gw1f95mb19441j20ls0dfabs.jpg)

##### 16.2.4 元素显示和可见性

- 两个属性，visibility和display

##### 16.2.5 颜色，透明度和半透明度

- 属性color指定文档元素包含的文本的颜色，background-color指定任何元素的背景颜色

- 颜色表示，可以使用英文表示，也可以使用RGB色号

- 透明度，opacity，或者color是transparent

##### 16.2.6 部分可见：overflow和clip

- overflow指定内容超出元素指定大小的时候怎么办

	- visible，溢出部分正常显示
	- hidden，裁剪隐藏掉超出的内容
	- scroll，显示水平和垂直的滚动条
	- auto，只有在溢出的时候才显示滚动条

- clip指定的是元素的裁剪区域

##### 16.2.7 示例：重叠半透明窗口

- 在网页里面做出像操作系统窗口重叠的样子，体现css的强大

#### 16.3 脚本化内联样式

- 内联样式的元素的style属性，所以也是可以js脚本化的，但是style的值不是字符串，而是一个CSSStyleDeclaration对象

- 可以使用js访问元素的style对象
、
- **CSS动画**

- 使用js的函数来实现抖动或者淡出的效果，视觉上实现动画

#### 16.4 查询计算出的样式

最后计算出的样式是一个CSSStyleDecalration对象，最后的渲染效果就是这个对象来确定

可以使用window对象的getComputedStyle方法来使获得一个元素的计算样式，第一个参数是元素，第二个可以是伪对象，也可以是null

```
var title = document.getElementById("sectiontitle");
var titlestyles = window.getComputedStyle(title, null);
```

计算样式对象和内联样式对象的区别

	- 计算样式的属性是制度的
	- 计算样式的单位没有相对值，只有绝对的单位尺寸

暂时这个计算样式到底怎么用，有什么用意义不明

#### 16.5 脚本化CSS类

改变样式的一个实现就是改变元素的class属性，这样子就会改变一系列的样式应用

定义一个class选择的样式，突出效果，这样可以吸引用户的注意

```
.attention {
	background-color: yellow;
	font-weight: bold;
	border: solid black 2px;
}
```

因为class是js的保留字，所以对象里面使用className来表示class属性

```
function grabAttention(e) {e.className = "attention";}
function releaseAttention(e) {e.className = "";} 
```

#### 16.6 脚本化样式表

关系到两类需要使用的对象，第一类是元素对象，style元素和link元素，都会包含或者引用样式表；第二类的是CSSStyleSheet对象，表示作为css文档关联的样式表

##### 16.6.1 开启和关闭样式表

最简单的脚本化技术也就是最便捷和最健壮的，上面的几个对象都有一个disable的属性，可以关闭忽略样式

##### 16.6.2 查询，插入与删除样式表规则

CSSStyleSheet对象也定义了API来查询，插入和删除样式

一般更好地做法是让样式保持静态，然后对className进行更改

##### 16.6.3 创建新样式表

动态创建整个样式表并添加到文档中，是可以做到的