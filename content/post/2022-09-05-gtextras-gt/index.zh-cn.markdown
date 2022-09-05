---
title: gtExtras和gt可视化漂亮的表格-升级
author: guoguo
date: '2022-09-05'
slug: index.zh-cn
categories:
  - 数据可视化
tags:
  - R
  - gtExtras
  - gt
lastmod: '2022-09-05T10:58:29+08:00'
keywords: []
description: ''
comment: no
toc: no
autoCollapseToc: no
contentCopyright: no
reward: no
mathjax: no
---

<p style="text-indent:2em;font-size:;font-family:;">
最近是越来越喜欢使用gtExtras包对data.frame数据分析结果进行可视化了🥰。
</p>

<!--more-->


```r
# load packages
library(pacman)
p_load(tidyverse, rio, gt, gtExtras)

# load data
data_table1 <- import("C:/Users/Dell/Desktop/test/plot-table.xlsx", sheet = 1)
data_table2 <- import("C:/Users/Dell/Desktop/test/plot-table.xlsx", sheet = 2)

# head
head(data_table1)
```

```
##   batch               house      herd      fcr
## 1 第1批 B栋\r\n1-12号测定站 pig_farm1 3.210248
## 2 第1批 B栋\r\n1-12号测定站 pig_farm1 2.645498
## 3 第1批 B栋\r\n1-12号测定站 pig_farm1 2.525288
## 4 第1批 B栋\r\n1-12号测定站 pig_farm1 2.687363
## 5 第1批 B栋\r\n1-12号测定站 pig_farm1 2.568163
## 6 第1批 B栋\r\n1-12号测定站 pig_farm1 2.964931
```

```r
head(data_table2)
```

```
##   batch                house 进站数量 有效数量
## 1 第1批  B栋\r\n1-12号测定站      130      137
## 2 第1批  A栋\r\n1-24号测定站      250      239
## 3 第2批 B栋\r\n13-24号测定站      146       63
## 4 第3批  C栋\r\n1-24号测定站      270      181
## 5 第4批  D栋\r\n1-24号测定站      270       92
```

#### 1. 可视化猪场pig_farm1各批次后备猪的fcr描述性统计


```r
data_table1 %>%
  rename(栋舍 = house, 批次 = batch) %>%
  dplyr::group_by(批次) %>%
  dplyr::summarize(
    数量 = n(),
    平均值 = mean(fcr),
    标准差 = sd(fcr),
    # must end up with list of data for each row in the input dataframe
    fcr数据 = list(fcr),
    .groups = "drop"
  ) %>%
  gt() %>%
  gt_color_rows(平均值, palette = c("green", "red")) %>%
  gtExtras::gt_plt_dist(fcr数据, type = "density", line_color = "blue",
                        fill_color = "red") %>%
  fmt_number(columns = 平均值:标准差, decimals = 2) %>%
  gt_theme_pff() %>%
  #cols_align("center") %>%
  tab_header(
    title = md("**pig_farm1各批次后备猪只fcr描述性统计**")
  ) %>%
  tab_options(data_row.padding = px(3),
              heading.title.font.size = 15,
              heading.align = "center") %>%
  gt::gtsave("C:/Users/Dell/Desktop/plot_table1.png", expand = 50)
```

<img src="/post/2022-09-05-gtextras-gt/index.zh-cn_files/figure-html/unnamed-chunk-2-1.png" width="1152" />

#### 2. 可视化pig_farm1猪场各批次测定站有效测定个体数量


```r
data_table2 %>%
  mutate(`有效百分比(%)` = 100*有效数量/进站数量) %>%
  gt::gt() %>%
  gt_color_rows(`有效百分比(%)`, palette = c("red", "green")) %>%
  fmt_number(columns = `有效百分比(%)`, decimals = 2) %>%
  gt_theme_pff() %>%
  cols_align("center") %>%
  tab_header(
    title = md("**pig_farm1场第1批到第4批有效个体数比列**")
  ) %>%
  tab_options(data_row.padding = px(3),
              heading.title.font.size = 15,
              heading.align = "center") %>%
  gt::gtsave("C:/Users/Dell/Desktop/plot_table2.png", expand = 50)
```

<img src="/post/2022-09-05-gtextras-gt/index.zh-cn_files/figure-html/unnamed-chunk-3-1.png" width="1152" />
