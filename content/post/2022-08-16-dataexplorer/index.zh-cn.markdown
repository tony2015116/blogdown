---
title: 使用DataExplorer包进行数据探索性分析
author: guoguo
date: '2022-08-16'
slug: index.zh-cn
categories:
  - 数据分析
tags:
  - R
  - 数据探索性分析
  - EDA
  - DataExplorer
lastmod: '2022-08-16T20:54:36+08:00'
keywords: []
description: ''
comment: no
toc: no
autoCollapseToc: no
contentCopyright: no
reward: no
mathjax: no
---

<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />

<p style="text-indent:2em;font-size:;font-family:;">
我使用过DataExplorer包进行过数据探索性分析，对了解数据的基本情况很有帮助。具体操作可以参考 <a href="http://boxuancui.github.io/DataExplorer/articles/dataexplorer-intro.html">DataExplorer reference</a>。
</p>
<!--more-->

``` r
# load packages
library(DataExplorer)
library(tidyverse)
```

#### 1. 数据结构可视化

``` r
plot_str(diamonds)
```

<p align="center">
<img src="images/data_str.png" alt="" width="100%"/>
</p>

#### 2. 数据集介绍

``` r
introduce(diamonds) %>%
  flextable::flextable()
```

<template id="4564744a-ba27-411f-8500-7f5582364682"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
  display: table;
  margin-top: 1.275em;
  margin-bottom: 1.275em;
  border-color: transparent;
}
.tabwid_left table{
  margin-left:0;
}
.tabwid_right table{
  margin-right:0;
}
.tabwid td {
    padding: 0;
}
.tabwid a {
  text-decoration: none;
}
.tabwid thead {
    background-color: transparent;
}
.tabwid tfoot {
    background-color: transparent;
}
.tabwid table tr {
background-color: transparent;
}
</style><div class="tabwid"><style>.cl-e25c3f10{}.cl-e254962a{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-e254be16{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-e254e51c{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-e254e51d{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-e25c3f10'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">rows</span></p></td><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">columns</span></p></td><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">discrete_columns</span></p></td><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">continuous_columns</span></p></td><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">all_missing_columns</span></p></td><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">total_missing_values</span></p></td><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">complete_rows</span></p></td><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">total_observations</span></p></td><td class="cl-e254e51d"><p class="cl-e254be16"><span class="cl-e254962a">memory_usage</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">53,940</span></p></td><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">10</span></p></td><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">3</span></p></td><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">7</span></p></td><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">0</span></p></td><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">0</span></p></td><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">53,940</span></p></td><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">539,400</span></p></td><td class="cl-e254e51c"><p class="cl-e254be16"><span class="cl-e254962a">3,457,760</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="88507c11-9efb-49b1-a73b-0468d5cef394"></div>
<script>
var dest = document.getElementById("88507c11-9efb-49b1-a73b-0468d5cef394");
var template = document.getElementById("4564744a-ba27-411f-8500-7f5582364682");
var caption = template.content.querySelector("caption");
if(caption) {
  caption.style.cssText = "display:block;text-align:center;";
  var newcapt = document.createElement("p");
  newcapt.appendChild(caption)
  dest.parentNode.insertBefore(newcapt, dest.previousSibling);
}
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

``` r
# 对上述介绍可视化
plot_intro(diamonds)
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-4-1.png" width="672" />

``` r
# 缺失值可视化
plot_missing(diamonds)
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-5-1.png" width="672" />

#### 2. 离散型变量分布可视化

``` r
# 对所有离散型变量分布可视化
plot_bar(diamonds)
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-6-1.png" width="768" />

``` r
# 增加with参数，以with参数为横轴
plot_bar(diamonds, with = "price")
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-6-2.png" width="768" />

``` r
# 增加by参数,以by参数分组
plot_bar(diamonds, by = "cut")
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-6-3.png" width="768" />

``` r
plot_bar(diamonds, by = "cut", by_position = "dodge")
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-6-4.png" width="768" />

#### 3. 连续型变量可视化

``` r
plot_histogram(diamonds)
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-7-1.png" width="960" />

#### 4. QQ plot

``` r
plot_qq(diamonds)
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-8-1.png" width="960" />

#### 5. 相关性分析

``` r
# 使用iris数据集
plot_correlation(iris)
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-9-1.png" width="672" />

#### 6. 箱线图

``` r
plot_boxplot(iris, by = "Species")
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-10-1.png" width="768" />

#### 7. 散点图

``` r
plot_scatterplot(iris, by = "Species")
```

<img src="/post/2022-08-16-dataexplorer/index.zh-cn_files/figure-html/unnamed-chunk-11-1.png" width="672" />

#### 8. 生成数据探索性分析报告

``` r
# 具体可以参考DataExplorer reference
create_report(iris)
```
