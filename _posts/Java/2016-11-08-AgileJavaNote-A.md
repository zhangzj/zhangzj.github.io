---
layout: post
title: "Agile Java 读书笔记-A"
categories: Java 读书笔记
tags: Java AgileJava
---

* content
{:toc}

摘要：
0. 前言 引言
1. 起步
2. Java基础



# 0 前言 引言

### TDD Test-Drievn Development 测试驱动开发

XP 极限编程的一个重要特点就是测试驱动开发，用持续的测试来推动代码的开发，简化代码的同时保证软件质量。过程上来讲，是先编写测试代码，而后在编写代码来满足测试。

TDD对于学习方面的作用来自于，这是一个会带来大量低层反馈的技术，这种TDD带来的大量迅速的反馈会持续强迫你编写正确的代码，比传统上，编码-执行-观察的方式要快速得多。

搭建学习实验环境，需要的组件是Java平台，Junit库Jar包，和Ant构建工具，对应需要的安装配置。通过一个HelloWorld的例子来表示环境配置完成。

# 1 起步

**测试先行的意思**：TDD意味着代码是测试先行，有一个类就会有对应的测试类大概率上，比如Student类，就会有对应的StudentTest类来负责测试执行，看Student是否满足了要求。从关系上来说，生产类不依赖于测试类，甚至对测试类的存在一无所知。

**需求转化成设计**：客户的具体需求转化成系统中的详细设计，是一个比较漫长的过程，已不太可能一蹴而就，一开始只能走个大概，而后慢慢完善，不断迭代重构，发现优缺点之后更新设计。

**初步搭建测试类**：首先是测试类的编写，StudentTest.java，对应的生产类Student.java，单元测试需要的框架类junit.framework.TestCase。无论是编译还是运行时，都需要设定classpath，来表示路径列表，win中使用分号分隔，Unix中使用冒号分隔，路径可以是JAR文件，其中包含class；在需要加载某一个类的时候，Java就会在给出的classpath中搜索，找到对应的类，实现类的动态加载。

### Student测试运行代码

在basedir中新建StudentTest.java文件

```
public class StudentTest extends junit.framework.TestCase {
  public void testCreate() {
    final String janeName = "Jane";
    Student jane = new Student(janeName);
    assertEquals(janeName, jane.getName());
    Student jack = new Student("Jack");
    assertEquals("Jack", jack.getName());
  }
}
```

生产类Student.java

```
class Student{
  private String name;
  Student(String name) {
    this.name = name;
  }
  String getName() {
    return name;
  }
}
```


在命令行中编译+运行

```
javac -classpath junit.jar StudentTest.java
java -cp .;junit.jar junit.awtui.TestRunner StudentTest
```

使用脚本简化编译运行的步骤，win和unix中的脚本需要准备两套，bin.sh和bin.cmd，后期会使用Ant构建工具来替换，使得构建过程去平台化

```
@echo off
javac -cp <junit.jar path> *.java
if not errorlevel 1 java -cp .;<junit jar path> junit.awtui.TestRunner StudentTest
```

```
#!bin/sh
javac -classpath <junit jar path> *.java
if [$? -eq 0 ]; then
  java -cp *.:<junit jar path> junit.awtui.TestRunner StudentTest
fi
```

### 第1章练习 PawnTest

类似StudentTest测创建和测试，以国际象棋的兵卒为模型

PawnTest.java

```
public class PawnTest extends junit.framework.TestCase {
  public void testCreate() {
    Pawn whitePawn = new Pawn(Pawn.WHITE_COLOR);
    assertEquals(Pawn.WHITE_COLOR, whitePawn.getColor());
    Pawn blackPawn = new Pawn(Pawn.BLACK_COLOR);
    assertEquals(Pawn.BLACK_COLOR, blackPawn.getColor());
  }
}
```

Pawn.java

```
class Pawn{
  public static final String WHITE_COLOR = "white";
  public static final String BLACK_COLOR = "black";
  private String color;
  Pawn(String color){
    this.color = color;
  }
  String getColor() {
    return color;
  }
}
```

# 2 Java基础

需求：1. 学校里的课程CourseSession，保存着这一门课程的信息，教师的信息和上课学生的信息；2. 课程中学生列表需要维护，包括学生参加该课程的操作
