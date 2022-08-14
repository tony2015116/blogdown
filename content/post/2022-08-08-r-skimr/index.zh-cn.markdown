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
skimr是一个比较方便而且全面地汇总数据数据的R包。具体使用可以参考 <a href="https://docs.ropensci.org/skimr/reference/index.html">skimr reference</a>。
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

<template id="8e4e99fa-00e9-469e-9544-057ca3d7f216"><style>
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
</style><div class="tabwid"><style>.cl-554ef190{}.cl-554707dc{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-554729c4{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-554729c5{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-554777bc{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-554777bd{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-554777be{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-554777bf{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-554777c0{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-554777c1{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-554ef190'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-554777c1"><p class="cl-554729c4"><span class="cl-554707dc">skim_type</span></p></td><td class="cl-554777c1"><p class="cl-554729c4"><span class="cl-554707dc">skim_variable</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">n_missing</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">complete_rate</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">factor.ordered</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">factor.n_unique</span></p></td><td class="cl-554777c1"><p class="cl-554729c4"><span class="cl-554707dc">factor.top_counts</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">numeric.mean</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">numeric.sd</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">numeric.p0</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">numeric.p25</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">numeric.p50</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">numeric.p75</span></p></td><td class="cl-554777c0"><p class="cl-554729c5"><span class="cl-554707dc">numeric.p100</span></p></td><td class="cl-554777c1"><p class="cl-554729c4"><span class="cl-554707dc">numeric.hist</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">factor</span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">Species</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">0</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">1</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">FALSE</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">3</span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">set: 50, ver: 50, vir: 50</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc"></span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">numeric</span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">Sepal.Length</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">0</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">1</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">5.843333</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">0.8280661</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">4.3</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">5.1</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">5.80</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">6.4</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">7.9</span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">▆▇▇▅▂</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">numeric</span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">Sepal.Width</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">0</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">1</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">3.057333</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">0.4358663</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">2.0</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">2.8</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">3.00</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">3.3</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">4.4</span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">▁▆▇▂▁</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">numeric</span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">Petal.Length</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">0</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">1</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc"></span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">3.758000</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">1.7652982</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">1.0</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">1.6</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">4.35</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">5.1</span></p></td><td class="cl-554777bc"><p class="cl-554729c5"><span class="cl-554707dc">6.9</span></p></td><td class="cl-554777bd"><p class="cl-554729c4"><span class="cl-554707dc">▇▁▆▇▂</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-554777be"><p class="cl-554729c4"><span class="cl-554707dc">numeric</span></p></td><td class="cl-554777be"><p class="cl-554729c4"><span class="cl-554707dc">Petal.Width</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">0</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">1</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc"></span></p></td><td class="cl-554777be"><p class="cl-554729c4"><span class="cl-554707dc"></span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">1.199333</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">0.7622377</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">0.1</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">0.3</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">1.30</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">1.8</span></p></td><td class="cl-554777bf"><p class="cl-554729c5"><span class="cl-554707dc">2.5</span></p></td><td class="cl-554777be"><p class="cl-554729c4"><span class="cl-554707dc">▇▁▇▅▃</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="323d5b0d-810b-4926-a5a2-cbb47c884602"></div>
<script>
var dest = document.getElementById("323d5b0d-810b-4926-a5a2-cbb47c884602");
var template = document.getElementById("8e4e99fa-00e9-469e-9544-057ca3d7f216");
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
