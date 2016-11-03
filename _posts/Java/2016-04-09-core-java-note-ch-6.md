---
layout: post
title: Core Java读书笔记-Chapter 6 接口与内部类
categories: Java
description: Java核心技术第一卷读书笔记
tags: Java Java核心技术
---

* content
{:toc}





接口，interface，描述类有什么功能，但是不给出每一个功能的具体实现。

接口与实现，对象克隆和深拷贝。

内部类在GUI编程上的使用，让代码看起来更专业。

### 接口

接口不是类，而是对类的一组需求描述，遵从接口描述的统一格式进行定义。

接口中所有方法自动属于public

类实现接口的方法：

1. 将类声明为实现给定的接口

2. 对接口中的所有方法进行定义

实现接口的时候，必须把方法声明为public，默认的是更小的访问权限。

Arrays类中sort方法可以实现对象数组的排序，，但要求对象满足一些前提，对象所属的类必须实现comparable接口。

```Java
public interface Comparable<T> {
  int compareTo(T other);
}
```

#### 1. 接口的特性

接口不能实例化，但是可以声明接口的对象变量。

```Java
Comparable x;
```

接口也支持建立继承关系，虽然不支持包含实例域和静态方法，但是可以定义常量。

```Java
public interface Powered extends Moveable {
  double milesPerGallon();
  double SPEED_LIMIT = 95;
}
```

接口中的域自动设定为public static final。

也可以实现多个接口

```Java
class Employee implements Cloneable, Comparable{}
```


#### 2. 接口与抽象类

每个类只能扩展一个类，抽象类被继承之后，一个类就不能再扩展了；但是接口却可以实现多个。

### 对象克隆

拷贝变量的时候，原始变量和拷贝变量使用同一个对象。

浅拷贝，基本类型的拷贝是会最终有两份儿，但是对象内的子对象就还是一个对象，两个引用的状态。

Object的默认clone方法实现就是浅拷贝。

简单来说，不要使用默认的clone

1. 实现Cloneable接口

2. 使用public重新修饰clone方法

要实现深拷贝，必须克隆所有可变实例域

```Java
class Employee implements Cloneable {
  ...
  public Employee clone() throws CloneNotSupportedException {
    Employee cloned = (Employee) super.clone();

    cloned.hireDay = (Date) hireDay.clone();

    return cloned;
  }
}
```

### 接口与回调

设计模式，callback，回调。在这种模式中可以指定处某个特定时间发生时应该采取的操作

定时执行一些代码，传进来的对象必须实现一个借口，确保可以适配。

在java.awt.event包的ActionListener接口

```Java
public interface ActionListener {
  void actionPerformed(ActionEvent event);
}
```

而后定义一个类实现相关接口

```Java
class TimePrinter implements ActionListener {
  public void actionPerformed(ActionEvent event) {
    Date now = new Date();
    System.out.println("At the tone, the time is " + now);
    Toolkit.getDefaultToolKit().beep();
  }
}
```

### 内部类

内部类是定义在一个当中的类。原因三点

1. 内部类的方法可以访问作用域里面的数据，包括私有数据

2. 内部类可以对一个包里的类隐藏起来

3. 写一个回调函数但是不想走很多代码的时候，可以用匿名内部类

#### 1.使用内部类访问对象状态

给出一个简单的内部类，将访问外围类的实例域

内部类有一个外部类的隐式引用，可以直接引用外部环境的数据

内部类是private的，其他的类没有权限访问

#### 2.内部类的特殊语法规则

给出内部类的特殊语法规则

使用外围类引用的正规语法

```Java
OuterClass.this

public void actionPerformed(ActionEvent event){
  ...
  if(TalkingClock.this.beep) ToolKit.getDefaultToolKit().beep();
}
```

一般来讲，使用外围类的时候新建内部类的语法

```Java
outerObject.new InnerClass(construction parameters)

ActionListener listener = this.new TimePrinter();
```

当使用外围类，需要新建内部类的语法

```Java
TalkingClock jabberer = new TalkingClock(1000, true);
TalkingClock.TimePrinter listener = jabberer.new TimePrinter();
```

#### 3.内部类是否有用，必要和安全

领略内部类的内部，探讨如何转成常规类。

内部类是一种编译器现象，与虚拟机无关。

Java1.1的时候，加入了内部类特性，当时似乎并没有什么必要，并且破坏了访问控制和安全性。


#### 4.局部内部类
局部内部类，可以访问作用域中的局部变量
#### 5.由外部方法访问final变量

#### 6.匿名内部类
匿名内部类，用于实现回调的基本方法
#### 7.静态内部类
如何将静态内部类嵌套在辅助类当中
### 代理

undone
