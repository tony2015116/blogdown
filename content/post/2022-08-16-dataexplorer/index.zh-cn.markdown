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

<template id="3d15c8c1-8881-4acf-9177-5b2b99472151"><style>
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
</style><div class="tabwid"><style>.cl-eaa7ab34{}.cl-eaa052e4{font-family:'Arial';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-eaa052e5{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-eaa07896{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-eaa07897{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-eaa7ab34'>
<thead><tr style="overflow-wrap:break-word;"><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">rows</span></p></td><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">columns</span></p></td><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">discrete_columns</span></p></td><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">continuous_columns</span></p></td><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">all_missing_columns</span></p></td><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">total_missing_values</span></p></td><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">complete_rows</span></p></td><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">total_observations</span></p></td><td class="cl-eaa07897"><p class="cl-eaa052e5"><span class="cl-eaa052e4">memory_usage</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">53,940</span></p></td><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">10</span></p></td><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">3</span></p></td><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">7</span></p></td><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">0</span></p></td><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">0</span></p></td><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">53,940</span></p></td><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">539,400</span></p></td><td class="cl-eaa07896"><p class="cl-eaa052e5"><span class="cl-eaa052e4">3,457,760</span></p></td></tr></tbody></table></div></template>
<div class="flextable-shadow-host" id="2359ad6b-f682-4ac7-b0de-f5afb148e84b"></div>
<script>
var dest = document.getElementById("2359ad6b-f682-4ac7-b0de-f5afb148e84b");
var template = document.getElementById("3d15c8c1-8881-4acf-9177-5b2b99472151");
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

    ## 
      |                                                                            
      |                                                                      |   0%
      |                                                                            
      |..                                                                    |   2%
    ##    inline R code fragments
    ## 
    ## 
      |                                                                            
      |...                                                                   |   5%
    ## label: global_options (with options) 
    ## List of 1
    ##  $ include: logi FALSE
    ## 
    ## 
      |                                                                            
      |.....                                                                 |   7%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |.......                                                               |  10%
    ## label: introduce
    ## 
      |                                                                            
      |........                                                              |  12%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |..........                                                            |  14%
    ## label: plot_intro

    ## 
      |                                                                            
      |............                                                          |  17%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |.............                                                         |  19%
    ## label: data_structure
    ## 
      |                                                                            
      |...............                                                       |  21%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |.................                                                     |  24%
    ## label: missing_profile

    ## 
      |                                                                            
      |..................                                                    |  26%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |....................                                                  |  29%
    ## label: univariate_distribution_header
    ## 
      |                                                                            
      |......................                                                |  31%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |.......................                                               |  33%
    ## label: plot_histogram

    ## 
      |                                                                            
      |.........................                                             |  36%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |...........................                                           |  38%
    ## label: plot_density
    ## 
      |                                                                            
      |............................                                          |  40%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |..............................                                        |  43%
    ## label: plot_frequency_bar

    ## 
      |                                                                            
      |................................                                      |  45%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |.................................                                     |  48%
    ## label: plot_response_bar
    ## 
      |                                                                            
      |...................................                                   |  50%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |.....................................                                 |  52%
    ## label: plot_with_bar
    ## 
      |                                                                            
      |......................................                                |  55%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |........................................                              |  57%
    ## label: plot_normal_qq

    ## 
      |                                                                            
      |..........................................                            |  60%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |...........................................                           |  62%
    ## label: plot_response_qq
    ## 
      |                                                                            
      |.............................................                         |  64%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |...............................................                       |  67%
    ## label: plot_by_qq
    ## 
      |                                                                            
      |................................................                      |  69%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |..................................................                    |  71%
    ## label: correlation_analysis

    ## 
      |                                                                            
      |....................................................                  |  74%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |.....................................................                 |  76%
    ## label: principal_component_analysis

    ## 
      |                                                                            
      |.......................................................               |  79%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |.........................................................             |  81%
    ## label: bivariate_distribution_header
    ## 
      |                                                                            
      |..........................................................            |  83%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |............................................................          |  86%
    ## label: plot_response_boxplot
    ## 
      |                                                                            
      |..............................................................        |  88%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |...............................................................       |  90%
    ## label: plot_by_boxplot
    ## 
      |                                                                            
      |.................................................................     |  93%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |...................................................................   |  95%
    ## label: plot_response_scatterplot
    ## 
      |                                                                            
      |....................................................................  |  98%
    ##   ordinary text without R code
    ## 
    ## 
      |                                                                            
      |......................................................................| 100%
    ## label: plot_by_scatterplot
    ## 
    ## "C:/Program Files/RStudio/bin/pandoc/pandoc" +RTS -K512m -RTS "C:/Users/Dell/Documents/projects/blogdown/content/post/2022-08-16-dataexplorer/report.knit.md~" --to html4 --from markdown+autolink_bare_uris+tex_math_single_backslash --output pandoc48402f021561.html --lua-filter "C:\Users\Dell\Documents\R\win-library\4.1\rmarkdown\rmarkdown\lua\pagebreak.lua" --lua-filter "C:\Users\Dell\Documents\R\win-library\4.1\rmarkdown\rmarkdown\lua\latex-div.lua" --self-contained --variable bs3=TRUE --standalone --section-divs --table-of-contents --toc-depth 6 --template "C:\Users\Dell\Documents\R\win-library\4.1\rmarkdown\rmd\h\default.html" --no-highlight --variable highlightjs=1 --variable theme=yeti --mathjax --variable "mathjax-url=https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" --include-in-header "C:\Users\Dell\AppData\Local\Temp\Rtmpq2N8Q8\rmarkdown-str484027c41ca4.html"
