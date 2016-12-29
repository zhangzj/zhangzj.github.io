---
layout: post
title: "Git实用指南"
categories: Git
excerpt:
tags: Git
---

* content
{:toc}

git基本使用的memo和注意点



### 基本问题

- git的基本使用和基本命令
- 使用git的基本方法和场景，解决什么问题及子问题

### Git的基本使用

#### 基本配置 : git config

三个级别的配置，分别对应三个参数，system，global和默认项目内部
1. /etc/gitconfig 文件: 包含系统上每一个用户及他们仓库的通用配置。 如果使用带有 --system 选项的 git config 时，它会从此文件读写配置变量。
2. ~/.gitconfig 或 ~/.config/git/config 文件：只针对当前用户。 可以传递 --global 选项让 Git 读写此文件。
3. 当前使用仓库的 Git 目录中的 config 文件（就是 .git/config）：针对该仓库。

- 配置git变量信息
```
配置用户名和基本信息
git config --global user.name "name"
git config --global user.email email@email.com
文本编辑器的配置
git config --global core.editor vim
配置信息list
git config --list
```

- 配置命令别名；效果-可以使用 git st 来指代 git status
```
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
```

- 删除对应的key配置
```
git config --unset --global KEY
git config --unset --global alias.st
```

#### 创建初始化版本库 : git init
创建git仓库，可以直接创建初始化，会自动建好文件夹
```
git init gitdemo
```
#### 查看区别 ：git diff
不加参数的diff，比较的两个对象是stage区和工作区的区别；后面跟参数的是比较仓库里面和暂存区区别
```
git diff --cached 或者 git diff --staged
```
#### 移除文件 git rm
TODO：

#### 重置 ：git reset

- git reset --hard HEAD^

	将工作区重置到最近一次提交

- 重置到某一次提交

	git reset --hard 89e67f

#### 检出 ：git checkout

- 作用 ； 重写工作区

- 检出分支

	git checkout branch : 检出到某一个分支

- git checkout -- filename

	用暂存区中的文件覆盖工作区中的文件，就是取消所有没有add的修改

- git checkout branch -- filename

	维持HEAD指向不变，使用branch指向的提交中的filename替换暂存区和工作区中的相应文件，直接覆盖

- git checkout -- . 或者 git checkout .

	取消所有本地工作区中的修改

#### 里程碑 ：git tag

- git tag -m "Say bye-bye to all previous practice." old_practice

	与之前的数据合影留念，取一个合适的名字来记录提交，比如基础版本

- 显示最近的一个Tag

	git describe

#### 创建分支branch
