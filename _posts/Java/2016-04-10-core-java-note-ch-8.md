---
layout: post
title: Core Java读书笔记-Chapter 8 事件处理
categories: Java
description: Java核心技术第一卷读书笔记
tags: Java Java核心技术
---

* content
{:toc}





实现用户界面，必须明白Java事件处理的基本方法。接下去是，Java AWT事件模型的工作机制，从中看到如何捕获用户界面组件和输入设备产生的事件。还有如何更加结构化的方式处理动作，actions，事件。

### 事件处理基础

任何支持GUI的操作环境都要不断监视按键或者鼠标点击这样的事件。

事件过程，也就是事件和代码之间的对应关系，对相关的事件编写特定的代码。

事件源，event source，到事件监听器，event listener。事件委托模型，event delegation model。

面向对象，将事件相关的信息封装在事件对象，event object。

AWT事件处理机制概要：

* 监听器对象是一个实现了特定监听器接口，listener interface的类的实例

* 事件源是一个能够注册监听器对象并发送事件对象的对象

* 当事件发生时，事件源将事件对象传递给所有注册的监听器

* 监听器对象将利用事件对象中的信息决定如何对事件作出响应

监听器的实例

```Java
ActionListener listner = ...;
JButton button = new JButton("OK");
button.addActionListener(listener);
```

现在只要产生一个动作事件，事件监听器就会收到通告，按钮的话，那就是点击到了。

```Java
class MyListener implements ActionListener {
	...
	public void actionPerformer(ActionEvent event){
		...
	}
}
```

#### 1.实例：处理按钮点击事件

点击按钮改变背景panel的颜色，首先创建按钮，传输标签字符串或者图标，或者两个都传入，就可以构造一个button出来。

之后使用panel的add方法将button添加到panel当中。

然后帮button添加action方法。

action方法需要实现actionlistener接口。


```Java
package button;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class ButtonFrame extends JFrame {

	private JPanel buttonPanel;
	private static final int DEFAULT_WIDTH = 300;
	private static final int DEFAULT_HEIGHT = 200;

	public ButtonFrame() {
		setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);

		// create buttons
		JButton yellowButton = new JButton("Yellow");
		JButton blueButton = new JButton("Blue");
		JButton redButton = new JButton("Red");

		buttonPanel = new JPanel();

		// add buttons to panel
		buttonPanel.add(yellowButton);
		buttonPanel.add(blueButton);
		buttonPanel.add(redButton);

		// add panel to frame
		add(buttonPanel);

		// create button actions
		ColorAction yellowAction = new ColorAction(Color.YELLOW);
		ColorAction blueAction = new ColorAction(Color.BLUE);
		ColorAction redAction = new ColorAction(Color.RED);

		// associate actions with buttons
		yellowButton.addActionListener(yellowAction);
		blueButton.addActionListener(blueAction);
		redButton.addActionListener(redAction);
	}

	/**
	 * An action listener that sets the panel's background color.
	 */
	private class ColorAction implements ActionListener {
		private Color backgroundColor;

		public ColorAction(Color c) {
			backgroundColor = c;
		}

		public void actionPerformed(ActionEvent event) {
			buttonPanel.setBackground(backgroundColor);
		}
	}
}

```

#### 2.建议使用内部类

上面三个button对象共享了一个监听器类，但是分贝使用不同的监听器对象。

使用匿名内部类简化代码的话，注意，其实每一个button的处理过程都是一样的

1. 用标签字符串构造按钮

2. 将按钮添加到panel上

3. 用对应颜色构造一个ActionListener

4. 添加ActionListener

可以使用辅助的方法实现

```Java
public void makeButton(String name, Color backgroundColor){
	JButton button = new JButton(name);
	buttonPanel.add(button);
	ColorAction action = ColorAction(backgroundColor);
	button.addActionListener(action);
}
```

之后就可以简化调用

```Java
makeButton("Yellow", Color.Yellow);
makeButton("Blue", Color.Blue);
makeButton("Red", Color.RED);
```

然后可以进一步简化，ColorAction类只是在makeButton方法是使用一次，所以可以用匿名类实现。

```Java
public void makeButton(String name, Color backgroundColor){
	JButton button = new JButton(name);
	buttonPanel.add(button);
	button.addActionListener(new ActionListener(){
		public void actionPerformed(ActionEvent event){
			buttonPanel.setBackground(backgroundColor);
		}
	});
}
```

如果实在不喜欢内部类，也可以实现将自己的容器称为监听器，实现ActionListener的接口。

```Java
yellowButton.addActionListener(this);
blueButton.addActionListener(this);
redButton.addActionListener(this);
```

这样做的话就要根据不同的事件来源分配代码，显得有些杂乱。

#### 3.创建包含一个方法调用的监听器

比如一个loadButton的按钮，添加一个监听器可以包含方法调用

#### 4.实例：改变观感

Swing的默认观感是Metal观感。有两种方式改变观感。一个是配置文件，java安装的子目录jre/lib/swing.properties。在这个文件中，将属性swing.defaultlaf改成所希望的观感类名。

swing.defaultlaf=con.sun.java.swing.plaf.motif.MotifLookAndFeel

每一个平台的观感改变不相同，建议不要静态改变，还要重启程序等等。

第二种是动态改变，需要调用静态的UIManager.setLookAndFeel，提供想要的观感名字。然后再调用静态方法SwingUtilities.updateComponentTreeUI来刷新全部的组件集合。




### 动作

多个动作可以指向一个事件监听器，这样子实现一个工作的方式就有多种，点击一个按钮可以，菜单配置可以，快捷键也可以。无论是哪种方式下达命令，实现的效果都是一样的。

Swing的动作实现机制是一个借口Action。Action封装了一些对象。

- 命令的说明（一个文本字符串和一个图标）
- 执行命令所需要的参数

Action接口包含下面的方法；

```Java
// 熟悉的ActionListener接口中的方法，实际上ActionListener接口扩展自ActionListener
void actionPerformed(ActionEvent)

// 允许启用或者禁用这个动作，检查这个动作当前是不是可用
void setEnabled(boolean b)
boolean isEnabled()

//允许存储或者检索动作对象中的任意键值，预定义的有Action.NAME和Action.SMALL_ICON
void putValue(String key, Object value)
Object getValue(String key)

// 让其他对象在动作对象的属性发生变化时得到通告，尤其是菜单或是工具栏触发的动作。
void addPropertyChangeListener(PropertyChangeListener listener)
void removePropertyChangeListener(PropertyChangeListener listenr)
```

**预定义的Action键值表**

|键|值|
|-|-|
|NAME|动作名称，显示在按钮和菜单上|
|SMAL_ICON|存储小图标的地方：显示在按钮，菜单项或工具栏中|
|SHORT_DESCRIPTION|图标的简要说明：显示在工具提示中|
|LONG_DESCRIPTION|图标的详细说明：使用在在线帮助中。没有Swing组件使用这个值|
|MNEMONIC_KEY|快捷键缩写：显示在菜单项中|
|ACCELERATOR_KEY|存储加速击键的地方：Swing组件不使用这个值|
|ACTION_COMMAND_KEY|历史遗留：仅在旧版本的registerKeyboardAction方法中使用|
|DEFAULT|常用的综合属性：Swing组件不使用这个值|

Action作为接口，实现接口必须实现所有方法才可以。还好有个一个类实现了除了actionPerformed之外的素有方法，就是抽象类AbstractAction，可以再慧姐扩展这个类，然后实现actionPerformed方法。

```Java
public class ColorAction extends AbstractAction{
	public ColorAction(String name, Icon icon, Color c){
		putValue(Action.NAME, name);
		putValue(Action.SMALL_ICON, icon);
		putValue("color", c);
		putValue(Action.SHORT_DESCRIPTION, "Set panel color to " + name.toLowerCase());
	}

	public void actionPerformed(ActionEvent event){
		Color c = (Color) getValue("color");
		buttonPanel.setBackground(c);
	}
}
```

### 鼠标事件

只是点击按钮或者菜单项的话，用不着特地处理鼠标事件。但是画图啦，拖动，捕获鼠标点击之类的，那就要特别对待了。

### AWT事件继承层次

Java事件处理采用的是面向对象的方法，所有的时间都是由java.util包中的EventObject扩展而来的。EventObject类有一个子类AWTEvent，他是所有AWT事件类的父类。

事件对象封装了事件源与监听器彼此通信的事件信息。
