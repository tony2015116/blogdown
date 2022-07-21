---
title: ggplot2实现带统计量可高亮的直方图
author: guoguo
date: '2022-07-21'
slug: index.zh-cn
categories:
  - 数据可视化
tags:
  - R
  - ggplot2
lastmod: '2022-07-21T22:56:04+08:00'
keywords: []
description: 'ggplot2实现选定时间段在总时间段内分组单变量直方图可视化'
comment: no
toc: no
autoCollapseToc: no
contentCopyright: "如需转载，请联系作者，谢谢"
reward: yes
mathjax: yes
---

<p style="text-indent:2em;font-size:;font-family:;">
老板让我对这个月猪只的某个连续型性状表型和过去一个季度的该性状表型作比较，我改怎么做呢？对于展示连续型数据，我选择使用ggplot2中的直方图，凸显数据选择使用gghighlight包。但这样就完了么？直方图虽然可以一目了然的看出选定时间段在整个时间段的分布情况，但却无法清晰的知道各统计量的数值，那么，我在直方图上加上各统计量呢🤔顺便再加上两条平均值线。
</p>

<!--more-->


```r
# load packages
library(tidyverse)
library(rio)
library(gghighlight)

# data import
data <- import("C:/Users/Dell/Desktop/test/分组单变量直方图及统计量test.XLSX")

# plot
histgram_plot <- ggplot(data, aes(x = 性状表型值, color = 品种)) +
  geom_histogram(binwidth = 0.05) +
  facet_grid(品种 ~ .) +
  scale_color_manual(values=c("#00AFBB", "#E7B800", "#FC4E07"))+
  scale_x_continuous(limits = c(100, 300),breaks = seq(100,300, 5)) +
  gghighlight(结测日期 > as.Date("2022-06-01") & 结测日期 < as.Date("2022-06-30"),calculate_per_facet = TRUE)

# 总体数据统计量
summ1 <- data %>%
  group_by(品种) %>%
  rstatix::get_summary_stats(性状表型值, type = "common") %>%
  mutate_at(4:11, round, digits=2) %>%
  select(品种, n, min, max, median, mean_all = mean, sd) %>%
  mutate(lab = paste("总体数据统计:","\nn = ", n,"\nmin = ", min, "\nmax = ", max, "\nmedian = ", median, "\nmean = ", mean_all,"\nsd = ", sd),
         position=c(233)) %>%
  select(品种, mean_all, lab, position)

# 目标数据统计量
summ2 <- data %>%
  filter(结测日期 > as.Date("2022-06-01") & 结测日期 < as.Date("2022-06-30")) %>%
  group_by(品种) %>%
  rstatix::get_summary_stats(性状表型值, type = "common") %>%
  mutate_at(4:11, round, digits=2) %>%
  select(品种, n, min, max, median, mean_filter = mean, sd) %>%
  mutate(lab_filter = paste("选定数据统计:","\nn = ", n,"\nmin = ", min, "\nmax = ", max, "\nmedian = ", median, "\nmean = ", mean_filter,"\nsd = ", sd),
         position_filter=c(273)) %>%
  select(品种, mean_filter, lab_filter, position_filter)

summ3 <- summ1 %>%
  left_join(summ2)

# 将统计量图层添加到histgram_plot中
histgram_plot + 
  geom_text(data = summ3, aes(x=position, label = lab), y=Inf, hjust=0, vjust=1.1, size=3.5, color = "black") +
  geom_text(data = summ3, aes(x=position_filter, label = lab_filter), y=Inf, hjust=0, vjust=1.1, size=3.5, color = "black") +
  geom_vline(data = summ3, aes(xintercept = mean_all, color = breed), size=.7, color = "red") +
  geom_vline(data = summ3, aes(xintercept = mean_filter, color = breed), size=.7, color = "blue") +
  theme_minimal() + #theme_economist() +
  labs(y = "count",title = paste0("2022-06-01","~","2022-06-30","范围内猪场1","目标性状表型值","基本情况统计")) +
  theme(axis.title.x = element_text(vjust=-1),
        axis.title.y = element_text(vjust=+3),
        plot.title = element_text(color = "black", size = 18, face = "bold", vjust = 0, hjust = 0.5),
        strip.text = element_text(size = 15, face = "bold"),
        axis.title = element_text( size = 15, face = "bold" )
  )
```

<img src="/post/2022-07-21-ggplot2/index.zh-cn_files/figure-html/unnamed-chunk-1-1.png" width="1056" />
