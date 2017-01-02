---
layout: post
title: "HTMLCSS视频教程笔记-B"
categories: HTML CSS
description: Start to learn HTML and CSS.
tags: HTML CSS
---

* content
{:toc}

章节3：CSS

章节4：HTML语义标签




### 23 css控制段落

- p 标签，标识一段话

- 段落的css属性控制功能，段落修饰线等等

### 24 css控制文字大小字体及颜色

- 字体，微软雅黑等等，倾斜加粗等等

- 颜色控制

- 字体，字重

- 行高，行间距

- 主要还是查手册，看有什么css属性可以用

### 25 css字体设置技巧

- font-family

```
#test {
	font-family: '微软雅黑'
}
```

- 有衬线字体（宋体），无衬线字体（黑体），新闻标题使用无衬线，新闻正文使用新宋体或者宋体，术语有衬线字体

- 本地字体，客户机上不一定存在

- 字体链：不常见的放在前面，常见的放后面做备用

```
#test {
	font-family: '微软雅黑','黑体',sans-serif;
}
```

- 字体家族，一类字体，有衬线字体-serif，无衬线字体-sans-serif

### 26 css设置背景图片

- background-image，默认铺开的效果

- background-repeat，是否重复，不重复的话单张图片只显示一次

- background-attachment，fix，固定在某一位置，忽略滚动条

- 背景图和背景色都设置，优先显示图片

### 27 精确控制背景图片位置

- div本身也可以设置背景图片

- 默认背景图显示在左上角，使用position控制位置

```
background-position: right center;
```

- 像素精确控制背景显示

- 背景图在一张大图上，设定到一个小div的背景上，用来截取背景图的一部分

- 设定background-position： -xpx -ypx；根据左上角的原点系统来计算正负的像素值

- 多个小背景融合在一张大图上，使用位置和像素来配置背景图位置来抠出一张小背景图

### 28 css选择器

- 控制段落，文字，背景OK

- id选择器

- class选择器

- 标签选择器

- 标签选择中的子选择器，是有上下文条件的，只对指定标签内的标签起作用

- 派生选择器，使用元素间的上下级关系来声明css属性

```
div p {
	color: red;
}
```

### 29 css的优先级

- 多个选择器对同一个元素的属性设置冲突了怎么办

- 大规律，标签选择器范围大，优先级低，逻辑上范围越小越精细的选择，优先级越高

### 30 css的4种引入方式

- 直接写在style标签中

- css文件中，然后link到html文件中

```
<link rel="stylesheet" type="text/css" href=".css.css">
```

- 内联样式，在html标签内写css属性控制，style属性

- 使用@import导入

```
<style type="text/css">
	@import url(23-2.css);
</style>
```

- 在外部css文件中还可以import其他的css文件

### 31 css初始化

- 相同的元素，比如li，在不同的浏览器下，显示的效果有所不同

- 原因：各个浏览器对各元素的margin，border，font-size都略有不同

- 为防止有显示差异，使用css强制让所有的属性元素都一样，这样就全都效果一致，这个过程叫做css初始化

- 如何进行初始化，初始化脚本，yahoo提供

- 淘宝等大公司都有各自的css初始化代码

```
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td { margin:0; padding:0; }
body { background:#fff; color:#555; font-size:14px; font-family: Verdana, Arial, Helvetica, sans-serif; }
td,th,caption { font-size:14px; }
h1, h2, h3, h4, h5, h6 { font-weight:normal; font-size:100%; }
address, caption, cite, code, dfn, em, strong, th, var { font-style:normal; font-weight:normal;}
a { color:#555; text-decoration:none; }
a:hover { text-decoration:underline; }
img { border:none; }
ol,ul,li { list-style:none; }
input, textarea, select, button { font:14px Verdana,Helvetica,Arial,sans-serif; }
table { border-collapse:collapse; }
html {overflow-y: scroll;} 

.clearfix:after {content: "."; display: block; height:0; clear:both; visibility: hidden;}
.clearfix { *zoom:1; }
```

### 32 html学习思维导图

- 之前所学知识的总结

- html知识：html结构：doctype，head，body

- head部分，给浏览器看的信息

- div布局：布局原则，从上到下，大到小

- 盒子模型

- 浮动布局

- css控制显示效果

- css选择器，控制效果，背景，文字，段落

- css引入方式，页内style，行内style，文件导入

- css初始化的必要性

- html的标签：无语义标签：div，span，；有语义标签：h，p，img等

### 33 h标签与p标签

- 都属于有语义标签，h标签对应标题，p标签对应段落

- h1到h6，从大到小的标题，字越来越小，没有7号标题

- p表示段落，新闻网站中，h和p一般成对出现，新闻标题使用h表示，新闻的每一段使用p标签

### 34 img标签

- 图片标签，img，是自闭合标签，src代表图片地址，alt表示说明图片是什么，文字说明

```
<img src="图片的地址" alt="菊花图片" title="鼠标放上去就会显示这段文字" />
```

### 35 img到底是块状还是内联

- 内联元素不换行，块状独占一行

- 内联元素虽然不能设置宽高，但是img可以

- 浏览器无法猜测图片大小，智能依赖图片本身设定

- 图片是内联元素，但是是特殊的替换元素，以实际图片大小为准，可以设置宽高

- 替换元素，replacedelement

### 36 有序列表和无序列表

- 有顺序和没有顺序的列表

- css控制无序列表前符号的风格，list-style-type

- 有序列表ol的序号风格也可以使用list-style-type控制

- 自带的初始化css，去掉小黑点防止浏览器不兼容，使用背景图片来使用列表项中的符号风格

### 37 整齐的表格

- table，行标签，tr，列标签，td

- 单元格的样式，边框风格在table层面进行控制

- 合并单元格，跨行跨列的方向是向右向下的

### 38 超链接标签

- 网页互相之间的链接，即是超链接

- 链接使用a标签表示

- href表示链接的目的地

- 在新网页或者新窗口中打开链接，target属性，默认显示在自身网页中，_blank

- title属性，鼠标放上来显示的文字

### 39 锚点

- 表示网页中的某一个位置 #a

- 在页面特别大的情况下，链接过来的时候，正好处于锚点的位置

- 锚点，页面内的标记，a标签的第二个用法

```
<a name="p1"></a>
```

- 其他页面链接过来的时候，a标签的设置

```
<a href="XXX.html#p1"></a>
```

### 40 伪类

- css伪类，a标签的伪类

- 鼠标悬停，点击，离开的状态，四种状态，链接未点击，点击中，点击后，已访问状态

- css允许针对a标签的4种状态设置各自的css特性，这个特性叫做css伪类

```
<style type="text/css">
	a:link {
		color: gray;
	}

	a:visited {
		color: purple;
	}

	a:hover {
		color: orange;
	}

	a:active {
		color: black;
	}

	
</style>
```

- 页面是否已访问过的状态，将覆盖页面内所有已访问的a标签，点过了的链接，所有该链接的a标签状态都会被改变

- 注意点：active状态一般不必写；顺序注意，lvha；link状态可以简写，省略；

### 41 字符实体

- html标签的左右两端都是尖括号包裹的，内容中有标记符号怎么办

- 有些字符在html开发中，不适合直接显示，比如大于号，小于号，可能引起标签冲突和混乱

- 一般格式： and符号，加上实体名字，加上分号

```
<>;""

&gt; &lt; &quot; &yen; &copy; ... 
```

















