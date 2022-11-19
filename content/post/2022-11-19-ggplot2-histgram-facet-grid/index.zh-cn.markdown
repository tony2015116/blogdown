---
title: ggplot2+histgram+facet_grid
author: guoguo
date: '2022-11-19'
slug: index.zh-cn
categories:
  - 数据可视化
tags:
  - R
  - ggplot2
  - histgram
lastmod: '2022-11-19T20:12:47+08:00'
keywords: []
description: ''
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: no
reward: yes
mathjax: no
---

<p style="text-indent:2em;font-size:;font-family:;">
记录一下使用ggplot2在工作中画多品种多性状表型直方图。这种图的核心是要将多个性状的宽格式数据先转为长格式数据，这样才方便ggplot2进行可视化。
</p>

<!--more-->


```r
# load packages
library(tidyverse)
library(rio)

# import data
data <- import("C:/Users/Dell/Desktop/各品种相关表型.xlsx") #使用模拟数据

# glimpse data
glimpse(data)
```

```
## Rows: 13,416
## Columns: 4
## $ Breed  <chr> "DD", "DD", "DD", "DD", "DD", "DD", "DD", "DD", "DD", "DD", "DD~
## $ Trait1 <dbl> 750.5810, 596.7300, 822.5580, 484.0929, 811.7158, 723.7467, 920~
## $ Trait2 <dbl> 2325.779, 2137.091, 2233.096, 2280.879, 2656.350, 2270.103, 276~
## $ Trait3 <dbl> 2.899071, 3.224258, 2.588030, 4.053632, 3.080667, 2.919407, 2.8~
```

```r
head(data) #该数据是三个表型性状的宽格式数据
```

```
##   Breed   Trait1   Trait2   Trait3
## 1    DD 750.5810 2325.779 2.899071
## 2    DD 596.7300 2137.091 3.224258
## 3    DD 822.5580 2233.096 2.588030
## 4    DD 484.0929 2280.879 4.053632
## 5    DD 811.7158 2656.350 3.080667
## 6    DD 723.7467 2270.103 2.919407
```

```r
# transform wide data to long data
data_long <- data %>%
  pivot_longer(Trait1:Trait3, names_to = "Trait", values_to = "Values") 
head(data_long)
```

```
## # A tibble: 6 x 3
##   Breed Trait   Values
##   <chr> <chr>    <dbl>
## 1 DD    Trait1  751.  
## 2 DD    Trait2 2326.  
## 3 DD    Trait3    2.90
## 4 DD    Trait1  597.  
## 5 DD    Trait2 2137.  
## 6 DD    Trait3    3.22
```

```r
# plot histgram
data_long %>%
  ggplot(aes(Values, fill = Trait)) +
  geom_histogram() +
  facet_grid(Breed~Trait, scales = "free") + 
  theme_minimal() +
  ggsci::scale_fill_aaas() +
  theme(legend.position = "bottom")
```

<img src="/post/2022-11-19-ggplot2-histgram-facet-grid/index.zh-cn_files/figure-html/unnamed-chunk-1-1.png" width="672" />
