---
title: 使用R语言处理多形式字符串格式的日期列
author: guoguo
date: '2022-07-22'
slug: index.zh-cn
categories:
  - 数据处理
tags:
  - R
  - 日期格式
  - 字符串
lastmod: '2022-07-22T18:52:04+08:00'
keywords: []
description: 'R语言处理列为字符串格式的日期数据'
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: "如需转载，请联系作者，谢谢"
reward: yes
mathjax: yes
---

<p style="text-indent:2em;font-size:;font-family:;">
在R语言中读取excel/csv数据的过程中经常会遇到日期格式的列变为了字符串，特别是有的字符串是日期形式，有的字符串是数字形式，出现这种情况很大可能是数据本身整理错误的原因。可以利用case_when()和convert_to_date()函数手动进行处理，将字符串日期转为正常的日期格式。
</p>

<!--more-->


```r
# load packages
library(rio)
library(tidyverse)

# import data
data <- import("C:/Users/Dell/Desktop/test/日期错处处理test.xlsx")

# data head()
head(data)
```

```
##   个体编号 出生日期
## 1   107015    44561
## 2   107016    44561
## 3   107017    44561
## 4   107018    44561
## 5   107019    44561
## 6   107020    44561
```

```r
# data glimpse()
glimpse(data)
```

```
## Rows: 11
## Columns: 2
## $ 个体编号 <dbl> 107015, 107016, 107017, 107018, 107019, 107020, 101351, 101352, 1~
## $ 出生日期 <chr> "44561", "44561", "44561", "44561", "44561", "44561", "2022-05-27~
```

```r
# data process
data %>%
  mutate(出生日期_new = case_when(
    str_detect(出生日期, "-") ~ lubridate::as_date(出生日期),
    TRUE ~ janitor::convert_to_date(出生日期)
  ))
```

```
##    个体编号   出生日期 出生日期_new
## 1    107015      44561   2021-12-31
## 2    107016      44561   2021-12-31
## 3    107017      44561   2021-12-31
## 4    107018      44561   2021-12-31
## 5    107019      44561   2021-12-31
## 6    107020      44561   2021-12-31
## 7    101351 2022-05-27   2022-05-27
## 8    101352 2022-05-27   2022-05-27
## 9    101353 2022-05-27   2022-05-27
## 10   101354 2022-05-27   2022-05-27
## 11   101355 2022-05-27   2022-05-27
```
