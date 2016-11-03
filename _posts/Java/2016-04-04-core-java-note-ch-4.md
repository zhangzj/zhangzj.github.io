---
layout: post
title: Core Java读书笔记-Chapter 4 对象与类
categories: Java
description: Java核心技术第一卷，第四章对象与类读书笔记
tags: Java Java核心技术
---

* content
{:toc}





面向对象程序设计和面向过程程序设计是两种不同的思维方式，而且有着很大的区别。

### 面向对象设计概述

面向对象编程，OOP是主流而程序设计泛型。Java是完全基于面向对象的，学习Java必须搞清楚面向对象的思路。

面向对象的核心就是对象，对象概念上分成两个部分，一个是公开的外部可见的接口，一个是具体实现功能的内部实现。暴露接口隐藏实现。
在OOP中，只需要关心对象提供的功能，不必关心对象内部的具体实现。

面向过程的核心是过程，也就是处理数据的算法，首先想好怎么处理数据，然后再布局怎么处理存储数据。OOP的切入点是以数据位核心的。

两种设计泛型之间的选择，一般是小规模的需求使用面向过程，大规模的程序使用面向对象。

#### 1.类

类，Class，是构造对象的蓝图，表现怎么构造对象。每一个类对应一个或者几种功能。也可以创建自己的类来实现某些功能。

封装的概念，就是把对象中的数据进行隐藏。对象中的数据也称为对象的实例域，使用对象的方法访问操作对象中的数据。封装的重点在绝对不能让对象之间可以直接访问数据。对象之间的交互智能通过接口方法实现。这样可以保证输入输出不变，隐藏内部实现。

继承的概念就是说使用现有的类作为模板，生成一个新的类，让新的类拥有被扩展的类的所有属性和方法。

#### 2.对象

对象的三个主要特性：行为，状态，标识。

行为是可以对对象施加哪些操作，状态表示对象面对操作如何响应，标识解决的是标识状态和行为相同的对象问题。

同一个类构造的对象，方法和状态都是相似的，甚至是相同的。具有相同的行为，行为也就定义了一个对象的一个方面。

对象的状态也标识了对象本身，状态自身是可能发生变化的，但是不会自己无端端发生，必须是通过方法来改变，不能直接更改状态的数据，破坏了封装性。

对象标识是唯一标识对象的方式。没有两个完全一模一样的对象。

对象的状态也会影响对象的行为，某些状态类似行为的开关，标识行为可用不可用。

#### 3.定义类

在程序设计过程中，面向过程是从main函数开始，一点一点推进。面向对象是从问题域的分析开始，都有哪些对象，进行思考设计。

#### 4.类之间的关系

常见的关系有，依赖，组合，继承。

依赖就是在一个类中使用了另一个类，使用对象的方法操作了对象。 use-a

组合，has-a的关系，一个对象的状态中包含了另外的对象，就是组合。

对于类之间的关系，工程上一般使用UML图，统一建模语言，来展示，需要补足。

继承，is-a表示一种特殊与一般的关系。

### 使用预定义类

并不是所有类都需要封装数据，Math类就只是封装了一套方法，也就是算法，但是并没有数据，因为Math自身并没有数据。

#### 1.对象与对象变量

```Java
Date date = new Date();
```

Date就是类的名字，而date是Date类型对象的一个引用，Date()是类的构造方法，new操作符调用构造方法新建了一一个对象。返回的对象引用赋值给date。

#### 2.GregorianCalendar

Date当中是有一个表示具体时间点的状态，UTC时间，也就是1970年1月1日。这个是具有实践意义的。

具体的日历类使用Calendar。GregorianCalendar扩展了Calendar。

具体的构造器可以构造很多日历对象

```Java
new GregorianCalendar()
```
表示对象构造时候的时间。

```Java
new GregorianCalendar(1999, 11, 31);
new GregorianCalendar(1999, Calendar.DECEMBER, 31);
new GregorianCalendar(1999, Calendar.DECEMBER, 31, 23, 59, 59);
```

类的够功能千奇百怪，有些新的设计覆盖了原来的设计，进行改进。

#### 3.Setter和Getter

封装的数据需要方法来进行访问。用get来获取，set来设定。

在Calendar类方式可以借助里面定义的常量进行get

```Java
GregorianCalendar now = new GregorianCalendar();
int month = now.get(Calendar.MONTH);
int weekday = now.get(Calendar.DAY_OF_WEEK);
```

用set方法设定Calendar对象的状态

```Java
deadline.set(Calendar.YEAR, 2001);
deadline.set(Calendar.MONTH, Calendar.APRIL);
deadline.set(Calendar.DAY_OF_MONTH, 15);
```

还可以为日历对象增加天数，星期，等等。如果传递的值是负数，那么就会往前。
```Java
deadline.add(Calendar.MONTH, 3);
```

##### Date与Calendar之间的转换

```Java
GregorianCalendar calendar = new GregorianCalendar(yaer, month, day);
Date hireday = calnedar.getTime();

Date time = calendar.getTime();
calendar.setTime(time);
```

### 用户自定义类

workhorse Class，主力类，没有main方法，但是有自己的实例域和实例方法的类。一个完整的程序是相关的类集合加上一个main方法。

#### 1.Employee类

Java中最简单的类是由几个属性和方法组成的

```Java
class ClassName{
  field1
  field2
  ...
  constructor1
  constructor2
  ...
  method1
  method2
  ...
}
```

薪金管理系统，Java实现问题域中一个模型，雇员Employee类

```Java
class Employee{
  // 实例变量域
  private Stirng name;
  private double salary;
  private Date hireDay;

  // 构造器
  public Employee(String n, double s, int year, int month, int day){
    name = n;
    salary = s;
    GregorianCalendar calendar = new GregorianCalendar(year, month-1, day);
    hireDay = calendar.getTime();
  }

  // 方法
  public String getName(){
    return name;
  }
  // 还有很多方法
}
```

#### 2.多个源文件的使用

一个类放在一个单独的源文件中，文件名和类名一致。

#### 3.剖析Employee类

方法都是用的public开头，这是一种访问级别，表示任何类的任何方法都可以调用这个方法。

实例域的开头都是private，表示只有类中自己的方法可以读写这些实例变量，其他类不能看到。

#### 4.构造器

```Java
// 构造器
public Employee(String n, double s, int year, int month, int day){
  name = n;
  salary = s;
  GregorianCalendar calendar = new GregorianCalendar(year, month-1, day);
  hireDay = calendar.getTime();
}
```

不可不知的关于构造器的几个要点

构造器与类名同名；

每个类可以有一个以上的构造器；

构造器可以有0个或者1个以上的参数；

构造器没有返回值；

构造器总是伴随着new操作符一起调用；

#### 5.隐式参数与显式参数

对于Employee类型的对象number007

```Java
number007.raiseSalary(5);
```

隐式参数就是方法名前面的对象名，显式参数就是方法声明中后面的穿进去的参数。

在每一个方法中，关键字this表示隐式参数。

```Java
public raiseSalary(int byPercent){
  double raise = this.salary * byPercent/100;
  this.salary += raise;
}
```

#### 6.封装的优点

外面的对象不能直接访问内部的实例域，可以确保数据的安全，setter和getter方法可以对访问过程进一步处理。

返回值是引用，引用的对象又是可变对象的方法是十分危险的，调用者获取对象应用之后可以直接更改对象内部的私有状态。

比如Employee的getter方法，getHireDay，返回的Date对象是可变的，那就直接可以操作引用的对象。

```Java
public Date getHireDay(){
  return hireDay;
}
```

这样子假设使用d来做接受的对象应用，那个d和hireDay就指向了同一个对象。

这个getter应该返回的是内部实例域对象的拷贝部分

```Java
public Date getHireDay(){
  return hireDay.clone();
}
```

#### 7.基于类的访问权限

一个方法可以访问所属类的所有对象的私有数据。

```Java
public boolean equals(Employee other){
  return name.equals(other.name);
}
```

这个equals方法不仅访问了自己的对象的私有数据，还访问了other对象的私有数据，也就是说Employee的对象可以访问所有Employee对象的私有数据。

#### 8.私有方法

有些方法作为公有方法的辅助方法，不需要暴露出来，那就可以设为private的方法。

#### 9.final实例域

实例域加上final，构建对象的时候必须初始化这个域。初始化之后就不能再更改这个域的值。

```Java
private final String name;
```

final修饰符基本上都是修饰基本类型或者不可变的对象。因为final确定的不可改变不是内容上，而是引用的值不能变。可变对象的final就是仍然可以调用对象方法来改变状态的。

### 静态域与静态方法

抬眼观瞧，main前面有static修饰符。

#### 1.静态域

静态域也叫类域，表示一个类只有这么一个域。

```Java
private static int nextID = 1;
```

#### 2.静态常量

既是不可变的对象，又是一个类域。

```Java
public static final double PI = 3.14159326;
```

因为静态常量是不可变的对象，所以设置成public也没有关系。

#### 3.静态方法

```Java
Math.pow(x, a);
```

没有隐式参数，也就是没有this关键字，不能操作对象，所以不能再静态方法里访问实例域，但是可以访问自己的静态域。

虽然可以使用对象调用静态方法，但是不建议这么做，因为计算机国和对象一点关系都没有。

#### 4.工厂方法

类的静态方法，可以调用生成不同风格不同格式的对象。

```Java
NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();
NumberFormat percentFormatter = NumberFormat.getPercentInstance();
double x = 0.1;
System.out.println(currencyFormatter.format(x));// prints $0.10
System.out.println(percentFormatter.format(x)); //prints 10%
```

#### 5.main方法

可以在类当中新建main方法，只要执行这个对象相当于执行单元测试。

### 方法参数

按值调用，表示方法接受的是调用者提供的值。得到的是参数的拷贝。

按引用调用， 表示接受的是调用者提供的变量地址。得到的是对象引用的拷贝。通过引用可以改变对象内部的状态。

所以对象引用的传递实际上是值传递，把对象的地址拷贝传到里面。

### 对象构造

构造器是对定义的对象进行初始化，很重要，方式也很多。

#### 1.重载

重载：有多个方法，方法的名字相同，但是方法的参数不同。

重载解析：编译器挑选哪一个方法来执行，找到匹配的参数类型的方法来执行，找不到或者找到多个就会报错，这个过程叫重载解析。

方法签名：方法的名字和参数列表。返回类型不是签名的一部分。

#### 2.域初始化默认值

域变量没有在构造器里面被初始化，就会被默认值初始化，0，false，null。不同步局部变量，局部变量必须被初始化。

#### 3.无参数的构造器

在类中没有任何构造器存在的时候，系统就会提供一个默认的构造器，把所有的域初始化成默认值。

但是当类中有了构造器，系统就不再提供默认构造器。如果只写一个有参数的构造器，再调用无参构造器创建对象，就会报错。

#### 4.显示域初始化

在执行构造器之前，先在定义域的时候初始化。

```Java
class Employee{
  private String name = "";
  ...
}
```

#### 5.参数名

构造器的传参名字以及写法

```Java
public Employee(String name, double salary){
  this.name = name;
  this.salary = salary;
}
```

#### 6.调用另一个构造器

关键字this引用方法的隐式参数，除此之外还有另一个用法。

若是this(...)这样的形式，那就是调用类的构造器

```Java
public Employee(double salary){
  this("Employee #" + nextID, salary);
  nextID++;
}
```

#### 7.初始化块

之前两种初始化数据域的方法：在构造器中设定值；在声明中赋值；

还有一个是初始化代码块，一个类中可以包含多个代码块，只要创建对象，代码块就会被执行。

```Java
class Employee{
  private static int nextID;

  private int id;
  private String name;
  private double salary;

  // 数据初始化代码块
  {
    id = nextID;
    nextID++;
  }
  // 构造器...
}
```

调用构造器的时候，具体会执行几个步骤

第一步，所有数据域被初始化成默认值
第二步，按照在类声明中出现的次序，依次执行所有域初始化，和初始化块；
第三步，如果构造器调用了其他构造器，执行其他构造器
第四步，执行构造器主体

静态初始化块会进行静态域的初始化。

```Java
private static int nextID = 1;
static
{
  Random generator = new Random();
  nextID = generator.nextInt(10000);
}
```

#### 8.对象析构与finalize方法

析构器，对象不再使用的时候执行的清理代码。一般来讲，Java有垃圾回收机制，分配的内存不需要自己手动回收。So...

### 包

包一般是嵌套层次结构的目录，建议使用反向域名那就不会冲突了。世界唯一。

#### 1.类的导入

类可以使用所属的包中所有的类以及其他包中的pulic类。方位其他包中的类，一种是可以写完整的包名作为类名的前缀来使用，但是很明显太麻烦了。第二种就是导入，所要使用的类的包。

```Java
import java.util.*;
```

#### 2.静态导入

import可以导入静态方法和静态域，前面加上static修饰符。

```Java
import static java.lang.System.*;
```

#### 3.将类放入包中

使用package关键字就可以，如果文件的开头没有这一句，那就会放入一个default默认包当中。

```Java
package com.horstman.corejava;
```

#### 4.包作用域

如果访问修饰符都不指定，private，public都没有，那就是默认的作用域，同一个包里面的所有类都可以访问，保罗类，变量，方法。都是这样子。

```Java
public class Window extends Container{
  String warningString;
  ...
}
```

### 类路径

JAR文件就是一个压缩的层次目录文件，叫做类库文件。加载第三方类库的时候一般就是给出几个JAR文件。

首先是对于class文件和类文件，如果包名是com.zzj.java，那么对应的文件就要放在com/zzj/java文件夹下。
如果是Jar文件，就放在archives目录下。这两个都是基于工作目录基目录.而言的。

之后就是设定类路径，类文件就是./路径来引用类，jar文件就需要写完整,./archives/jar.jar。

最好是执行的时候自己制定classpath，比如使用java的-classpath参数来指定。

### 文档注释

javadoc生成的HTML文档是和代码放在一起的，执行代码的javadoc就可以直接同步注释，保持一致性。

#### 1.注释的插入

javadoc从几个地方抽取信息，也就是需要加文档注释的几个方面。

包；public类和接口；public和protected的构造器和方法；public和protected的域；

注释放在要描述的特性前面，用斜杠两个星号开始，星号斜杠结束。

之间的文本时自由格式的文本，可以使用@开头的标记。@author，@param。

#### 2.类注释

类注释放在import语句之后，类定义前面：

```Java
/**
 * A <code>Card</code> object represents a playing card, such as...
*/
class Card{}
```

#### 3.方法注释

要放在方法定义的前面：可以使用一些方法注释用的标记

@param 描述变量，多条必须放在一起

@return 返回值描述

@throw 类描述，表示方法可能会抛出的异常

```Java
/**
Raise the salary of an employee;
@param byPercent the percentage
@return the amount of the Raise
*/
public double raiseSalary(double byPercent){}
```

#### 4.域注释

只对公有域建立文档。

#### 5.通用注释

@author 作者姓名

@version 当前版本的描述

@since 引入版本的特性描述

@deprecated 废弃信息

@see 引用，加上超链接

#### 6.包与概述注释

给包加上注释，需要加一个单独的文件

第一个方案，加上一个package.html文件，在body之间的内容都会被提取

第二个方案，加一个package-info.java文件，里面package之后加上文档注释，没有其他代码或者注释

### 类设计技巧

设计出来的类要具有oop的专业水准

第一，一定保证数据私有，绝对不要破坏数据封装。

第二，一定要对数据进行初始化，不要依赖默认值，自己进行初始化。

第三，不要在类中使用过多的基本类型。

第四，不是所有的域都要setter和getter。

第五，一个类不要有过多的职责，适当进行分解。

第六，类名和方法要体现自己的含义，自己解释自己的代码是好代码。
