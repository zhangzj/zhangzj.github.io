---
layout: post
title: Core Java读书笔记-Chapter 7 图形程序设计
categories: Java
description: Java核心技术第一卷读书笔记
tags: Java Java核心技术
---

* content
{:toc}





### Swing概述

一开始的GUI，JAVA自带的类库叫做AWT，Abstract Window Toolkit，抽象窗口工具箱

图形界面在各个平台上的实现有细微的差别，一次编写到处运行，几乎不太现实。

Swing出现了，晓得组件不在使用系统对等的窗体，最大的系统创建，剩下的细节Swing来搞定。

现在开始，Swing是说“被绘制的”用户界面类，AWT是说事件处理这样子的窗口工具箱的底层机制。

Eclipse使用的是和AWT平级的叫做SWT的工具箱

### 创建框架

顶层窗口，就是没有包含在其他窗口中的窗口被称为框架，frame。

Swing中的JFrame扩展自AWT的Frmae，最顶层的窗口细节由系统去关心。

绝大多数Swing中的组件都带有J开头，与AWT里面的Button等类进行区别。

```Java
package simpleFrame;

import java.awt.EventQueue;

import javax.swing.JFrame;

public class SimpleFrameTest {
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				SimpleFrame frame = new SimpleFrame();
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setVisible(true);
			}
		});
	}
}
```

```Java
package simpleFrame;

import javax.swing.JFrame;

class SimpleFrame extends JFrame {
	private static final int DEFAULT_WIDTH = 300;
	private static final int DEFAULT_HEIGHT = 200;

	public SimpleFrame() {
		setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);
	}
}
```
创建一个frame类继承自JFrame，区别仅仅是默认的大小不同，JFrame的默认大小是0x0。

构造器将大小设定成300x200

在SimpleFrameTest类当中，构造一个SimpleFrame对象使其可见。

在Swing程序中，有两点

1. Swing组件必须由事件分派线程，event dispatch thread进行配置，线程将鼠标点击和按键控制转移到用户接口组件。

定义的代码片段将会在事件分派线程中执行。

```Java
EventQueue.invokeLater(new Runnable(){
  public void run(){
    要执行的语句
  }
});
```

2. 定义用户关闭frame的时候响应动作，这里面只要指定简单退出就好

```Java
frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
```

简单构造框架是不会显示frame的，必须设定显示，所以设定setVisible

### 框架定位

JFrame从各个超累里面继承了很多用于处理框架大小和位置的方法

setLocation和setBounds用于设定框架的位置

setIconImage告诉窗口系统的标题栏，任务切换窗口等位置显示哪个图标

setTitle用于改变标题栏的文字

setResizable用布尔值表示窗口大小是不是允许用户改变

坐标原点是左上角0，0

```Java
setLocation(x, y);

setBounds(x, y, width, height);
```

#### 1.frame属性

从继承关系上看，所有的Swing类都是继承自Component类，也就是组件类。

组件类的很多方法都是set，get成对出现的。setTitle和getTitle等等。

布尔类型的get是is开头的
```Java
public boolean isLocationByPlatform();
```

#### 2.确定合适的框架大小

专业的程序来将，应该是检查屏幕的分辨率还设定大小，不然是设定成默认的0x0，那就没什么意思了

得到屏幕的分辨率大小，有几个步骤

1. 调用Toolkit的静态方法获取一个toolkit对象

2. 调用个ScreenSize方法，获取屏幕的大小，返回Dimension对象

3. 获取dimension里面的高度宽度使用

```Java
Toolkit kit = ToolKit.getDefaultToolKit();
Dimension screenSize = kit.getScreenSize();
int screenWidth = screenSize.width;
int screenHeight = screenSize.height;
```

接下来将frame大小设定为宽高的一半，定位到系统的原始点，自后加载图像座位图标icon等等

```Java
setSize(screenWidth/2, screenHeight/2);
setLocationByPlatform(true);

Image img = new ImageIcon("icon.gif").getImage();
setIconImage(img);
```

新建一个sizedFrame的类来穿件Frame对象。

```Java
package simpleFrame;

import java.awt.Dimension;
import java.awt.Toolkit;

import javax.swing.JFrame;

public class SizedFrame extends JFrame {
	public SizedFrame() {
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		Dimension screenSize = toolkit.getScreenSize();
		int screenWidth = screenSize.width;
		int screenHeight = screenSize.height;

		setSize(screenWidth, screenHeight);
		setLocationByPlatform(true);

	}
}
```

### 在组件中显示信息

将一个组件放置在Frame当中，之后再组件上显示文字。

JFrame的框架层次，从后到前依次是Frame，根窗格，层级窗格，菜单栏，内容窗格，玻璃窗格。

Swing程序员最关心的是内容窗格，用代码将组件添加到窗格里面。

```Java
Container contentPane = frame.getContentPane();
Component c = ...;
contentPane.add(c);
```

定制一个组件添加到Frame上面，需要继承JComponent类，并且覆盖其中的paintComponent方法。

paintComponent方法有一个Graphics类型的参数，这个参数保存用于绘制内容的字体，颜色等等。

在Java中，所有的绘制都必须使用Graphics对象，其中包含了绘制图案，图像，和文本的方法。

创建自定义的组件

```Java
class MyComponent extends JComponent{
  public void paintComponent(Graphics g){
    code for drawing
  }
}
```

无论什么原因，只要串口重新绘图，事件处理器就会通告组件，引发所有组件执行paintComponent方法。

一定不要自己调用paintComponent方法，这个方法会自动被调用。窗口大小变化的时候就触发重新绘制。强制重新刷新屏幕，就调用repaint方法。

显示文本是特殊的绘图，graphics类当中有方法，制定绘制的内容和位置。g.drawString(text, x, y);

组件本身的也需要告诉frame自己有多大，覆盖getPreferredSize方法来返回一个Dimension对象。

在Frame里面填入一个或者多个组件的时候，如果只想使用首选大小，可以调用pack方法，而不是setSize方法。

```Java
class NotHelloWorldFrame extends JFrame{
  public NotHelloWorldFrame(){
    add(new NotHelloWorldComponent());
    pack();
  }
}

class NotHelloWorldComponent extends JComponent{
  public static final int MESSAGE_X = 75;
  public static final int MESSAGE_Y = 100;

  private static final int DEFAULT_WIDTH = 300;
  private static final int DEFAULT_HEIGHT = 200;

  public void paintComponent(Graphics g){
    g.drawString("Not a Hello, World program", MESSAGE_X, MESSAGE_Y);
  }

  public Dimension getPreferredSize(){
    return new Dimension(DEFAULT_WIDTH, DEFAULT_HEIGHT);
  }
}
```

### 处理2D图形

Java 2D库，图形操作。要使用2D库就要一个Graphics2D类的对象，这个2D类是Graphics的子类。paintComponent方法会自动获得这个对象，只是需要进行转换。

```Java
public void paintComponent(Graphics g){
  Graphics2D g2 = (Graphics2D) g;
}
```

Java 2D库采用面向对象的方式将几何图形组织起来，包含描述直线，矩形和椭圆的类。
Line2D，Rectangle2D，Ellipse2D。这些类都实现了Shape接口。

绘制图形，首先创建一个实现了Shape接口的对象，之后调用Graphics2D类中的draw方法。

```Java
Rectangle2D rect = ...;
g2.draw(rect);
```

主要是画一个几何图形的样子

```Java
package draw;

import java.awt.EventQueue;

import javax.swing.JFrame;

public class DrawTest {
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				JFrame frame = new DrawFrame();
				frame.setTitle("DrawTest");
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.setVisible(true);
			}
		});
	}
}

---------------------

package draw;

import javax.swing.JFrame;

public class DrawFrame extends JFrame {

	public DrawFrame() {
		add(new DrawComponent());
		pack();
	}
}

----------------------

package draw;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;

import javax.swing.JComponent;

public class DrawComponent extends JComponent {
	private static final int DEFAULT_WIDTH = 400;
	private static final int DEFAULT_HEIGHT = 400;

	public void paintComponent(Graphics g) {
		Graphics2D graphics2d = (Graphics2D) g;

		double leftX = 100;
		double topY = 100;
		double width = 200;
		double height = 150;

		Rectangle2D rectangle2d = new Rectangle2D.Double(leftX, topY, width, height);
		graphics2d.draw(rectangle2d);
	}

	public Dimension getPreferredSize() {
		return new Dimension(DEFAULT_WIDTH, DEFAULT_HEIGHT);
	}
}

```


### 使用颜色

### 文本使用特殊字体

### 显示图像



undone
