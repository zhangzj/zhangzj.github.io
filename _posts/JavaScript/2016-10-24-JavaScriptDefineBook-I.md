---
layout: post
title: "JavaScript权威指南 读书笔记-I"
categories: javascript
description: JavaScript权威指南读书笔记
tags: javascript 
---

* content
{:toc}

全书的第二编：客户端JavaScript

第14章：Window对象

第15章：脚本化文档





### 14 Window对象

- js客户端的全局对象，Window对象有哪些属性和方法？有些什么api

#### 14.1 计时器

- setTimeout和setInterval用来注册指定时间之后单词或者重复调用的函数

- setTimeout会返回一个值，这个值可以传递给clearTimeout用于取消这个函数的运行

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f93hmg8ytfj20j40efwhi.jpg)

#### 14.2 浏览器定位和导航

- window的属性localtion是Location对象，表示窗口当前的URL

##### 14.2.1 解析URL

- location对象的属性有很多关于url的信息，可以使用来提取

##### 14.2.2 载入新的文档

- 最直接的就是改变loaction属性的值，或者使用assign方法

```
location = "http://www.baidu.com";
location.assign("http://www.baidu.com");
```

#### 14.3 浏览历史

- window对象的history属性，把窗口的浏览历史文档和文档状态列表的形式表示

- back，forward方法表示前进和后退

```
history.back();
history.forward();
```

- go方法可以接受一个整数参数，表示前进和后退多少页

- 流行框架中一般都有历史管理的功能，比如jQuery的history插件

#### 14.4 浏览器和屏幕信息

- 脚本获取浏览器和所在的桌面信息，window对象的navigator和screen属性

##### 14.4.1 Navigator对象

- navigator表示浏览器本身的信息等等

##### 14.4.2 Scren对象

- 有关窗口显示的大小和可用的颜色数量的信息

#### 14.5 对话框

- window对象提供3个方法来显示简单的对话框，alert显示消息并提示关闭，confirm要求点击确定还是取消，并返回布尔值，prompt等待用户输入字符串，并返回字符串

- 更复杂的对话框，showModalDialog在浏览器中显示一个模态窗口

![](http://ww1.sinaimg.cn/large/8d6a2535gw1f93icpp1dgj20jv083wfs.jpg)

#### 14.6 错误处理

- window对象有onerror属性

```
// 在一个对话框中弹出错误消息，但是不超过3次

window.onerror = function(msg, url, line) {
	if (onerror.num++ < onerror.max) {
		alert("ERROR: "+ msg+"\n" + url+":"+line);
		return true;
	}
}

onerror.max = 3;
onerror.num = 0;
```

#### 14.7 作为Window对象属性的文档元素

- id属性为元素命名，html文档中的id属性会成为可以被脚本访问的全局变量

#### 14.8 多窗口和窗体

- 多标签页，每一个标签页都是一个上下文，都有独立的window对象，相互之间互不干扰

- 当一个窗口控制打卡另一个窗口的时候，就不是毫无联系了，可以互操作

##### 14.8.1 打开和关闭窗口

- 可以使用方法open打开一个新的空白窗口，close关闭

- open的参数，1 地址，2 窗口名字，3 窗口大小和状态

- open返回一个window对象，这直接操作那个刚才打开的窗口

##### 14.8.2 窗体之间的关系

- 新窗口的window对象中有opener属性，这样子两个窗口之间就可以互相引用，读取对方的属性或者调用对方的方法

- 自己的窗口或者窗体引用是window或者self，可以使用parent属性引用上一层的窗口，顶级的窗口的parent是一个窗体，也就是浏览器本身，指向自己

- 自己的子窗体，iframe可以使用元素方式引用

##### 14.8.3 交互窗口中的js

- 要是没有同源策略的限制，脚本就可以和其他窗口进行交互

### 15 脚本化文档

- 客户端js使得静态的html成为了webapp，window对象有一个属性document来引用Document对象，表示窗口的内容

- document是一个巨大的API中的核心对象，叫做文档对象模型，DocumentObjectModel，DOM，代表和操作文档的内容

#### 15.1 DOM概览

- 首先是HTML和XML的嵌套元素在DOM树对象中的表示

- 每一个标签都是一个节点，也即是一个Node对象

- html元素的节点是element节点，代表文本的是text节点，document，element，text都是node的子类

#### 15.2 选取文档元素

- 选取文档中元素的方法

	- id属性
	- name属性
	- 标签名
	- css类
	- 匹配指定的css选择器

##### 15.2.1

- id属性，在文档中是唯一的，document方法getElementById

```
var sections1 = document.getElementById("section1");
```

##### 15.2.2 通过名字选取元素

- name属性只在少数元素中有效，比如iframe和img，而且name的值在文档中不是唯一的也可以

##### 15.2.3 通过标签名选取元素

- document的方法getElementsByTagName返回一个NodeList对象

```
var firstpara = document.getElementByTagName("p")[0];
```

- document有两个边界属性，body和head，代表两个元素，浏览器隐式创建

##### 15.2.4 通过CSS类选取元素

- class属性是空格隔开的列表，document中的getElementsByClassName方法

```
var warnings = document.getElementsByClassName("warning");
```

##### 15.2.5 通过css选择器选取元素

- 使用css的选择器进行元素的定位，选择器本身就是描述文档中的若干或者多组元素，元素可以使用id，类或者标签名来描述

```
#nav 		// id是nav的元素
div 		// 所有的div元素
.warning 	// 所有在class属性中包含了warning的元素
```

- 更一般的来讲，元素可以基于属性值来选取

```
p[lang="fr"] 	// 所有使用法语的段落， <p lang="fr">
*[name="X"] 	// 所有包含name是x属性的元素
```

- 基本选择器的组合

```
span.fatal.error 			// class中包含fatal和error的所有span元素
span[lang="fr"].warning 	// 所有使用法语并且class中包含warning的span元素
```

- 选择器可以指定文档的结构

```
#log span 				// id等于log的元素的狗带元素中的所有span元素
#log>span 				// id等于log的元素的子元素中的所有span元素
body>h1:first-child 	// body的子元素中的第一个h1元素
```

- 选择器可以组合，来选取多个或者多组元素

```
div, #log
```

- document.all[]

	表示文档中的元素，除了text节点，废弃

#### 15.3 文档结构和遍历

- 文档元素选取ok之后，有时候会需要相关部分，比如父亲，兄弟，子女等等，概念上文档就是一棵节点对象树

##### 15.3.1 作为节点树的文档

- 每一个节点都是一个Node对象，有一些重要的属性

	- parentNode，父节点
	- childNodes，子节点，NodeList对象
	- firstChild，lastChild，子节点中的首个和最后一个
	- nextSibling，previousSibling，前一个和后一个兄弟节点
	- nodeType，节点的类型
	- nodeValue，节点的文本
	- nodeName，元素的标签名字

```
document.childNodes[0].childNodes[1];
document.firstChild.firstChild.nextSibling
```

- 有点像xpath的做法和概念

##### 15.3.2 作为元素树的文档

- 主要矛盾是在文档中的元素上，而不是元素之间的文本时候，可以看做是Element对象树，忽略部分文档，Text和Comment节点

#### 15.4 属性

- html元素是一个标签和一组属性组成的，比如a元素是一个超链接，有属性gref作为值表示目的地址，在元素HTMLElement对象的属性就是这些属性

##### 15.4.1 HTML属性作为Element的属性

- 常用的属性都有预先的定义，比如id，lang和dir属性，还有img元素的src属性

##### 15.4.2 获取和设置非标准HTML属性

- 有方法，getAttribute和setAttrubute来这顶非标准属性

##### 15.4.3 数据集属性

- 给元素标签添加额外属性的方式，前缀data-的属性在H5中都是合法的

```
<span class="sparkline" data-ymin="0" data-ymax="10">
1 2 3 4 5 6 7 8 9 0
</span>
```

- 这些附加的属性不会对文档外观产生影响，dataset属性的引用遵循一定的规律
	
在Element对象上的属性dataset，这个对象的属性就是data-属性名，复合驼峰命名

```
data-jquery-test => dataset.jqueryTest
```
 
##### 15.4.4 作为Attr节点的属性

- 还有一个使用Element属性的方法，attributes属性，代表元素的所有属性

```
document.body.attributes[0] 			// body元素的第一个属性
document.body.attributes.bgcolor  		// body元素的bgcolor属性
document.body.attributes["ONLOAD"] 	// body元素的onload属性
```

#### 15.5 元素的内容

- 元素的内容就是标签内的东西，可以理解成字符串，也可以理解成节点，或者纯文本

##### 15.5.1 作为HTML的元素内容

- element的属性innerHTML会作为字符串标记返回元素内容

- outerHTML返回的是包含标签的文本字符串

##### 15.5.2 作为纯文本的元素内容

- 在文档中插入纯文本，Node的textContent属性实现

##### 15.5.3 作为Text节点的元素内容

#### 15.6 创建，插入和删除节点

##### 15.6.1 创建节点

- 可以使用documnt的createElement被方法床底元素的标签名

- 也有其他的工厂方法，createComment，createDocumentFragment，createElementNS

##### 15.6.2 插入节点

- appendChild需要插入的节点上追加一个子节点

- insertBefore和appendChild一样，接受连个参数，在节点前面插入

##### 15.6.3 删除和替换节点

- removeChild方法，在父节点上调用来删除子节点

- replaceChild方法，删除并且替换成另一个节点

##### 15.6.4 使用DocumentFragment

- 特殊的Node，作为其他节点的一个临时的容器

- 会被看做一个整个树的片段，下面所有的子节点都会被同意操作，看做是一个节点

#### 15.7 例子：生成目录表

- 展示一些特性，文档脚本化的一些概念：元素选取，文档遍历，元素属性设置，innerHTML属性设置和在文档中创建和插入新节点等

#### 15.8 文档和元素的几何形状和滚动

- 文档看到的时候是一个视觉表现层，每个元素都有自己的尺寸和位置

##### 15.8.1 文档坐标和视口坐标

- 视口就是窗口的网页展示部分，不包括浏览器的边框部分

- 还没有滚动的情况下，文档的原点就是视口的远端，出现滚动的时候，就会有偏移量

##### 15.8.2 查询元素的几何尺寸

- getBoundingClientRect方法获取在视口坐标中的位置

- 偏移量加上位置就可以计算出坐标和大小

##### 15.8.3 判定元素在某点

- 想知道在视口的指定位置上有什么元素？Document对象的elementFromPOint方法来判定

- 实际应用上，将鼠标指针的坐标传递给他来判断鼠标在哪个元素上

##### 15.8.4 滚动

- 设置属性scrollLeft和scrollTop来让浏览器滚动，方法scrollTop接受一个文档坐标，作为滚动条的偏移量进行设置

##### 15.8.5 关于元素尺寸，位置和溢出的更多信息

- 老式的方式来讲，html的只读属性，offsetWidth和offsetHeight用css像素返回屏幕尺寸

#### 15.9 HTML表单

- 提交表单的标签十分古老，比js本身还要早

- 表单元素和表单元素API

![](http://ww2.sinaimg.cn/large/8d6a2535gw1f94mr2wfbwj20ic04t74v.jpg)

![](http://ww3.sinaimg.cn/large/8d6a2535gw1f94mrp6zzbj20h90i5415.jpg)

##### 15.9.1 选取表单和表单元素

- 和其他元素一样选取方法

##### 15.9.2 表单和元素的属性

- 在js之前，需要一个提交按钮来提交表单，js的form对象支持submit方法和reset方法

##### 15.9.3 表单和元素的时间处理程序

- onsubmit和onreset回调

##### 15.9.4 按钮

- 视觉上按钮是让用户触发脚本的方式，onclick事件处理程序

##### 15.9.5 开关按钮

- 复选框和单选框都是开关按钮

##### 15.9.6 文本域

- input标签用来用户输入文本，单行输入

- textarea是多行输入

##### 15.9.7 选择框和选项元素

- select元素一般是渲染成下拉菜单的形式

#### 15.10 其它文档特性

- 15章是全书最重要的一章，Document对象的讲解

##### 15.10.1 Document的属性

- 除了body，documentElement和forms，还有一些有趣的属性

- cookie，dimain，lastModified，location，referrer，title，URL

##### 15.10.2 document.write()方法

- 早起的脚本化api，早dom之前就引入了

##### 15.10.3 查询选取的文本

- 查询用户在文档中选取了什么文本？选中了什么文本？

##### 15.10.4 可编辑的内容

- html简单的编辑功能，博客评论页面之类的，嵌入一个富文本编辑器，包含样式排版之类的，类似word的东西，cms

- 抵用方式，1 设置任何标签的contenteditable属性，2 设置对应元素的jscontenteditable属性