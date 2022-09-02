---
title: 利用gtExtras包做漂亮的描述性统计
author: guoguo
date: '2022-09-02'
slug: index.zh-cn
categories:
  - 数据分析
tags:
  - R
  - gtExtras
  - gt
lastmod: '2022-09-02T17:56:04+08:00'
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
之前有介绍过gtExtras包，结合gt包能发挥出了1+1>2的效果。在做月度总结汇报中需要用到比较漂亮的描述性统计图表，为了方便后续其它分析中继续用到，现整理代码，以iris数据集为示例，对变量Sepal.Length进行描述性统计。
</p>
<!--more-->

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

