---
title: 使用ggplot2画多变量分组点线图
author: guoguo
date: '2022-08-09'
slug: index.zh-cn
categories:
  - 数据可视化
tags:
  - R
  - ggplot2
  - line plot
  - point plot
lastmod: '2022-08-17T19:26:28+08:00'
keywords: []
description: ''
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: no
reward: yes
mathjax: yes
---

<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/tabwid.css" rel="stylesheet" />
<link href="/rmarkdown-libs/tabwid/scrool.css" rel="stylesheet" />

<p style="text-indent:2em;font-size:;font-family:;">
记录数据分析中常用到的点线图在R中的画法。针对y值的不同计算方法，有两种画法，一种是单独计算出所需要展示变量的y值，如平均值；一种是直接使用ggplot2中自带的stat\_summary()函数直接计算中初始数据中的y值。两种方法都可以画出漂亮的点线图💯。
</p>
<!--more-->

``` r
# load packages
library(tidyverse)

# using ggplot2 dataset ~ diamonds
head(diamonds) %>%
  flextable::flextable()
```

<template id="84e46056-55ab-419d-aac1-20e3540eb426"><style>
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
</style><div class="tabwid"><style>.cl-997378ce{}.cl-9968d608{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-9968ff7a{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9968ff7b{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-99694ade{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-99694adf{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-99694ae0{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-99694ae1{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-99694ae2{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-99694ae3{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-997378ce'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-99694ae2"><p class="cl-9968ff7a"><span class="cl-9968d608">carat</span></p></td><td class="cl-99694ae3"><p class="cl-9968ff7b"><span class="cl-9968d608">cut</span></p></td><td class="cl-99694ae3"><p class="cl-9968ff7b"><span class="cl-9968d608">color</span></p></td><td class="cl-99694ae3"><p class="cl-9968ff7b"><span class="cl-9968d608">clarity</span></p></td><td class="cl-99694ae2"><p class="cl-9968ff7a"><span class="cl-9968d608">depth</span></p></td><td class="cl-99694ae2"><p class="cl-9968ff7a"><span class="cl-9968d608">table</span></p></td><td class="cl-99694ae2"><p class="cl-9968ff7a"><span class="cl-9968d608">price</span></p></td><td class="cl-99694ae2"><p class="cl-9968ff7a"><span class="cl-9968d608">x</span></p></td><td class="cl-99694ae2"><p class="cl-9968ff7a"><span class="cl-9968d608">y</span></p></td><td class="cl-99694ae2"><p class="cl-9968ff7a"><span class="cl-9968d608">z</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">0.23</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">Ideal</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">E</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">SI2</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">61.5</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">55</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">326</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">3.95</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">3.98</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">2.43</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">0.21</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">Premium</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">E</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">SI1</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">59.8</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">61</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">326</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">3.89</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">3.84</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">2.31</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">0.23</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">Good</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">E</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">VS1</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">56.9</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">65</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">327</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">4.05</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">4.07</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">2.31</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">0.29</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">Premium</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">I</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">VS2</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">62.4</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">58</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">334</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">4.20</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">4.23</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">2.63</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">0.31</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">Good</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">J</span></p></td><td class="cl-99694adf"><p class="cl-9968ff7b"><span class="cl-9968d608">SI2</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">63.3</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">58</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">335</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">4.34</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">4.35</span></p></td><td class="cl-99694ade"><p class="cl-9968ff7a"><span class="cl-9968d608">2.75</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-99694ae0"><p class="cl-9968ff7a"><span class="cl-9968d608">0.24</span></p></td><td class="cl-99694ae1"><p class="cl-9968ff7b"><span class="cl-9968d608">Very Good</span></p></td><td class="cl-99694ae1"><p class="cl-9968ff7b"><span class="cl-9968d608">J</span></p></td><td class="cl-99694ae1"><p class="cl-9968ff7b"><span class="cl-9968d608">VVS2</span></p></td><td class="cl-99694ae0"><p class="cl-9968ff7a"><span class="cl-9968d608">62.8</span></p></td><td class="cl-99694ae0"><p class="cl-9968ff7a"><span class="cl-9968d608">57</span></p></td><td class="cl-99694ae0"><p class="cl-9968ff7a"><span class="cl-9968d608">336</span></p></td><td class="cl-99694ae0"><p class="cl-9968ff7a"><span class="cl-9968d608">3.94</span></p></td><td class="cl-99694ae0"><p class="cl-9968ff7a"><span class="cl-9968d608">3.96</span></p></td><td class="cl-99694ae0"><p class="cl-9968ff7a"><span class="cl-9968d608">2.48</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="df7056a4-cac9-4ab1-b66d-9d5cb51e2162"></div>
<script>
var dest = document.getElementById("df7056a4-cac9-4ab1-b66d-9d5cb51e2162");
var template = document.getElementById("84e46056-55ab-419d-aac1-20e3540eb426");
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

<template id="e86f98b8-7635-445d-af60-1a128541ce57"><style>
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
</style><div class="tabwid"><style>.cl-99941b1a{}.cl-998837aa{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-998837ab{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-998837ac{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9988857a{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9988857b{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9988857c{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9988857d{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9988857e{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9988857f{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-99941b1a'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-9988857e"><p class="cl-998837ab"><span class="cl-998837aa">cut</span></p></td><td class="cl-9988857e"><p class="cl-998837ab"><span class="cl-998837aa">color</span></p></td><td class="cl-9988857e"><p class="cl-998837ab"><span class="cl-998837aa">variables</span></p></td><td class="cl-9988857f"><p class="cl-998837ac"><span class="cl-998837aa">values</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">Ideal</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">E</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">depth</span></p></td><td class="cl-9988857b"><p class="cl-998837ac"><span class="cl-998837aa">61.5</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">Ideal</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">E</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">table</span></p></td><td class="cl-9988857b"><p class="cl-998837ac"><span class="cl-998837aa">55.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">Ideal</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">E</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">price</span></p></td><td class="cl-9988857b"><p class="cl-998837ac"><span class="cl-998837aa">326.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">Premium</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">E</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">depth</span></p></td><td class="cl-9988857b"><p class="cl-998837ac"><span class="cl-998837aa">59.8</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">Premium</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">E</span></p></td><td class="cl-9988857a"><p class="cl-998837ab"><span class="cl-998837aa">table</span></p></td><td class="cl-9988857b"><p class="cl-998837ac"><span class="cl-998837aa">61.0</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9988857d"><p class="cl-998837ab"><span class="cl-998837aa">Premium</span></p></td><td class="cl-9988857d"><p class="cl-998837ab"><span class="cl-998837aa">E</span></p></td><td class="cl-9988857d"><p class="cl-998837ab"><span class="cl-998837aa">price</span></p></td><td class="cl-9988857c"><p class="cl-998837ac"><span class="cl-998837aa">326.0</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="3ec26017-320b-4cfd-babf-7fc74e7ecaee"></div>
<script>
var dest = document.getElementById("3ec26017-320b-4cfd-babf-7fc74e7ecaee");
var template = document.getElementById("e86f98b8-7635-445d-af60-1a128541ce57");
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
summary_data <- data %>%
  group_by(cut, color, variables) %>%
  rstatix::get_summary_stats(values, type = "mean_sd") 
summary_data %>%
  head() %>%
  flextable::flextable()
```

<template id="8b4b7722-0175-456e-88b8-9a79272f3d44"><style>
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
</style><div class="tabwid"><style>.cl-9b357b26{}.cl-9b2c7990{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-9b2ca082{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9b2ca083{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-9b2cef6a{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b2cef6b{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b2cef6c{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b2cef6d{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b2cef6e{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-9b2cef6f{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-9b357b26'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-9b2cef6f"><p class="cl-9b2ca082"><span class="cl-9b2c7990">cut</span></p></td><td class="cl-9b2cef6f"><p class="cl-9b2ca082"><span class="cl-9b2c7990">color</span></p></td><td class="cl-9b2cef6f"><p class="cl-9b2ca082"><span class="cl-9b2c7990">variables</span></p></td><td class="cl-9b2cef6f"><p class="cl-9b2ca082"><span class="cl-9b2c7990">variable</span></p></td><td class="cl-9b2cef6e"><p class="cl-9b2ca083"><span class="cl-9b2c7990">n</span></p></td><td class="cl-9b2cef6e"><p class="cl-9b2ca083"><span class="cl-9b2c7990">mean</span></p></td><td class="cl-9b2cef6e"><p class="cl-9b2ca083"><span class="cl-9b2c7990">sd</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">Fair</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">D</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">depth</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">values</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">163</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">64.048</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">3.292</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">Fair</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">D</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">price</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">values</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">163</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">4,291.061</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">3,286.114</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">Fair</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">D</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">table</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">values</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">163</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">58.969</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">3.623</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">Fair</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">E</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">depth</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">values</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">224</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">63.320</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">4.421</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">Fair</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">E</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">price</span></p></td><td class="cl-9b2cef6a"><p class="cl-9b2ca082"><span class="cl-9b2c7990">values</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">224</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">3,682.312</span></p></td><td class="cl-9b2cef6b"><p class="cl-9b2ca083"><span class="cl-9b2c7990">2,976.652</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-9b2cef6c"><p class="cl-9b2ca082"><span class="cl-9b2c7990">Fair</span></p></td><td class="cl-9b2cef6c"><p class="cl-9b2ca082"><span class="cl-9b2c7990">E</span></p></td><td class="cl-9b2cef6c"><p class="cl-9b2ca082"><span class="cl-9b2c7990">table</span></p></td><td class="cl-9b2cef6c"><p class="cl-9b2ca082"><span class="cl-9b2c7990">values</span></p></td><td class="cl-9b2cef6d"><p class="cl-9b2ca083"><span class="cl-9b2c7990">224</span></p></td><td class="cl-9b2cef6d"><p class="cl-9b2ca083"><span class="cl-9b2c7990">59.365</span></p></td><td class="cl-9b2cef6d"><p class="cl-9b2ca083"><span class="cl-9b2c7990">4.063</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="8b89069b-5c8a-4c4b-95b7-8db7cc1237e1"></div>
<script>
var dest = document.getElementById("8b89069b-5c8a-4c4b-95b7-8db7cc1237e1");
var template = document.getElementById("8b4b7722-0175-456e-88b8-9a79272f3d44");
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
# 双变量cut和color分组点线图~方法1
ggplot(summary_data, aes(x = cut, y = mean, group = 1)) +
  geom_line() +
  geom_point(aes(color=cut)) +
  facet_grid(variables~color, scales = "free") +
  theme_minimal() +
  ggsci::scale_color_aaas() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        legend.position="bottom")
```

<img src="/post/2022-08-09-ggplot2/index.zh-cn_files/figure-html/unnamed-chunk-3-1.png" width="672" />

``` r
# 双变量cut和color分组点线图~方法2
data %>% 
  ggplot(aes(x = cut, y = values, col = cut, group = 1)) +
  stat_summary(fun = "mean", geom = "point") +
  stat_summary(fun = "mean", geom = "line") +
  #scale_color_manual("cut", values = c('slategray', 'rosybrown', 'darkred', 'gold', '#08306B')) +
  facet_grid(variables~color, scales = "free") +
  theme_minimal() +
  ggsci::scale_color_aaas() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        legend.position="bottom")
```

<img src="/post/2022-08-09-ggplot2/index.zh-cn_files/figure-html/unnamed-chunk-4-1.png" width="672" />
