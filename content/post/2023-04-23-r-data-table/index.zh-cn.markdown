---
title: "解决制作R包中data.table::`:=`函数报错问题"
author: "郭猛"
date: "2023-04-23"
slug: "data-table-walrus-in-packages"
aliases:
  - "/2023/04/23/index.zh-cn/"
categories:
  - "R 数据处理"
tags:
  - "R 包开发"
description: "在自己的 R 包中使用 data.table 的 := 时报错的原因和解决方法。"
lastmod: "2023-04-23T22:40:57+08:00"
keywords: []
comment: true
toc: false
autoCollapseToc: false
mathjax: false
---
在制作R包过程中使用了data.table包中的":="函数，但总是报错，今日终于解决。困惑了我一天的问题，chatGPT没给我想要的答案，反倒是谷歌搜出来了！🤣 <!--more-->

具体报错就像下面展示的一样：

![](images/image-275356065.png)

我将同样的报错给了chatGPT和Google，Google给我的答案完美的解决了我的问题：

[![](images/image-2073473184.png)](https://stackoverflow.com/questions/66580872/error-when-loading-r-package-check-that-is-data-tabledt-true)
