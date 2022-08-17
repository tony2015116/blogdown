---
title: 使用ggplot2画boxplot
author: guoguo
date: '2022-08-17'
slug: index.zh-cn
categories:
  - 数据可视化
tags:
  - R
  - ggplot2
  - boxplot
lastmod: '2022-08-17T11:26:46+08:00'
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
<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />
<p style="text-indent:2em;font-size:;font-family:;">
记录一下我常用的使用ggplot2画boxplot的方法。以daimonds数据集为例，选择其中depth、table、price等三个连续性变量，以及cut和color两个离散型变量，分别以单变量分组和双变量分组的方法画boxplot。
</p>
<!--more-->

``` r
# load packages
library(tidyverse)

# using ggplot2 dataset ~ diamonds
head(diamonds) %>%
  flextable::flextable()
```

<template id="768042c3-7533-4a15-8357-d83effa74f0c"><style>
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
</style><div class="tabwid"><style>.cl-d7f862b6{}.cl-d7efb4c2{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-d7efdbb4{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-d7efdbb5{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-d7f029a2{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d7f029a3{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d7f029a4{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d7f029a5{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d7f029a6{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d7f029a7{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-d7f862b6'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-d7f029a6"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">carat</span></p></td><td class="cl-d7f029a7"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">cut</span></p></td><td class="cl-d7f029a7"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">color</span></p></td><td class="cl-d7f029a7"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">clarity</span></p></td><td class="cl-d7f029a6"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">depth</span></p></td><td class="cl-d7f029a6"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">table</span></p></td><td class="cl-d7f029a6"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">price</span></p></td><td class="cl-d7f029a6"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">x</span></p></td><td class="cl-d7f029a6"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">y</span></p></td><td class="cl-d7f029a6"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">z</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">0.23</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">Ideal</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">E</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">SI2</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">61.5</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">55</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">326</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">3.95</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">3.98</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">2.43</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">0.21</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">Premium</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">E</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">SI1</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">59.8</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">61</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">326</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">3.89</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">3.84</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">2.31</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">0.23</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">Good</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">E</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">VS1</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">56.9</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">65</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">327</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">4.05</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">4.07</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">2.31</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">0.29</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">Premium</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">I</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">VS2</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">62.4</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">58</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">334</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">4.20</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">4.23</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">2.63</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">0.31</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">Good</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">J</span></p></td><td class="cl-d7f029a3"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">SI2</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">63.3</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">58</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">335</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">4.34</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">4.35</span></p></td><td class="cl-d7f029a2"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">2.75</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d7f029a4"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">0.24</span></p></td><td class="cl-d7f029a5"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">Very Good</span></p></td><td class="cl-d7f029a5"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">J</span></p></td><td class="cl-d7f029a5"><p class="cl-d7efdbb5"><span class="cl-d7efb4c2">VVS2</span></p></td><td class="cl-d7f029a4"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">62.8</span></p></td><td class="cl-d7f029a4"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">57</span></p></td><td class="cl-d7f029a4"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">336</span></p></td><td class="cl-d7f029a4"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">3.94</span></p></td><td class="cl-d7f029a4"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">3.96</span></p></td><td class="cl-d7f029a4"><p class="cl-d7efdbb4"><span class="cl-d7efb4c2">2.48</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="836ce3d8-7c4a-4a00-b163-88836d37cb25"></div>
<script>
var dest = document.getElementById("836ce3d8-7c4a-4a00-b163-88836d37cb25");
var template = document.getElementById("768042c3-7533-4a15-8357-d83effa74f0c");
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
# wider data to long data
data <- diamonds %>%
  select(2:3, 5:7) %>%
  pivot_longer(c(depth, table, price), names_to = "variables", values_to = "values")
head(data) %>%
  flextable::flextable()
```

<template id="43b5932f-185e-48a4-a0bd-66be0bb8b098"><style>
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
</style><div class="tabwid"><style>.cl-d8105ac4{}.cl-d80897e4{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-d808bed6{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-d808bed7{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-d808e5d2{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d808e5d3{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d808e5d4{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d808e5d5{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d808e5d6{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-d808e5d7{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-d8105ac4'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-d808e5d6"><p class="cl-d808bed6"><span class="cl-d80897e4">cut</span></p></td><td class="cl-d808e5d6"><p class="cl-d808bed6"><span class="cl-d80897e4">color</span></p></td><td class="cl-d808e5d6"><p class="cl-d808bed6"><span class="cl-d80897e4">variables</span></p></td><td class="cl-d808e5d7"><p class="cl-d808bed7"><span class="cl-d80897e4">values</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">Ideal</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">E</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">depth</span></p></td><td class="cl-d808e5d3"><p class="cl-d808bed7"><span class="cl-d80897e4">61.5</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">Ideal</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">E</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">table</span></p></td><td class="cl-d808e5d3"><p class="cl-d808bed7"><span class="cl-d80897e4">55.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">Ideal</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">E</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">price</span></p></td><td class="cl-d808e5d3"><p class="cl-d808bed7"><span class="cl-d80897e4">326.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">Premium</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">E</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">depth</span></p></td><td class="cl-d808e5d3"><p class="cl-d808bed7"><span class="cl-d80897e4">59.8</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">Premium</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">E</span></p></td><td class="cl-d808e5d2"><p class="cl-d808bed6"><span class="cl-d80897e4">table</span></p></td><td class="cl-d808e5d3"><p class="cl-d808bed7"><span class="cl-d80897e4">61.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-d808e5d5"><p class="cl-d808bed6"><span class="cl-d80897e4">Premium</span></p></td><td class="cl-d808e5d5"><p class="cl-d808bed6"><span class="cl-d80897e4">E</span></p></td><td class="cl-d808e5d5"><p class="cl-d808bed6"><span class="cl-d80897e4">price</span></p></td><td class="cl-d808e5d4"><p class="cl-d808bed7"><span class="cl-d80897e4">326.0</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="bdbd774a-8d0f-4ce0-b283-e2d796e36899"></div>
<script>
var dest = document.getElementById("bdbd774a-8d0f-4ce0-b283-e2d796e36899");
var template = document.getElementById("43b5932f-185e-48a4-a0bd-66be0bb8b098");
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
# plot boxplot
# cut单变量分组boxplot
ggplot(data, aes(x = cut, y = values)) +
  geom_boxplot(aes(color=variables)) +
  facet_grid(variables~., scales = "free") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  ggsci::scale_color_npg()
```

<img src="/post/2022-08-17-ggplot2-boxplot/index.zh-cn_files/figure-html/unnamed-chunk-3-1.png" width="672" />

``` r
# plot boxplot
# cut和color双变量分组boxplot
ggplot(data, aes(x = cut, y = values)) +
  geom_boxplot(aes(color=variables)) +
  facet_grid(variables~color, scales = "free") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  ggsci::scale_color_npg()
```

<img src="/post/2022-08-17-ggplot2-boxplot/index.zh-cn_files/figure-html/unnamed-chunk-4-1.png" width="672" />
