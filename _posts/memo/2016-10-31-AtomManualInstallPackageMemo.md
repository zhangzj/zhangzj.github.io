---
layout: post
title: "手动安装Atom插件"
categories: memo
tags: atom memo
---

* content
{:toc}

手动安装atom的扩展插件，比如minimap等



#### 具体手顺

下载atom插件的源代码后使用npm安装

```
cd ~/.atom/packages
git clone <你想安装的 Package 的仓库链接> # 比如：git clone https://atom.io/packages/emmet
cd <Package 路径> # cd emmet-atom
npm install
```

#### FAQ

**npm的国内配置**

git bash下，在主目录中新建.bash_profile文件，添加alias

```
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"
```

使用cnpm代替npm，指向淘宝镜像
