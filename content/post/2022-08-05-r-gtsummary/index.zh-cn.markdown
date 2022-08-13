---
title: 使用R包gtsummary计算基本统计量
author: guoguo
date: '2022-08-05'
slug: index.zh-cn
categories:
  - 数据分析
tags:
  - R
  - gtsummary
  - 基本统计量
lastmod: '2022-08-05T23:45:07+08:00'
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

<p style="text-indent:2em;font-size:;font-family:;">
工作中经常遇到统计一些如数量、平均值、中位数、标准差等一些基本的统计量，通常会在R中试用summarise等函数统计好后导出到excel中，然后再在excel中整理美化表格，这种方式是比较麻烦的。简单一些的是通过一些R包将结果输出为html格式，然后截图。还比较少有R包可以将html格式的储存为图片格式的R包，但gtsummary包就是其中一个（其它的类似R包比较少见）集合统计和导出图片还可以设定图片主题的强大R包。
</p>
<!--more-->
<p style="text-indent:2em;font-size:;font-family:;">
gtsummary包中很多函数。刚接触，所以使用的比较少。但我相信后面会使用的多起来，我比较喜欢的是可以导出图片格式。详细的介绍可以看 <a href="https://www.danieldsjoberg.com/gtsummary/index.html">gtsummary reference</a>。
</p>

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
