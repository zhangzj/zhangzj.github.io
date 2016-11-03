A---
layout: post
title: "HTMLCSS视频教程笔记-A"
categories: HTML CSS
description: Start to learn HTML and CSS.
tags: HTML CSS
---

* content
{:toc}

章节1：div布局

章节2：盒模型




### 1 了解html

- 什么是html文档？

	文档的一种，html指的是超文本标记语言

- 每种文档都有自己的格式和规则

	文件名使用html后缀来结尾

### 2 开发环境准备

- 开发工具：文本工具都可以开发

- 浏览器；Chrome,Safari,IE,Firefox

- 文件下载： 
	
	字体安装，yahei consolas hybrid

	sublime text

	Firefox & firebug

- sublime 使用技巧，快捷键

### 3 认识html的组成结构

- html文档的三部分：doctype，html，head，body

- doctype：表示html的解析标准，一个是strict的dtd，严格的，一个是transitional，兼容的

- dcotype的dtd声明必须加上，避免浏览器兼容问题

- head中放解析信息

- body主要的给客户看的页面

### 4 网页布局之切切豆腐

- 做网页先从大处着眼来布局，从上往下，从左到右，从大到小

- 网页中的一小块怎么表示：使用div来布局

### 5 css控制div显示

- div和css的关系，div只是声明块，css来描述

- 开发网页大流程，div布局+css控制

### 6 浮动布局

- 两个div是并排显示

- 一个div无论多窄，都是自己独占一行

- css 属性float，浮动布局

### 7 清除浮动

- float的副作用的是下面的普通div被覆盖

- css clear属性，清除浮动的div

```
#left {}
#right {}
#comm {
	clear: left;
	clear: right;
	clear: both;
}
```

### 8 实战首页布局

- html代码编写流程，先写div的大概，区分好id和class之后，再写css

### 9 新手常犯的错误

- 不加doctype，导致低版本ie解析效果不一样

- id使用数字，使用有意义的字符串，id属性不能使用数字

- 编码不一致，要制定meta，编码格式要声明，文件编码和charset编码声明不一致

### 10 盒模型概念

- 盒子与盒子之间的距离叫做margin，外边距

- 盒子边框的厚度，border，边框

- 盒子内壁和具体内容的距离，padding，内边距

### 11 盒模型之margin讲解

- 设定margin

```
#cont {
	margin : 10px;
	margin-top: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
	margin-left: 10px;
	margin: 10px 20px 30px 40px;
}
```

### 12 margin首页实战

- class来表示一类css设定

### 13 盒模型之border讲解

- 设定border

```
div {
	width: 300px;
	height: 300px;
	border: 20px solid green;
	background: gray;
}
```

- border三要素：宽（border-width），形状（border-style），颜色（border-color）

### 14 css画出三角形

- 利用border属性，因为border之间的边界是斜线，div的宽高设置成0px就可以了

```
div {
	width: 0px;
	height: 0px;
	border-top: 150px solid transparent;
	border-right: 150px solid transparent;
	border-bottom: 150px solid blue;
	border-left: 150px solid transparent;
}
```

### 15 盒模型之padding讲解

- 内边距，border到内容的距离，padding

```
div {
	width: 300px;
	height: 200px;
	background: gray;
	padding: 10px;
}
```

- padding margin的优先使用问题

	布局相关，使用margin，盒子与盒子

	盒子与内容，使用padding

### 16 padding与背景

- 内容的大小是div的宽高，padding，border，margin都是叠加的距离

- padding的背景会铺到border的边缘，padding的颜色就是背景色

### 17 padding首页实战

- 暂时来看，padding的作用就是给内容留出内边距，改善观感

- 注意给文字加padding的时候，flost块的大小改变会导致布局出错

	减少总宽度适应padding的改变，更改上一级块的宽高

### 18 盒子模型总结

- div到底占据多大空间，设定的宽高怎么理解

- 实际的占地面积是div的宽高加上padding，border和margin的面积

### 19 利用margin实现元素居中

- 算算总宽度，加上margin，合适的数量就可以隐形实现居中，但是不是自适应的

- margin有一个属性auto，可以自动分配进行居中

```
div {
	width: 200px;
	height: 200px;
	background: gray;
	border: 10px solid blue;
	padding: 20px;
	margin: 0px auto;
	}
```

### 20 margin重叠现象研究

- 相邻的两个**普通元素**的上下边距不是两个margin直接相加，出现两个margin重叠的现象

- 两个margin像比较，最终的距离会使取比较大的margin最后

- **float的块**的距离是margin的和，而不是取比较大的那个

### 21 内联元素；行内元素

- div内的细节设定，引入内联元素

- 实现只在行内包裹元素的效果，span

- span只在行内发挥作用，设置宽高都没有效果的

- span和div的比较

	div独占一行，spa只在行内用来包裹内容，不涉及大小

	div可以设定宽高，span不可以设定宽高

	div可以有margin等属性，span只可以设定横向的margin等还有效果

- div是块状元素代表，span是内联元素代表

### 22 内联与块状的转化

- 内联转块状，宽高就开始起作用了

```
span {
	display: block;
}
```

- 块状转内联，转成行内

```
div {
	display: inline;
}
```

- display设置成null，元素消失














