---
title: 折腾R和Rstudio
author: guoguo
date: '2022-12-24'
slug: index.zh-cn
categories:
  - 生活记录
  - R
tags:
  - Rstudio
lastmod: '2022-12-24T23:16:16+08:00'
keywords: []
description: ''
comment: no
toc: no
autoCollapseToc: no
contentCopyright: no
reward: yes
mathjax: no
---

<p style="text-indent:2em;font-size:;font-family:;">
最近Rstudio有新版本，不知道什么时候自动给我更新了🤣。我的R版本还是4.1的，只是懒得折腾，就只更新了R包。上个版本的Rstudio安装路径有些问题。导致现在使用Rstudio问题集中出现了~Tab键补全路径有问题，无法识别中文路径和中文文件名。在网上搜了几个小时都没有解决。压下怕麻烦的想法，一狠心，把Rstudio、R、Rtools都卸载了重新安装（你也可以哟）。现在使用起来终于变得正常了。我装的R包太多，不可能一下子都装回来，只能用到什么装什么了。这里我附上一个我常用的R包列表，方便下次重新安装后安装R包。
</p>

<!--more-->

<p style="text-indent:2em;font-size:;font-family:;">
下面列表中前三个R包都数据“verse”包，下载安装一个包就等于下载了一系列包。有些包是暂行用不到，等用到再往上加。
</p>

| 最常用的R包 |     备注      |
|:-----------:|:-------------:|
|  tidyverse  |   数据处理    |
| tidymodels  |   机器学习    |
|  easystats  | 数据处理+统计 |
|     rio     |   数据读取    |
|   janitor   |   数据处理    |
|    lme4     | 混合线性模型  |
