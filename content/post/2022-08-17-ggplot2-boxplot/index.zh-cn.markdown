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
记录一下使用ggplot2对daimonds数据集中depth、table、price等三个连续性变量以离散型单变量cut或离散型双变量cut&color分组的boxplot。
</p>
<!--more-->

``` r
# load packages
library(tidyverse)

# using ggplot2 dataset ~ diamonds
head(diamonds) %>%
  flextable::flextable()
```

<template id="967d1531-a35a-40ed-b7d8-1c366be30522"><style>
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
</style><div class="tabwid"><style>.cl-4f820dae{}.cl-4f76081a{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-4f76347a{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-4f76347b{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-4f76a3ec{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f76a3ed{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f76a3ee{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f76a3ef{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f76a3f0{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f76a3f1{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-4f820dae'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-4f76a3f0"><p class="cl-4f76347a"><span class="cl-4f76081a">carat</span></p></td><td class="cl-4f76a3f1"><p class="cl-4f76347b"><span class="cl-4f76081a">cut</span></p></td><td class="cl-4f76a3f1"><p class="cl-4f76347b"><span class="cl-4f76081a">color</span></p></td><td class="cl-4f76a3f1"><p class="cl-4f76347b"><span class="cl-4f76081a">clarity</span></p></td><td class="cl-4f76a3f0"><p class="cl-4f76347a"><span class="cl-4f76081a">depth</span></p></td><td class="cl-4f76a3f0"><p class="cl-4f76347a"><span class="cl-4f76081a">table</span></p></td><td class="cl-4f76a3f0"><p class="cl-4f76347a"><span class="cl-4f76081a">price</span></p></td><td class="cl-4f76a3f0"><p class="cl-4f76347a"><span class="cl-4f76081a">x</span></p></td><td class="cl-4f76a3f0"><p class="cl-4f76347a"><span class="cl-4f76081a">y</span></p></td><td class="cl-4f76a3f0"><p class="cl-4f76347a"><span class="cl-4f76081a">z</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">0.23</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">Ideal</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">E</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">SI2</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">61.5</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">55</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">326</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">3.95</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">3.98</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">2.43</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">0.21</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">Premium</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">E</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">SI1</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">59.8</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">61</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">326</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">3.89</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">3.84</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">2.31</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">0.23</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">Good</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">E</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">VS1</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">56.9</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">65</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">327</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">4.05</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">4.07</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">2.31</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">0.29</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">Premium</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">I</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">VS2</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">62.4</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">58</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">334</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">4.20</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">4.23</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">2.63</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">0.31</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">Good</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">J</span></p></td><td class="cl-4f76a3ed"><p class="cl-4f76347b"><span class="cl-4f76081a">SI2</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">63.3</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">58</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">335</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">4.34</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">4.35</span></p></td><td class="cl-4f76a3ec"><p class="cl-4f76347a"><span class="cl-4f76081a">2.75</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f76a3ee"><p class="cl-4f76347a"><span class="cl-4f76081a">0.24</span></p></td><td class="cl-4f76a3ef"><p class="cl-4f76347b"><span class="cl-4f76081a">Very Good</span></p></td><td class="cl-4f76a3ef"><p class="cl-4f76347b"><span class="cl-4f76081a">J</span></p></td><td class="cl-4f76a3ef"><p class="cl-4f76347b"><span class="cl-4f76081a">VVS2</span></p></td><td class="cl-4f76a3ee"><p class="cl-4f76347a"><span class="cl-4f76081a">62.8</span></p></td><td class="cl-4f76a3ee"><p class="cl-4f76347a"><span class="cl-4f76081a">57</span></p></td><td class="cl-4f76a3ee"><p class="cl-4f76347a"><span class="cl-4f76081a">336</span></p></td><td class="cl-4f76a3ee"><p class="cl-4f76347a"><span class="cl-4f76081a">3.94</span></p></td><td class="cl-4f76a3ee"><p class="cl-4f76347a"><span class="cl-4f76081a">3.96</span></p></td><td class="cl-4f76a3ee"><p class="cl-4f76347a"><span class="cl-4f76081a">2.48</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="7503fea5-2193-4dc5-b5ff-43b350c281e6"></div>
<script>
var dest = document.getElementById("7503fea5-2193-4dc5-b5ff-43b350c281e6");
var template = document.getElementById("967d1531-a35a-40ed-b7d8-1c366be30522");
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

<template id="bec41f7d-5ac8-471b-aa9c-46370b23447a"><style>
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
</style><div class="tabwid"><style>.cl-4fa5c10e{}.cl-4f9acb0a{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-4f9af1fc{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-4f9af1fd{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-4f9b3fea{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f9b3feb{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f9b3fec{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f9b3fed{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f9b3fee{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-4f9b3fef{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-4fa5c10e'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-4f9b3fee"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">cut</span></p></td><td class="cl-4f9b3fee"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">color</span></p></td><td class="cl-4f9b3fee"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">variables</span></p></td><td class="cl-4f9b3fef"><p class="cl-4f9af1fd"><span class="cl-4f9acb0a">values</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">Ideal</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">E</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">depth</span></p></td><td class="cl-4f9b3feb"><p class="cl-4f9af1fd"><span class="cl-4f9acb0a">61.5</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">Ideal</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">E</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">table</span></p></td><td class="cl-4f9b3feb"><p class="cl-4f9af1fd"><span class="cl-4f9acb0a">55.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">Ideal</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">E</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">price</span></p></td><td class="cl-4f9b3feb"><p class="cl-4f9af1fd"><span class="cl-4f9acb0a">326.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">Premium</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">E</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">depth</span></p></td><td class="cl-4f9b3feb"><p class="cl-4f9af1fd"><span class="cl-4f9acb0a">59.8</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">Premium</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">E</span></p></td><td class="cl-4f9b3fea"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">table</span></p></td><td class="cl-4f9b3feb"><p class="cl-4f9af1fd"><span class="cl-4f9acb0a">61.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-4f9b3fed"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">Premium</span></p></td><td class="cl-4f9b3fed"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">E</span></p></td><td class="cl-4f9b3fed"><p class="cl-4f9af1fc"><span class="cl-4f9acb0a">price</span></p></td><td class="cl-4f9b3fec"><p class="cl-4f9af1fd"><span class="cl-4f9acb0a">326.0</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="d354aa9e-7bec-4e74-a45c-c048e2064561"></div>
<script>
var dest = document.getElementById("d354aa9e-7bec-4e74-a45c-c048e2064561");
var template = document.getElementById("bec41f7d-5ac8-471b-aa9c-46370b23447a");
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
