---
layout: post
title: "Git实用指南"
categories: git
excerpt: 
tags: git
---

* content
{:toc}

git基本使用的memo和注意点



### 基本问题

- 如何使用git？如何优雅地使用git？

### Git的基本使用

#### 基本配置 : git config

- 配置用户名和基本信息

```
git config --global user.name "name"
git config --global user.email email@email.com
```

- 配置命令别名

	可以使用 git st 来指代 git status

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

- 创建git仓库，可以直接创建初始化，会自动建好文件夹

```
git init gitdemo
```

#### 查看区别 ：git diff

- git diff 

	比较的是修改后的文件和版本库中的文件区别
	
	其实没有参数的时候，比较的是工作区和暂存区中为文件的区别

- git diff HEAD
	
	这个命令比较的是工作区和版本库中为文件区别

#### 重置 ：git reset

- git reset --hard HEAD^

	将工作区重置到最近一次提交

- 重置到某一次提交
	
	git reset --hard 89e67f

#### 检出 ：git checkout

- 作用 ； 重写工作区

- 检出分支

	git checkout branch : 检出到某一个分支

- git checkout -- flename

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


