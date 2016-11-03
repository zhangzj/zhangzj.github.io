---
layout: post
title: "CSS权威指南 读书笔记-B"
categories: CSS
tags: CSS 读书笔记
---

* content
{:toc}

第4章：值和单位

第5章：字体




### 4 值和单位

单位是css所有工作的基础，空白多宽多大，颜色怎么表示等等，都需要单位来表示

#### 数字

css中的数字有整数和实数，实数也就是整数后面带小数部分，可以是负数

#### 百分数

这是一个会经过计算得出的实数，最后的结果是什么根其他的元素有关，整数后面加上一个百分号的表现形式

#### 颜色

两种方式，要么直接指定名字，比如red，purplr，要么使用十六进制的色号

**命名颜色**；css规范有17个颜色名字可以使用，css3有140种

**用RGB指定颜色**；使用红绿蓝三原色的不同混合比例来指定颜色

函数式RGB指定颜色；rgb函数使用一个百分数或者整数三元组表示，百分数范围是1到100，整数范围0到255

```
rgb(100%,100%,100%)
rgb(0%,0%,0%)

rgb(255,255,255)
rgb(0,0,0)
```

属性中函数式指定颜色的使用

```
h1 {color: rgb(0,0,0);}
```

**十六进制RGB颜色**；就是六位十六进制数字来表示颜色

```
h1 {color: #000000;}
```

**颜色汇总**


**Web安全颜色**；在256色计算机上总能避免抖动的颜色，十六进制数字是0，3，6，9，C，F，使用这些数字组成的色号就比较安全

#### 长度单位

可以大致分为两类，绝对长度单位和相对长度单位

很多地方都依赖长度来制定元素的样式，所以有多种多样的长度表示方式，所有长度单位都可以是正数或者负数，后面有一个单位，是一两个英文字母的缩写，当长度为0的时候，可以省略单位

**绝对长度单位**；web设计中几乎很少使用绝对长度单位，有5种

1. 英寸 in 手袋英美的影响吧，毕竟是灯塔国的Internet比较厉害
2. 厘米 cm 国际单位
3. 毫米 mm 换算比较方便的，英制对公制
4. 点 pt 一个标准印刷单位，一英寸是72点，
5. 派卡 pc Pica也是一个印刷术语，1pc等于12pt

**相对长度单位**；根据事物之间的相关关系来度量，有三种相对长度单位，em，ex，px，前两个是em-height，x-height，常用的印刷度量单位，px表示像素，根设备的分辨率有关

#### URL

分成绝对路径和相对路径，绝对路径是指向web空间内的某个资源，相对路径是向着自己这边的资源，自己站内的资源

#### 关键字

有时候一个值需要使用某个词来描述，这个词就是称为关键字，比如none。使用取出文档中链接的下划线

```
a:link a;visited {text-decorated: none;}
```

如果一个属性接受关键字，那么只是针对这个属性的作用域定义的，两个属性都是用同一个词座位关键字，两个词的意义是不同的，letter-spacing定义的normal和font-style的normal就是不一样的

**inherit**；这个关键字是所有属性都有的，表示这个值和父元素的值相同

#### CSS2单位

1. 角度值 给定的声音从哪一个位置发出
2. 时间值 语音元素之间的延迟，可以表示毫秒，ms，秒，s
3. 频率值 用于为语音浏览器可以产生的声音声明一个给定频率

#### 小结

各种单位都有自己合适的应用场景，背景就是css属性的应用

### 5 字体

字体选择是一个常见并且重要的属性，设置字体属性是样式表的最常见用途之一；要是别人的机器上没有安装css想要的字体，那么显示效果就会大不相同

#### 字体系列

一个字体，实际上是由不同的字体风格组成的字体家族，font-family，不如Times字体包括了TimesRegular，TimesBold等font face，尽管这些字体看上去就是一个字体

除了各种特定字体，Times，Verdana，Helvetica，Arial之外，css还定义了5种通用字体

- Serif 有衬线字体
- Sans-serif 无衬线字体
- Monospace 等宽字体
- Cursive 手写字体
- Fantasy 其他无法归类的字体

**使用通用字体系列**；font-family，如果希望使用一种sans-serif字体，但是并不关心是什么具体的字体

```
body {font-family: sans-serif;}
```

**指定字体系列**；还是使用font-family，只是指定特定的字体

```
h1 {font-family: Georgia;}
```

font-family可以指定一个逗号分隔的字体列表，将通用字体放在列表的最后作为保底的选择

```
h1 {font-family: Arial, sans-serif;}
```

**使用引号**；如果字体的名字由多个单词组成，中间有空格，那就需要使用单引号包裹,还有名字中有井号，美元符号等情况

```
p {font-family: 'New Century Schoolbook';}
```

![](http://ww3.sinaimg.cn/large/8d6a2535jw1f98yh48zhuj20l7083gmo.jpg)

#### 字体加粗

css允许对字体加粗有许多的控制，粗体文本就是加粗的例子

![](http://ww3.sinaimg.cn/large/8d6a2535jw1f98yj4d5d5j20l808s0u3.jpg)

简单加粗，使用关键字来表示加粗的值

```
b {font-weight: bold;}
```

#### 字体大小

![](http://ww2.sinaimg.cn/large/8d6a2535jw1f98yobmllgj20l909y3zs.jpg)

#### 字体风格

![](http://ww1.sinaimg.cn/large/8d6a2535jw1f98yqz1zqnj20l707x0tn.jpg)

#### 字体变形

![](http://ww4.sinaimg.cn/large/8d6a2535jw1f98yrwwcwcj20lc07et9j.jpg)

#### 拉伸和调整字体

font-stretch 和 font-size-adjust 这两个属性浏览器从么有实现

#### font 属性

font属性可以有各个属性的任何值，进行统一的设置

```
h1 {font: italic 900 small-caps 30px Verdana, Helvetica, Arial, sans-serif;}
```

![](http://ww2.sinaimg.cn/large/8d6a2535jw1f9a80kuv2jj20l70al40d.jpg)

### 小结

一般文档里面都不会指定特殊的字体，不过可以设定通用的字体系列
