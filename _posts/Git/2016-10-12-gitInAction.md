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
没有参数就是当前目录转换成一个版本控制仓库
git init
创建文件夹gitdemo成为一个仓库
git init gitdemo
```
#### 添加文件变化 git add
```
git add <file>
git add <directory>
```
#### 提交缓存区到仓库版本 git commit
```
git commit -m "<message>"
```
#### 查看当前工作区的状态 git status
这个状态是工作区中的状况，不包含已经提交的东西
#### 查看已经提交的快照和提交历史 git log
```
git log -n <limit>
用<limit>限制提交的数量。比如git log -n 3只会显示3个提交。
git log --oneline
将每个提交压缩到一行。当你需要查看项目历史的上层情况时这会很有用。
git log --stat
除了git log信息之外，包含哪些文件被更改了，以及每个文件相对的增删行数。
git log -p
显示代表每个提交的一堆信息。显示每个提交全部的差异(diff)，这也是项目历史中最详细的视图。
git log --author="<pattern>"
搜索特定作者的提交。<pattern>可以是字符串或正则表达式。
git log --grep="<pattern>"
搜索提交信息匹配特定<pattern>的提交。<pattern>可以是字符串或正则表达式。
git log <since>..<until>
只显示发生在<since>和<until>之间的提交。两个参数可以是提交ID、分支名、HEAD或是任何一种引用。
git log <file>
只显示包含特定文件的提交。查找特定文件的历史这样做会很方便。
git log --graph --decorate --oneline
--graph标记会绘制一幅字符组成的图形，左边是提交，右边是提交信息。--decorate标记会加上提交所在的分支名称和标签。--oneline标记将提交信息显示在同一行，一目了然。
```
#### 查看区别 ：git diff
不加参数的diff，比较的两个对象是stage区和工作区的区别；后面跟参数的是比较仓库里面和暂存区区别
```
git diff --cached 或者 git diff --staged
```
#### 移除文件 git rm
命令作用是从工作区或者仓库中删除对应的文件
```
git rm [-f | --force] [-n] [-r] [--cached] [--ignore-unmatch] [--quiet] [--] <files>
```
#### 重置 ：git reset
不带任何参数的话是重置工作区，到最近一次的提交，也就是HEAD
```
git reset --hard HEAD^
git reset [--soft | --mixed [-N] | --hard | --merge | --keep] [-q] [<commit>]
```
关于soft，merge，hard等等几个模式：
reset命令会把仓库重置到某一次提交，获取是head，某个commit；默认的模式参数是--mixed
soft：所有的commit之后的改动都被保留到stage，等待被提交，但是仓库里面是在指定的commit
mixed：commit之后的修改都在工作区，标记成修改
hard：抛弃所有commit之后的修改
#### 检出 ：git checkout
`git checkout`这个命令有三个不同的作用：检出文件、检出提交和检出分支。在这一章中
，我们只关心前两种用法。

检出提交会使工作目录和这个提交完全匹配。你可以用它来查看项目之前的状态，而不改变当前的状态。检出文件使你能够查看某个特定文件的旧版本，而工作目录中剩下的文件不变
```
git checkout <commit> <file>
查看文件之前的版本。它将工作目录中的<file>文件变成<commit>中那个文件的拷贝，并将它加入缓存区。
git checkout <commit>
更新工作目录中的所有文件，使得和某个特定提交中的文件一致。你可以将提交的哈希字串，或是标签作为<commit>参数。这会使你处在分离HEAD的状态。
检出到某一个分支
git checkout <branch>
git checkout -- filename
用暂存区中的文件覆盖工作区中的文件，就是取消所有没有add的修改
git checkout branch -- filename
维持HEAD指向不变，使用branch指向的提交中的filename替换暂存区和工作区中的相应文件，直接覆盖
git checkout -- . 或者 git checkout .
取消所有本地工作区中的修改
```
#### 回滚之前的提交 git revert
生成一个新的提交来撤销之前提交的所有操作修改，保留commit的历史
```
git revert <commit>
生成一个撤消了<commit>引入的修改的新提交，然后应用到当前分支。
```
##### 撤销(revert)和重设(reset)对比
理解这一点很重要——git revert回滚了『单独一个提交』——它没有移除后面的提交，然后回到项目之前的状态。在Git中，后者实际上被称为reset，而不是revert。
#### 移除没有跟踪的文件 git clean
```
git clean -n
执行一次git clean的『演习』。它会告诉你那些文件在命令执行后会被移除，而不是真的删除它。
git clean -f
移除当前目录下未被跟踪的文件。-f(强制)标记是必需的，除非clean.requireForce配置项被设为了false (默认为true)。它 不会 删除 .gitignore中指定的未跟踪的文件。
git clean -f <path>
移除未跟踪的文件，但限制在某个路径下。
git clean -df
移除未跟踪的文件，以及目录。
git clean -xf
移除当前目录下未跟踪的文件，以及Git一般忽略的文件。

```
#### 修改项目历史 git rebase
将分支移到一个新的基提交的过程
```
git rebase <base>
将当前分支rebase到<base>，这里可以是任何类型的提交引用（ID、分支名、标签，或是HEAD的相对引用）。
```
feature在开发中的时候，master有新的更新commit，想要基于最新的master，也就是改变feature的基础，rebase
#### 远程仓库链接 git remote
git remote命令允许你创建、查看和删除和其它仓库之间的连接。远程连接更像是书签，而不是直接跳转到其他仓库的链接。它用方便记住的别名引用不那么方便记住的URL，而不是提供其他仓库的实时连接。
```
git remote
列出你和其他仓库之间的远程连接。
git remote -v
和上个命令相同，但同时显示每个连接的URL。
git remote add <name> <url>
创建一个新的远程仓库连接。在添加之后，你可以将作为便捷的别名在其他Git命令中使用。
git remote rm <name>
移除名为的远程仓库的连接。
git remote rename <old-name> <new-name>
将远程连接从重命名为。
```
#### 里程碑 ：git tag

- git tag -m "Say bye-bye to all previous practice." old_practice

	与之前的数据合影留念，取一个合适的名字来记录提交，比如基础版本

- 显示最近的一个Tag

	git describe

#### 创建分支branch
