---
title: 在博客中嵌入.html
author: guoguo
date: '2022-08-19'
slug: index.zh-cn
categories:
  - 博客show
tags:
  - markdown
  - .html
lastmod: '2022-08-19T10:55:14+08:00'
keywords: []
description: ''
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: no
reward: yes
mathjax: yes
---

<p style="text-indent:2em;font-size:;font-family:;">
怎么样实现网页套网页并可以可以滚动浏览？今日在 <a href="https://rstudio-conf-2022.github.io/ggplot2-graphic-design/">ggplot2-graphic-design</a> 源代码中get到了我想要的答案🤏。举两个例子，一个是使用<a href="https://rstudio-conf-2022.github.io/ggplot2-graphic-design/">flipbookr</a> 包中的flipbook slides；一个例子是使用自己的网站。
</p>
<!--more-->
<p style="text-indent:2em;font-size:;font-family:;">
</p>

#### 1. 实现方法

-   在Rmarkdown中直接复制粘贴以下代码：

```` rmarkdown
```{=html}
<iframe class="slide-deck" src="https://evamaerey.github.io/flipbookr/minimal_flipbook.html#1" height="405" width="400" style="border: 1px solid #2e3846;"></iframe>
```
````

-   在markdown中添加html block：

``` html
<iframe class="slide-deck" src="https://www.rusersplace.com/about/" height="600" width="700" style="border: 1px solid #2e3846;"></iframe>
```

#### 2. 嵌套.html版的ppt

<iframe class="slide-deck" src="https://evamaerey.github.io/flipbookr/minimal_flipbook.html#1" height="405" width="400" style="border: 1px solid #2e3846;">
</iframe>
<p>
<a href="https://evamaerey.github.io/flipbookr/minimal_flipbook.html#1">View slides in full screen</a>
</p>

#### 3. 嵌套我的博客

<iframe class="slide-deck" src="https://www.rusersplace.com/about/" height="600" width="700" style="border: 1px solid #2e3846;">
</iframe>
