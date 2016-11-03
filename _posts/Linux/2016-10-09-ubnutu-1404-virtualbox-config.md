---
layout: post
title:  "Ubuntu 14.04 虚拟机搭建Server"
categories: Linux
tags:  Linux 虚拟机 Ubuntu源
---

* content
{:toc}





### 事前准备

- Virtualbox虚拟机软件安装OK

这里使用的是Windows 10 环境

- UbuntuISO镜像下载

下载地址-网易163的镜像
http://mirrors.163.com/ubuntu-releases/14.04/

Ubnutu Server 14.04版本：没有图形界面

### 手顺要点

#### 新建虚拟机
根据需要设定虚拟机的性能参数

![46495-88498f042a3b1008.png](https://ooo.0o0.ooo/2016/10/09/57fa0324b19e6.png)

网络设置-选择桥接网卡：虚拟机就会被分配一个单独的IP地址

![5A25.tm.png](https://ooo.0o0.ooo/2016/10/09/57fa03a5b39c2.png)

#### 安装系统

注意点：语言一定选择英文，中文有坑，剩下的基本上就是不断的回车和等待

- 有关磁盘分区部分，选择使用整块磁盘即可

- 选择软件包部分，请勾上OpenSSH Server，方便之后使用ssh连接

使用ssh连接本地的虚拟机server可以很方便复制粘贴文本，tab切换也比较省心。

#### 配置国内源

- apt源配置文件

```
cd /etc/apt/

# 备份原来的source.list文件先
sudo source.list source.list.cp

# 接下来编辑文件
sudo vi source.list
```

- 删除source.list内容，替换163源

```
deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse
```

- 更新软件包

```
sudo apt update
sudo apt upgrade
```

国内和国外的源速度不是一个级别的，嗖嗖的。

- 至此Ubuntu基础环境准备完毕，以上。