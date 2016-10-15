---
layout: post
title: "MySQLworkbench连接可能会遇到的问题"
categories: MySQL
tags: MySQL memo
---

* content
{:toc}

MySQL连接配置过程当中的Error记录
- Lost Connection
- Host not allowed 




### 事前准备

- Ubuntu1404基础环境搭建OK

- 更换源（可选）

- MySQL安装OK（默认没有密码）
```
sudo apt install mysql-server
```

### 设置连接

- 使用MySQl官方WorkBench

![连接设定](http://ww3.sinaimg.cn/large/8d6a2535gw1f8mxwut25zj20oe0gbtcp.jpg)

### Lost Connection 错误

#### 报错信息

![报错信息](http://ww4.sinaimg.cn/large/8d6a2535gw1f8n4bykymnj209t05jdgv.jpg)

百度一下：Lost connection to MySQL server at ‘reading initial communication packet', system error: 0

猜测原因是mysql绑定的是环回地址，需要修改mysql的配置文件my.cnf


#### 解决
```
sudo vi /etc/mysql/my.cnf
```

```
# 注释掉绑定地址的那一行
# bind-address = 127.0.0.1
```

### Host not allowed 错误

#### 报错信息

![报错信息](http://ww2.sinaimg.cn/large/8d6a2535gw1f8n4cv9034j209x05idgt.jpg)

看上去是因为不允许本机ip链接mysql引起的错误

#### 解决

- 直接修改mysql数据库中的用户表

```
$ mysql -u root

mysql> use mysql;

mysql> select host, user from user;

mysql> update user set host = '%' where user = 'root' and host = 'localhost'
```

![更新user表](http://ww1.sinaimg.cn/large/8d6a2535gw1f8myfqqvd3j20k60ce76v.jpg)

- 重启mysql服务

```
mysql> exit

$ sudo /etc/init.d/mysql restart
```

- Test Connection

![Done](http://ww3.sinaimg.cn/large/8d6a2535gw1f8n4eaw7krj20at07nq41.jpg)

### 小结

两个问题其实都是MySQl的配置引起的，还有其他的解决方法。第二个报错还可以使用授权法来解决，但是直接Update表更暴力

MySQL没有密码，任何主机都可以连接，基本就不考虑安全了。
