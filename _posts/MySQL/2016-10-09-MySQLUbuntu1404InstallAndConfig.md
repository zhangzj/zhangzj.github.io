---
layout: post
title: "Ubuntu1404搭建MySQL本地测试环境"
categories: MySQL
tags: MySQL Ubuntu Linux 
---

* content
{:toc}
虚拟机搭建MySQL Server




### 事前准备

- Ubuntu1404基础环境搭建OK

- 更换源（可选）

### 安装MySQL Server

```
sudo apt install mysql-server
```
![apt安装mysql](http://ww3.sinaimg.cn/large/8d6a2535jw1f8mdje8gnoj20ya0k87h9.jpg)

#### 安装中的注意点

- root密码可以不设置，访问时候就不需要password，留空下一步即可

![](http://ww2.sinaimg.cn/large/8d6a2535jw1f8mdlwctadj20xa0ccadf.jpg)

Tips:期间会跳出多次这个对话框

#### ssh访问连接

无密码打开mysql连接

```
mysql -u root
```
![mysql -u root](http://ww1.sinaimg.cn/large/8d6a2535jw1f8mdoicroqj20yy0de0yi.jpg)

#### 本机远程访问

- mysql client访问，这里我们使用sequel pro，配置方法都是类似的
	
![sequel pro config](http://ww1.sinaimg.cn/large/8d6a2535jw1f8mec8fs2rj20oo0ty78v.jpg)


- 一个可用的mysqlserver配置完毕
