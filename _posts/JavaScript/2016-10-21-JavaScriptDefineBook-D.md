---
layout: post
title: "JavaScript权威指南 读书笔记-D"
categories: javascript
description: JavaScript权威指南读书笔记
tags: javascript
---

* content
{:toc}

全书的第一编：JavaScript语言核心

第7章：数组





### 7 数组

- js的数组是无类型的

- 数组是动态的，长度可以增减

- 数组是对象的特殊形式，数组索引类似整数的属性名

#### 7.1 创建数组

- 直接量创建或者new Array(参数列表) 创建都可以

#### 7.2 数组元素的读和写

- 方括号中是结果是非负整数的表达式

- 可以使用其他的值来作为索引，比如浮点数和字符串，但是要么返回undefined，要么就是当做属性名字访问

#### 7.3 稀疏数组

- 稀疏数组就是包含从0开始的不连续索引的数组，数组的length永远比最大的索引大

```
a = new Array(5);
a = [];
a[1000] = 0;
```

#### 7.4 数组长度

- 数组的length属性，针对稠密数组，就是数组的元素个数，比最大的索引大1

#### 7.5 数组元素的添加和删除

- 最简单的就是帮新的索引赋值

- 也可以使用 push 方法

- 删除的话使用 delete 关键字

#### 7.6 数组遍历

- for循环遍历

- 函数式风格遍历，forEach(function)

#### 7.7 多维数组

- 用元素是数组来实现多位数组，循环嵌套来遍历

#### 7.8 数组方法

- Array.prototype 中定义了很多函数操作数组

##### 7.8.1 join()

- 将所有的元素转化成字符串并连接在一起

```
a.join(分隔符);
```

- Array.join() 方法是 String.split() 方法的逆向操作，后者是把字符串分隔成若干块来创建数组

##### 7.8.2 reverse()

- 翻转元素顺序

##### 7.8.3 sort()

- Array.sort() 返回排序后的数组，要是有undefined，就放在最后

- 可以指定比较函数，按照返回值的正负决定顺序

##### 7.8.4 concat()

- 创建并返回一个新数组，新数组包括调用concat 的元是数组和每一个参数

##### 7.8.5 slice()

- 指定数组的一个片段或者子数组，参数是开始和结束的位置

##### 7.8.6 splice()

- 在数组中插入或者删除元素的通用方法，会修改调用的数组

##### 7.8.7 push() 和 pop()

- 模拟栈的操作，实现先进后出的数据结构

##### 7.8.8 unshift() 和 shift()

- 类似于push和pop，不一样的是push是在尾部追加，shift是在头部进行插入，删除同理

- unshift的插入元素是一次性的全部插入，多参数的情况下

##### 7.8.9 toString() 和 toLocalString()

- 每个元素转成字符串，然后不加方括号返回，逗号分隔，内部有嵌套的数组的话也不会有方括号的

#### 7.9 ES5 中的数组方法

- 有新方法，用于，遍历，映射，过滤，加测，简化，搜索数组

- 大多数方法是第一个参数接受一个函数，并对数组的每一个元素调用一次该函数

##### 7.9.1 forEach()

- 从头到尾遍历数组，为每一个元素调用指定的函数，传递的函数是forEach的第一个参数

- forEach使用三个参数调用该函数，1. 数组元素，2. 元素的索引， 3. 数组本身

- 如果只关心数组的值，可以只传递一个参数

```
var data = [1,2,3,4,5];
var sum = 0;
data.forEach(function(value) { sum += value; });
sum //

data.forEach(function(v, i, a) { a[i] = v + 1; });
// v = value, i = index, a = array
```

- forEach的遍历没有办法使用break停止，只有抛出异常，放在try块中来停止

##### 7.9.2 map()

- map会把数组的每一个元素传递给指定函数，然后返回一个数组

```
a = [1,2,3];
b = a.map(function(x) {
	return x*x;
});
b // => [1,4,9]
```

- map返回的是新数组，函数应有返回值

##### 7.9.3 filter()

- 返回调用数组的一个子集， 传递的函数是用来做逻辑判定的， 返回true或者false

```
a = [5,4,3,2,1];
smallvalues = a.filter(function(x) { return x < 3; }); // [2,1]
everyother = a.filter(function(x,i) { return i%2==0; }); // [5,3,1]
```

##### 7.9.4 every() some()

- 对数组元素应用指定函数进行判定，返回true或者false

- every是说只有数组中所欲的元素返回true才会返回true

- some就是只要存在就好，就会返回true

- 在空数组上调用的时候，every返回true，some返回false

##### 7.9.5 reduce() reduceRight()

- 使用函数将数组元素进行组合，生成单个值。也可以成为**注入**和**折叠**

```
var a = [1,2,3,4,5];
var sum = a.reduce(function(x,y) { return x+y; }, 0); 
var product = a.reduce(function(x,y) { return x*y; }, 1);
var max = a.reduce(function(x,y) { return (x>y)?x:y; });
```

- 两个参数，一个参数是化简函数，给出两个参数，返回一个值。第二个是可选的，是传递给函数的初始值

##### 7.9.6 indexOf() lastIndexOf()

- 返回找到的第一个的元素的索引，没找到就返返回-1

#### 7.10 数组类型

- 判定一个对象是不是数组，Array.isArray([])

#### 7.11 类数组对象

- js的数组有一些特性是其他对象没有的

	- 有新元素添加的时候，length自动更新
	- 设置length为较小的值会截断数组
	- 从Array.prototype中继承一些有用的方法
	- 类属性是Array

- 类数组对象偶尔出现，虽然不是真正的数组，但是可以应用数组的方法

#### 7.12 作为数组的字符串

- 早期实现的时候字符串是可以使用方括号引用字符的，类似字符数组


