---
title: 使用ggplot2画堆叠柱形图
author: 郭猛
date: '2022-07-20'
slug: ggplot2-stacked-bar
aliases:
  - /2022/07/20/index.zh-cn/
categories:
  - 数据可视化
tags:
  - R
  - ggplot2
  - ggsci
lastmod: '2022-07-20T21:01:33+08:00'
keywords: []
description: 'ggplot2画堆叠柱形图'
comment: true
toc: false
autoCollapseToc: false
mathjax: false
---

<p style="text-indent:2em;font-size:;font-family:;">
堆叠柱形图是我日常数据分析中常用的一种可视化图形。它是一种分解整体，比较各部分不同类别的数值的图。在每一类数值内部，又被划分多个子类别并用不同颜色指代，可以同时反应总量和类别结构。以二师兄的数据为例🐷，直接上代码吧😄
</p>

<!--more-->


```r
#load packages
library(tidyverse)
library(rio)
library(ggsci)
library(rstatix)
# import and tidy data
data <- import("C:/Users/Dell/Desktop/test/拉稀仔猪试验统计test.xlsx") %>%
  filter(!is.na(耳号)) %>%
  rename("0" = 2) %>% #将第二列列名改为0
  pivot_longer(3:8, names_to = "time", values_to = "state") %>% #将宽格式数据转为长格式
  mutate(time = str_remove(time, "小时")) %>%
  freq_table(组别, time, state) %>% #按照组别、time和state变量统计次数
  arrange(组别, time)
# 将变量进行排序
data$time <- factor(data$time, levels=c("0", "6", "12", "18", "24", "30", "36"))
data$state <- factor(data$state, levels = c("水样", "稀样", "稠样", "正常"))
# plot
ggplot2::ggplot(data = data, ggplot2::aes(
  y = n, x = time, fill = state
)) +
  ggplot2::theme_bw() +
  ggplot2::geom_col(
    width = 0.8,
    na.rm = F,
    show.legend = T
  ) +
  facet_grid(~组别) + # 按组别变量进行分面
  geom_text(aes(x = time, y = n, label = n, group = state),
            position = position_stack(vjust = .5), size = 3) +
  ggplot2::scale_y_continuous(
    limits = c(0, 13),
    breaks = seq(0, 13, 1)
  ) +
  labs(
    x = "时间(小时)",
    y = "计数(头)"
  ) +
  theme_light() +
  scale_fill_locuszoom() +
  theme(legend.position = "bottom")
```

<img src="/post/2022-07-20-ggplot2/index.zh-cn_files/figure-html/unnamed-chunk-1-1.png" width="672" />
