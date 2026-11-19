---
title: "R 里做描述性统计：5 个包怎么选"
author: "郭猛"
date: "2022-08-05"
slug: "descriptive-stats-packages"
aliases:
  - "/2022/08/05/index.zh-cn/"
  - "/2022/08/05/gtsummary-descriptive-stats/"
  - "/2022/08/06/index.zh-cn/"
  - "/2022/08/06/rstatix-descriptive-stats/"
  - "/2022/08/08/index.zh-cn/"
  - "/2022/08/08/skimr-descriptive-stats/"
  - "/2022/08/14/index.zh-cn/"
  - "/2022/08/14/crosstable-descriptive-stats/"
  - "/2022/09/02/index.zh-cn/"
  - "/2022/09/02/gtextras-descriptive-stats/"
categories:
  - "统计与表格"
tags:
  - "描述性统计"
  - "表格"
  - "gtExtras"
description: "比较 rstatix、skimr、gtsummary、crosstable、gtExtras 五个描述性统计包的用法和适用场景。"
lastmod: "2026-11-19"
keywords: []
comment: true
toc: false
autoCollapseToc: false
mathjax: false
---
做数据分析时，几乎每次都要先算一遍样本量、均值、标准差这些基本统计量。R 里能做这件事的包很多，我先后用过 5 个，这里放在一起比较，方便按场景挑选。示例都用 R 自带的 `iris` 数据集。

<!--more-->

| 包 | 适合场景 | 结果形式 |
| --- | --- | --- |
| rstatix | 分组计算统计量，结果还要继续处理 | 数据框 |
| skimr | 拿到新数据时快速看一眼整体情况 | 摘要 / 数据框 |
| gtsummary | 报告或论文用的表格，可导出图片 | gt / flextable 表格 |
| crosstable | 需要把结果交成 Word 文件 | flextable 表格、docx |
| gtExtras | 汇报用的表格，表内带分布图 | gt 表格、png |


## 1. rstatix：最常用的分组统计

<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />

rstatix是我最常使用的R包了。主要使用其中的get\_summary\_stats函数对数据集做一个描述性统计。具体使用可以参考 <a href="https://rpkgs.datanovia.com/rstatix/reference/index.html">rstatix reference</a>。

``` r
# load packages
library(tidyverse)
library(rstatix)
library(flextable)

test <- iris %>%
  pivot_longer(-5, names_to = "Types", values_to = "Values") %>%
  group_by(Species, Types) %>%
  rstatix::get_summary_stats(Values, type = "common") 

# output as html type in markdown
test %>%
  flextable::flextable()
```

<template id="51d8ac11-b0f9-4821-be7b-93d098da4340"><style>
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
</style><div class="tabwid"><style>.cl-3c5291fe{}.cl-3c4726c0{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-3c474dbc{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-3c474dbd{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-3c479ba0{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-3c479ba1{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-3c479ba2{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-3c479ba3{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-3c479ba4{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-3c479ba5{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-3c5291fe'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba4"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Species</span></p></td><td class="cl-3c479ba4"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Types</span></p></td><td class="cl-3c479ba4"><p class="cl-3c474dbc"><span class="cl-3c4726c0">variable</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">n</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">min</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">max</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">median</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">iqr</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">mean</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">sd</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">se</span></p></td><td class="cl-3c479ba5"><p class="cl-3c474dbd"><span class="cl-3c4726c0">ci</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">setosa</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Petal.Length</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.0</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.9</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.175</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.462</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.174</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.025</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.049</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">setosa</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Petal.Width</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.1</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.6</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.20</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.100</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.246</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.105</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.015</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.030</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">setosa</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Sepal.Length</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">4.3</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">5.8</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">5.00</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.400</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">5.006</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.352</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.050</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.100</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">setosa</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Sepal.Width</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.3</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">4.4</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">3.40</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.475</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">3.428</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.379</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.054</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.108</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">versicolor</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Petal.Length</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">3.0</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">5.1</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">4.35</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.600</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">4.260</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.470</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.066</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.134</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">versicolor</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Petal.Width</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.0</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.8</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.30</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.300</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.326</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.198</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.028</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.056</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">versicolor</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Sepal.Length</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">4.9</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">7.0</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">5.90</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.700</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">5.936</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.516</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.073</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.147</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">versicolor</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Sepal.Width</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.0</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">3.4</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.80</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.475</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.770</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.314</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.044</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.089</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">virginica</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Petal.Length</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">4.5</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">6.9</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">5.55</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.775</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">5.552</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.552</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.078</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.157</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">virginica</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Petal.Width</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">1.4</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.5</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.00</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.500</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.026</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.275</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.039</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.078</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">virginica</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Sepal.Length</span></p></td><td class="cl-3c479ba1"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">4.9</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">7.9</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">6.50</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.675</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">6.588</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.636</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.090</span></p></td><td class="cl-3c479ba0"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.181</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-3c479ba3"><p class="cl-3c474dbc"><span class="cl-3c4726c0">virginica</span></p></td><td class="cl-3c479ba3"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Sepal.Width</span></p></td><td class="cl-3c479ba3"><p class="cl-3c474dbc"><span class="cl-3c4726c0">Values</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">50</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.2</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">3.8</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">3.00</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.375</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">2.974</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.322</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.046</span></p></td><td class="cl-3c479ba2"><p class="cl-3c474dbd"><span class="cl-3c4726c0">0.092</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="fd15845c-ae6b-4b52-b9c6-d8a0ef3414fc"></div>
<script>
var dest = document.getElementById("fd15845c-ae6b-4b52-b9c6-d8a0ef3414fc");
var template = document.getElementById("51d8ac11-b0f9-4821-be7b-93d098da4340");
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

## 2. skimr：快速浏览整份数据

<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />

skimr是一个比较方便汇总数据数据的R包。使用非常简单，具体使用可以参考 <a href="https://docs.ropensci.org/skimr/reference/index.html">skimr reference</a>。

``` r
# load packages
library(tidyverse)
library(skimr)
library(flextable)

# 受限于网站主题，输出格式不是很友好
skimr::skim(iris)
```

|                                                  |      |
|:-------------------------------------------------|:-----|
| Name                                             | iris |
| Number of rows                                   | 150  |
| Number of columns                                | 5    |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |      |
| Column type frequency:                           |      |
| factor                                           | 1    |
| numeric                                          | 4    |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |      |
| Group variables                                  | None |

Table 1: Data summary

**Variable type: factor**

| skim\_variable | n\_missing | complete\_rate | ordered | n\_unique | top\_counts               |
|:---------------|-----------:|---------------:|:--------|----------:|:--------------------------|
| Species        |          0 |              1 | FALSE   |         3 | set: 50, ver: 50, vir: 50 |

**Variable type: numeric**

| skim\_variable | n\_missing | complete\_rate | mean |   sd |  p0 | p25 |  p50 | p75 | p100 | hist  |
|:---------------|-----------:|---------------:|-----:|-----:|----:|----:|-----:|----:|-----:|:------|
| Sepal.Length   |          0 |              1 | 5.84 | 0.83 | 4.3 | 5.1 | 5.80 | 6.4 |  7.9 | ▆▇▇▅▂ |
| Sepal.Width    |          0 |              1 | 3.06 | 0.44 | 2.0 | 2.8 | 3.00 | 3.3 |  4.4 | ▁▆▇▂▁ |
| Petal.Length   |          0 |              1 | 3.76 | 1.77 | 1.0 | 1.6 | 4.35 | 5.1 |  6.9 | ▇▁▆▇▂ |
| Petal.Width    |          0 |              1 | 1.20 | 0.76 | 0.1 | 0.3 | 1.30 | 1.8 |  2.5 | ▇▁▇▅▃ |

``` r
# 使用.html格式输出，将所有结果都汇总到了一个表上，缺乏了美感
skim(iris) %>% 
  flextable::flextable()
```

<template id="cc0a72b4-5277-4997-a226-0deb7aba4193"><style>
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
</style><div class="tabwid"><style>.cl-67554abe{}.cl-674d0a02{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-674d39a0{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-674d39a1{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-674d7fe6{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-674d7fe7{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-674d7fe8{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-674d7fe9{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-674d7fea{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-674d7feb{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-67554abe'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-674d7feb"><p class="cl-674d39a0"><span class="cl-674d0a02">skim_type</span></p></td><td class="cl-674d7feb"><p class="cl-674d39a0"><span class="cl-674d0a02">skim_variable</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">n_missing</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">complete_rate</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">factor.ordered</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">factor.n_unique</span></p></td><td class="cl-674d7feb"><p class="cl-674d39a0"><span class="cl-674d0a02">factor.top_counts</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">numeric.mean</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">numeric.sd</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">numeric.p0</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">numeric.p25</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">numeric.p50</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">numeric.p75</span></p></td><td class="cl-674d7fea"><p class="cl-674d39a1"><span class="cl-674d0a02">numeric.p100</span></p></td><td class="cl-674d7feb"><p class="cl-674d39a0"><span class="cl-674d0a02">numeric.hist</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">factor</span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">Species</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">0</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">1</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">FALSE</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">3</span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">set: 50, ver: 50, vir: 50</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02"></span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">numeric</span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">Sepal.Length</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">0</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">1</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">5.843333</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">0.8280661</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">4.3</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">5.1</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">5.80</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">6.4</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">7.9</span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">▆▇▇▅▂</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">numeric</span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">Sepal.Width</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">0</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">1</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">3.057333</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">0.4358663</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">2.0</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">2.8</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">3.00</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">3.3</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">4.4</span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">▁▆▇▂▁</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">numeric</span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">Petal.Length</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">0</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">1</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">3.758000</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">1.7652982</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">1.0</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">1.6</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">4.35</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">5.1</span></p></td><td class="cl-674d7fe6"><p class="cl-674d39a1"><span class="cl-674d0a02">6.9</span></p></td><td class="cl-674d7fe7"><p class="cl-674d39a0"><span class="cl-674d0a02">▇▁▆▇▂</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-674d7fe8"><p class="cl-674d39a0"><span class="cl-674d0a02">numeric</span></p></td><td class="cl-674d7fe8"><p class="cl-674d39a0"><span class="cl-674d0a02">Petal.Width</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">0</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">1</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe8"><p class="cl-674d39a0"><span class="cl-674d0a02"></span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">1.199333</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">0.7622377</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">0.1</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">0.3</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">1.30</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">1.8</span></p></td><td class="cl-674d7fe9"><p class="cl-674d39a1"><span class="cl-674d0a02">2.5</span></p></td><td class="cl-674d7fe8"><p class="cl-674d39a0"><span class="cl-674d0a02">▇▁▇▅▃</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="27d9de97-891e-4a8f-be05-5f0d13e1f5c2"></div>
<script>
var dest = document.getElementById("27d9de97-891e-4a8f-be05-5f0d13e1f5c2");
var template = document.getElementById("cc0a72b4-5277-4997-a226-0deb7aba4193");
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

## 3. gtsummary：直接生成报告表格

<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />

工作中经常遇到统计一些如数量、平均值、中位数、标准差等一些基本的统计量，通常会在R中试用summarise等函数统计好后导出到excel中，然后再在excel中整理美化表格，这种方式是比较麻烦的。简单一些的是通过一些R包将结果输出为html格式，然后截图。还比较少有R包可以将html格式的储存为图片格式的R包，但gtsummary包就是其中一个（其它的类似R包比较少见）集合统计和导出图片还可以设定图片主题的强大R包。

gtsummary包中很多函数。刚接触，所以使用的比较少。但我相信后面会使用的多起来，我比较喜欢的是可以导出图片格式。详细的介绍可以看 <a href="https://www.danieldsjoberg.com/gtsummary/index.html">gtsummary reference</a>。

``` r
# load package
library(tidyverse)
library(gtsummary)
library(gt)

test <- iris %>%
  tbl_summary(by = Species, missing = "no",
              statistic = list(all_continuous() ~ "{mean}±{sd}", 
                               #all_continuous() ~ c("{median} ({p25}, {p75})", "{min}, {max}")
                               all_categorical() ~ "{n} ({p}%)")) 

# output as html type in markdown
test %>%
  as_flex_table()
```

<template id="335f2bd2-724c-41be-816a-0def4a490d5d"><style>
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
</style><div class="tabwid"><style>.cl-bac5ae8c{}.cl-baa0d29c{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-baa0d29d{font-family:'Arial';font-size:6.6pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;position: relative;bottom:3.3pt;}.cl-baa1477c{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:2pt;padding-top:2pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-baa1477d{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:2pt;padding-top:2pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-baa1477e{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-baa1477f{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-baa14780{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-baa27f16{width:87.8pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f17{width:91.8pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f18{width:106.4pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f19{width:99.7pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f1a{width:91.8pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f1b{width:87.8pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f1c{width:99.7pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f1d{width:106.4pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f1e{width:91.8pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f1f{width:87.8pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa27f20{width:99.7pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a612{width:106.4pt;background-color:transparent;vertical-align: top;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a613{width:87.8pt;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a614{width:91.8pt;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a615{width:106.4pt;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a616{width:99.7pt;background-color:transparent;vertical-align: top;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a617{width:87.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a618{width:91.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a619{width:106.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a61a{width:99.7pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a61b{width:87.8pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2a61c{width:91.8pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2cf20{width:106.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-baa2cf21{width:99.7pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-bac5ae8c'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-baa2a61b"><p class="cl-baa1477c"><span class="cl-baa0d29c">Characteristic</span></p></td><td class="cl-baa2a61c"><p class="cl-baa1477d"><span class="cl-baa0d29c">setosa, N = 50</span><span class="cl-baa0d29d">1</span></p></td><td class="cl-baa2cf20"><p class="cl-baa1477d"><span class="cl-baa0d29c">versicolor, N = 50</span><span class="cl-baa0d29d">1</span></p></td><td class="cl-baa2cf21"><p class="cl-baa1477d"><span class="cl-baa0d29c">virginica, N = 50</span><span class="cl-baa0d29d">1</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-baa27f16"><p class="cl-baa1477e"><span class="cl-baa0d29c">Sepal.Length</span></p></td><td class="cl-baa27f17"><p class="cl-baa1477f"><span class="cl-baa0d29c">5.01±0.35</span></p></td><td class="cl-baa27f18"><p class="cl-baa1477f"><span class="cl-baa0d29c">5.94±0.52</span></p></td><td class="cl-baa27f19"><p class="cl-baa1477f"><span class="cl-baa0d29c">6.59±0.64</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-baa27f1b"><p class="cl-baa1477e"><span class="cl-baa0d29c">Sepal.Width</span></p></td><td class="cl-baa27f1a"><p class="cl-baa1477f"><span class="cl-baa0d29c">3.43±0.38</span></p></td><td class="cl-baa27f1d"><p class="cl-baa1477f"><span class="cl-baa0d29c">2.77±0.31</span></p></td><td class="cl-baa27f1c"><p class="cl-baa1477f"><span class="cl-baa0d29c">2.97±0.32</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-baa27f1f"><p class="cl-baa1477e"><span class="cl-baa0d29c">Petal.Length</span></p></td><td class="cl-baa27f1e"><p class="cl-baa1477f"><span class="cl-baa0d29c">1.46±0.17</span></p></td><td class="cl-baa2a612"><p class="cl-baa1477f"><span class="cl-baa0d29c">4.26±0.47</span></p></td><td class="cl-baa27f20"><p class="cl-baa1477f"><span class="cl-baa0d29c">5.55±0.55</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-baa2a613"><p class="cl-baa1477e"><span class="cl-baa0d29c">Petal.Width</span></p></td><td class="cl-baa2a614"><p class="cl-baa1477f"><span class="cl-baa0d29c">0.25±0.11</span></p></td><td class="cl-baa2a615"><p class="cl-baa1477f"><span class="cl-baa0d29c">1.33±0.20</span></p></td><td class="cl-baa2a616"><p class="cl-baa1477f"><span class="cl-baa0d29c">2.03±0.27</span></p></td></tr></tbody><tfoot><tr style="overflow-wrap:break-word;"><td  colspan="4"class="cl-baa2a617"><p class="cl-baa14780"><span class="cl-baa0d29d">1</span><span class="cl-baa0d29c">Mean±SD</span></p></td></tr></tfoot></table></div></template>
<div class="flextable-shadow-host" id="3b36fd51-235c-4821-b38f-2d87d431303d"></div>
<script>
var dest = document.getElementById("3b36fd51-235c-4821-b38f-2d87d431303d");
var template = document.getElementById("335f2bd2-724c-41be-816a-0def4a490d5d");
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
# output as image(导出的图片如下)
theme_gtsummary_journal(journal = "jama") # set output image theme
test %>% 
  as_gt() %>%
  gt::gtsave(filename = "C:/Users/Dell/Desktop/my_table_image.png") #save table as image
```

<img src="/post/2022-08-05-r-gtsummary/index.zh-cn_files/figure-html/unnamed-chunk-1-1.png" width="672" />

## 4. crosstable：结果导出到 Word

<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />

crosstable包也可以实现基本统计量的计算，导出方式和gtsummary包的格式略有不同，但可以导出到docx文件中。具体的使用操作可以参考 <a href="https://www.danieldsjoberg.com/gtsummary/index.html">crosstable reference</a>。

``` r
# load packages
library(tidyverse)
library(crosstable)
library(flextable)
library(officer)

test <- crosstable(iris, 1:4, by = c(Species),
                   showNA = c("no"),
                   num_digits = 2,
                   funs=c(N, mean, median, sd))

# output as html type in markdown
test %>%
  flextable::as_flextable()
```

<template id="90b97fb6-1469-40be-8456-7415d830178b"><style>
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
</style><div class="tabwid"><style>.cl-4739b4b4{}.cl-472e897c{font-family:'Arial';font-size:11pt;font-weight:bold;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-472e897d{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-472eb064{margin:0;text-align:center;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-472eb065{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-472f2576{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f2577{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f2578{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f2579{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f257a{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f257b{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f257c{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f257d{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f257e{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f257f{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f2580{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c90{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c91{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c92{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c93{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c94{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c95{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c96{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c97{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c98{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c99{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f4c9a{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f738c{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f738d{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f738e{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f738f{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f7390{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f7391{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f7392{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f7393{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f7394{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f7395{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f7396{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a56{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a57{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a58{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a59{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a5a{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a5b{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a5c{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a5d{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a5e{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a5f{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472f9a60{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc148{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc149{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc14a{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc14b{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc14c{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc14d{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc14e{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc14f{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc150{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc151{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fc152{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe830{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(0, 0, 0, 1.00);border-top: 1.5pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe831{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1.5pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe832{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1.5pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe833{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 1pt solid rgba(0, 0, 0, 1.00);border-top: 1.5pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe834{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(0, 0, 0, 1.00);border-top: 1.5pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe835{width:73.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe836{width:55.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe837{width:62.1pt;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe838{width:65.8pt;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-472fe839{width:85.4pt;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(0, 0, 0, 1.00);border-top: 1pt solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-4739b4b4'>
<thead><tr style="overflow-wrap:break-word;"><td  rowspan="2"class="cl-472fe830"><p class="cl-472eb064"><span class="cl-472e897c">label</span></p></td><td  rowspan="2"class="cl-472fe834"><p class="cl-472eb064"><span class="cl-472e897c">variable</span></p></td><td  colspan="3"class="cl-472fe831"><p class="cl-472eb064"><span class="cl-472e897c">Species</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472fe836"><p class="cl-472eb064"><span class="cl-472e897c">setosa</span></p></td><td class="cl-472fe835"><p class="cl-472eb064"><span class="cl-472e897c">versicolor</span></p></td><td class="cl-472fe838"><p class="cl-472eb064"><span class="cl-472e897c">virginica</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td  rowspan="4"class="cl-472f2578"><p class="cl-472eb065"><span class="cl-472e897d">Sepal.Length</span></p></td><td class="cl-472f2577"><p class="cl-472eb065"><span class="cl-472e897d">N</span></p></td><td class="cl-472f257a"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td><td class="cl-472f2579"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td><td class="cl-472f2576"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f2577"><p class="cl-472eb065"><span class="cl-472e897d">mean</span></p></td><td class="cl-472f257a"><p class="cl-472eb065"><span class="cl-472e897d">5.01</span></p></td><td class="cl-472f2579"><p class="cl-472eb065"><span class="cl-472e897d">5.94</span></p></td><td class="cl-472f2576"><p class="cl-472eb065"><span class="cl-472e897d">6.59</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f2577"><p class="cl-472eb065"><span class="cl-472e897d">median</span></p></td><td class="cl-472f257a"><p class="cl-472eb065"><span class="cl-472e897d">5.00</span></p></td><td class="cl-472f2579"><p class="cl-472eb065"><span class="cl-472e897d">5.90</span></p></td><td class="cl-472f2576"><p class="cl-472eb065"><span class="cl-472e897d">6.50</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f9a56"><p class="cl-472eb065"><span class="cl-472e897d">sd</span></p></td><td class="cl-472f7395"><p class="cl-472eb065"><span class="cl-472e897d">0.35</span></p></td><td class="cl-472f9a57"><p class="cl-472eb065"><span class="cl-472e897d">0.52</span></p></td><td class="cl-472f7396"><p class="cl-472eb065"><span class="cl-472e897d">0.64</span></p></td></tr><tr style="overflow-wrap:break-word;"><td  rowspan="4"class="cl-472f9a58"><p class="cl-472eb065"><span class="cl-472e897d">Sepal.Width</span></p></td><td class="cl-472f9a5c"><p class="cl-472eb065"><span class="cl-472e897d">N</span></p></td><td class="cl-472f9a59"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td><td class="cl-472f9a5b"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td><td class="cl-472f9a5a"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f9a5f"><p class="cl-472eb065"><span class="cl-472e897d">mean</span></p></td><td class="cl-472f9a60"><p class="cl-472eb065"><span class="cl-472e897d">3.43</span></p></td><td class="cl-472fc148"><p class="cl-472eb065"><span class="cl-472e897d">2.77</span></p></td><td class="cl-472f9a5e"><p class="cl-472eb065"><span class="cl-472e897d">2.97</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f9a5f"><p class="cl-472eb065"><span class="cl-472e897d">median</span></p></td><td class="cl-472f9a60"><p class="cl-472eb065"><span class="cl-472e897d">3.40</span></p></td><td class="cl-472fc148"><p class="cl-472eb065"><span class="cl-472e897d">2.80</span></p></td><td class="cl-472f9a5e"><p class="cl-472eb065"><span class="cl-472e897d">3.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472fc14b"><p class="cl-472eb065"><span class="cl-472e897d">sd</span></p></td><td class="cl-472fc14c"><p class="cl-472eb065"><span class="cl-472e897d">0.38</span></p></td><td class="cl-472fc149"><p class="cl-472eb065"><span class="cl-472e897d">0.31</span></p></td><td class="cl-472fc14a"><p class="cl-472eb065"><span class="cl-472e897d">0.32</span></p></td></tr><tr style="overflow-wrap:break-word;"><td  rowspan="4"class="cl-472fc151"><p class="cl-472eb065"><span class="cl-472e897d">Petal.Length</span></p></td><td class="cl-472fc14e"><p class="cl-472eb065"><span class="cl-472e897d">N</span></p></td><td class="cl-472fc14f"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td><td class="cl-472fc150"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td><td class="cl-472fc152"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f257f"><p class="cl-472eb065"><span class="cl-472e897d">mean</span></p></td><td class="cl-472f257b"><p class="cl-472eb065"><span class="cl-472e897d">1.46</span></p></td><td class="cl-472f257d"><p class="cl-472eb065"><span class="cl-472e897d">4.26</span></p></td><td class="cl-472f257c"><p class="cl-472eb065"><span class="cl-472e897d">5.55</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f257f"><p class="cl-472eb065"><span class="cl-472e897d">median</span></p></td><td class="cl-472f257b"><p class="cl-472eb065"><span class="cl-472e897d">1.50</span></p></td><td class="cl-472f257d"><p class="cl-472eb065"><span class="cl-472e897d">4.35</span></p></td><td class="cl-472f257c"><p class="cl-472eb065"><span class="cl-472e897d">5.55</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f4c93"><p class="cl-472eb065"><span class="cl-472e897d">sd</span></p></td><td class="cl-472f4c90"><p class="cl-472eb065"><span class="cl-472e897d">0.17</span></p></td><td class="cl-472f4c91"><p class="cl-472eb065"><span class="cl-472e897d">0.47</span></p></td><td class="cl-472f4c92"><p class="cl-472eb065"><span class="cl-472e897d">0.55</span></p></td></tr><tr style="overflow-wrap:break-word;"><td  rowspan="4"class="cl-472f4c96"><p class="cl-472eb065"><span class="cl-472e897d">Petal.Width</span></p></td><td class="cl-472f4c98"><p class="cl-472eb065"><span class="cl-472e897d">N</span></p></td><td class="cl-472f4c94"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td><td class="cl-472f4c97"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td><td class="cl-472f4c95"><p class="cl-472eb065"><span class="cl-472e897d">50.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f4c99"><p class="cl-472eb065"><span class="cl-472e897d">mean</span></p></td><td class="cl-472f738e"><p class="cl-472eb065"><span class="cl-472e897d">0.25</span></p></td><td class="cl-472f4c9a"><p class="cl-472eb065"><span class="cl-472e897d">1.33</span></p></td><td class="cl-472f738d"><p class="cl-472eb065"><span class="cl-472e897d">2.03</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f4c99"><p class="cl-472eb065"><span class="cl-472e897d">median</span></p></td><td class="cl-472f738e"><p class="cl-472eb065"><span class="cl-472e897d">0.20</span></p></td><td class="cl-472f4c9a"><p class="cl-472eb065"><span class="cl-472e897d">1.30</span></p></td><td class="cl-472f738d"><p class="cl-472eb065"><span class="cl-472e897d">2.00</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-472f7392"><p class="cl-472eb065"><span class="cl-472e897d">sd</span></p></td><td class="cl-472f738f"><p class="cl-472eb065"><span class="cl-472e897d">0.11</span></p></td><td class="cl-472f7390"><p class="cl-472eb065"><span class="cl-472e897d">0.20</span></p></td><td class="cl-472f7393"><p class="cl-472eb065"><span class="cl-472e897d">0.27</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="c710e9d8-3208-4995-931c-a9af6603417c"></div>
<script>
var dest = document.getElementById("c710e9d8-3208-4995-931c-a9af6603417c");
var template = document.getElementById("90b97fb6-1469-40be-8456-7415d830178b");
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
# 将结果导出到.docx文件中
doc <- read_docx() %>% 
  body_add_crosstable(test)
write_and_open(doc, "C:/Users/Dell/Desktop/res_output.docx")
```

## 5. gtExtras：带分布图的汇报表格

之前有介绍过gtExtras包，结合gt包能发挥出了1+1>2的效果。在做月度总结汇报中需要用到比较漂亮的描述性统计图表，为了方便后续其它分析中继续用到，现整理代码，以iris数据集为示例，对变量Sepal.Length进行描述性统计。

```r
# load packages
library(tidyverse)
library(gtExtras)
library(gt)

# head iris data
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

```r
# 描述性统计
iris %>% 
  select(Species, Sepal.Length) %>%
  dplyr::group_by(Species) %>% # 分组
  dplyr::summarize( # 汇总
    N = n(),
    mean = mean(Sepal.Length),
    sd = sd(Sepal.Length),
    Sepal.Length_data = list(Sepal.Length),
    .groups = "drop"
  ) %>%
  gt() %>% # 转为gt格式
  gtExtras::gt_plt_dist(Sepal.Length_data, type = "density", line_color = "blue",
                        fill_color = "red") %>% # 添加密度图
  fmt_number(columns = mean:sd, decimals = 2) %>% # 保留小数点后两位
  gt_theme_pff() %>% # 改变表格主题
  #cols_align("center") %>% # 居中对齐
  tab_header(
    title = md("**iris数据中关于Sepal.Length的描述性统计**") # 添加md格式表头
  ) %>%
  tab_options(data_row.padding = px(3),
              heading.title.font.size = 15, # 改变表头字体大小
              heading.align = "center") %>% # 表头居中
  gt::gtsave("C:/Users/Dell/Desktop/iris_stats.png") # 将表格导出为png格式图片
```

<img src="/post/2022-09-02-gtextras/index.zh-cn_files/figure-html/unnamed-chunk-1-1.png" width="672" />

## 怎么选

- 统计结果还要接着筛选、合并或画图，用 rstatix，它返回的是普通数据框。
- 刚拿到数据，只想快速了解变量分布和缺失情况，用 skimr。
- 要直接放进报告或论文，用 gtsummary；需要交 Word 文件，用 crosstable。
- 月度汇报这类需要美观、带图的表格，用 gt 加 gtExtras。
