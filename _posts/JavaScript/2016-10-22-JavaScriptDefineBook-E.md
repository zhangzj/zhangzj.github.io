---
layout: post
title: "JavaScript权威指南 读书笔记-E"
categories: javascript
description: JavaScript权威指南读书笔记
tags: javascript
---

* content
{:toc}

全书的第一编：JavaScript语言核心

第8章：函数





### 8 函数

- 函数调用中，每次调用都有一个上下文，就是this关键字的值

- 对象的方法，调用上下文，就是对象

- js中函数即对象，可以有属性甚至方法

- 函数可以嵌套在函数中定义，这样就可以访问被定义时所处的作用域中的任何变量，也就是闭包

#### 8.1 函数定义

- 使用function来定义

- 其实还是分为有名字和匿名函数的

```
var square = function(x) { return x*x; };

data.sort(function(a,b) { return a - b; });
```

- 嵌套函数：嵌套的函数内定义的函数的作用域，可以访问外面的函数的变量

#### 8.2 函数调用

- 有4种方式来调用js函数

	- 函数调用
	- 方法
	- 构造函数
	- 通过函数的call()和apply()方法进行间接调用

##### 8.2.1 函数调用方式

- 函数表达式，函数名加上参数列表，圆括号包裹

##### 8.2.2 方法调用

- 保存在对象属性中的js函数

```
o.m = f;
o.m();
```

- 方法和函数调用的区别是，调用上下文，方法中，o称为调用上下文，函数体可以使用关键字this引用该对象

```
var calculator = {
	operand: 1,
	perand2: 1,
	add: function() {
		this.result = this.operand1 + this.operand2;
	}
};

calcuator.add();
calculator.result => 2
```

- 方法链：方法的返回值是对象的时候，可以在调用它的方法

##### 8.2.3 构造函数调用

- 函数或者方法调用钱有关键字new，就是构造函数调用。与普通的函数调用比在实参处理，调用上下文和返回值上都有不同

- 没有形参的构造函数可以省略圆括号

```
var o = new Object();
var o = new Obeject;
```

- 构造函数调用创建一个新的空对象，继承自构造函数的prototype属性；使用新的对象座位上下文，可以使用this关键字引用新的对象，所以咋new o.m()中，上下文并不是o

- 构造韩式的返回值不用写，它默认返回新对象

##### 8.2.4 间接调用

- 函数也是对象，有两个方法，call() apply()，可以间接地调用函数

- 可以显式制定调用的参数this，任何函数可以作为任何对象的方法来调用，即使这个函数不是那个对象的方法

#### 8.3 函数的实参和形参

- 函数调用不指定形参的数量，也不检查实参的类型，那怎么搞定？

##### 8.3.1 可选形参

- 如果传入的实参比形参少，剩下的就是默认为undefined，剩下的默认制定在函数内部搞定

##### 8.3.2 可变长的实参列表：实参对象

- arguments对象是一个类数组对象，可以通过它来访问实参列表

```
function f(x, y, z) {
	if (arguments.length != 3) {
		throw new Error("err");
}
// other code
}

function max(/* ... */) {
	var max = Number.NEGATIVE_INFINITY;
	for (var i = 0; i < arguments.lenghth; i++)
		if (arguments[i] > max) max = arguments[i];
	return max;
}

var largest = max(1, 10, 100, 10000); // => 10000
```

- callee caller 属性，arguments对象的另外两个属性，callee只带当前正在执行的函数，caller知道调用当前正在执行的函数的函数

##### 8.3.3 将对象属性用做实参

- 把要传入的参数列表，包装成一个对象传入，之后使用对象属性查询参数


```
function arraycopy(from, to, from_start, to_start, length){ // code}

function easycopy(args) {
	arraycopy(args.from, args.from_start, args.to, args.to_start, args.length);
}

var a = [1,2,3,4], b = [];
easycopy({ from:a, to:b, length:4 });
```

##### 8.3.4 实参类型

- js不检查，直接用，使用注释说明

- 自己在代码逻辑中检查实参类型，给出错误提示

#### 8.4 作为值的函数

- 函数不仅是一种语法也是一个值，函数可以赋值给一个变量，存储在对象的属性或者数组的元素中，作为参数传入另一个函数等

```
var s = arraycopy;
```

```
var a = [function(x) { return x*x; }, 20];
a[0](a[1]);
```

#### 8.5 作为命名空间的函数

- 函数内定义的变量，外部不可见

- 函数定义之后，全局变量只是增加了函数的名字，可以直接匿名然后直接调用

```
(function() {
	// code
}());
```

#### 8.6 闭包

- 什么是闭包？十分古老的术语，是说函数变量可以被隐藏于作用域链之内，因此看起来是函数将变量，包裹了起来。函数对象可以通过作用域链相互关联起来，函数体内部的变量都可以保存在函数作用域内，这种特性在CS文献中称为闭包。

- 看不大懂，不太想看，暂时跳过

#### 8.7 函数属性，方法和构造函数

- 函数是特殊的对象，也可以拥有属性和方法，甚至可以使用Function()构造器来创建新的函数对象

##### 8.7.1 length属性

- 函数本身的length属性是只读的属性，代表函数的实参数量，函数定义时候给出的实参

##### 8.7.2 prototype属性

- 原型对象呗

##### 8.7.3 call方法和apply方法

- 间接调用函数

##### 8.7.4 bind方法

- ES5中新增的方法，主要作用就是讲函数绑定至某个对象，将函数当做方法来调用

##### 8.7.5 toString()方法

- 大多数函数的方法实现都是返回函数的完整源代码，内置函数返回一个类似native code的字符串作为函数体

##### 8.7.6 Function() 函数

- 一般是使用关键字function来定义，也可以使用构造函数

```
var f = new Function("x", "y", "return x*y;");
```

##### 8.7.7 可调用的对象

#### 8.8 函数式编程

- js并不是函数式编程语言，但是可以向操控对象一样操控函数。

##### 8.8.1 使用函数处理数组

- map和reduce

- 计算平均值和标准差

```
var sum = function(x,y) {return x+y;};
var square = function(x) {return x*x;};

var data = [1,2,3,5,5];
var mean = data.reduce(sum)/data.length;
var deviations = data.map(function(x) {return x-mean;});
var stddev = Math.sqrt(deviations.map(square).reduce(sum)/(data.length-1));
```

##### 8.8.2 高阶函数

- 就是操作函数的函数，接受一个或者多个函数作为参数，并返回一个新函数

- 可以让多个函数进行组合等等

##### 8.8.3 不完全函数

##### 8.8.4 记忆


