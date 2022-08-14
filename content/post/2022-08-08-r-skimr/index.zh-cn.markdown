---
title: 使用R包skimr做描述性统计
author: guoguo
date: '2022-08-08'
slug: index.zh-cn
categories:
  - 数据分析
tags:
  - R
  - skimr
  - 基本统计量
lastmod: '2022-08-14T21:06:22+08:00'
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
skimr是一个比较方便汇总数据数据的R包。使用非常简单，具体使用可以参考 <a href="https://docs.ropensci.org/skimr/reference/index.html">skimr reference</a>。
</p>
<!--more-->

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
