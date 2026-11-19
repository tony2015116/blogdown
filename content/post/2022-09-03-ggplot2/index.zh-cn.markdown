---
title: "ggplot2漂亮的条形图和直方图-升级"
author: "郭猛"
date: "2022-09-03"
slug: "ggplot2-bar-histogram"
aliases:
  - "/2022/09/03/index.zh-cn/"
categories:
  - "数据可视化"
tags:
  - "ggplot2"
  - "直方图"
  - "柱状图"
series:
  - "ggplot2-histogram"
description: "在实际使用中继续完善 ggplot2 条形图和直方图的样式。"
lastmod: "2022-09-03T20:03:19+08:00"
keywords: []
comment: false
toc: false
autoCollapseToc: false
mathjax: false
---
我之前是写过关于bar plot和histgram plot的博客的，但是在实际应用的过程中总是忍不住要完善它们，让它们变得更漂亮一些😅。在这个过程中，还是有一些收获，对一些参数的使用更加清晰了。

<!--more-->

#### 1. bar plot

```r
# load packages
library(pacman)
p_load(tidyverse, rio, gt, gtExtras, ggsci)

# load data
data_bar <- import("C:/Users/Dell/Desktop/test/bar-hist-plot.xlsx", sheet = 1)
data_hist <- import("C:/Users/Dell/Desktop/test/bar-hist-plot.xlsx", sheet = 2)

# head
head(data_bar)
```

```
##   batch                house    types values
## 1 第1批  A栋\r\n1-12号测定站   总数量    133
## 2 第1批  A栋\r\n1-12号测定站 有效数量    130
## 3 第1批  B栋\r\n1-24号测定站   总数量    244
## 4 第1批  B栋\r\n1-24号测定站 有效数量    229
## 5 第2批 A栋\r\n13-24号测定站   总数量    132
## 6 第2批 A栋\r\n13-24号测定站 有效数量     60
```

```r
head(data_hist)
```

```
##   batch               house   mean_w
## 1 第1批 A栋\r\n1-12号测定站 43.54286
## 2 第1批 A栋\r\n1-12号测定站 43.40000
## 3 第1批 A栋\r\n1-12号测定站 45.83750
## 4 第1批 A栋\r\n1-12号测定站 48.17778
## 5 第1批 A栋\r\n1-12号测定站 34.45000
## 6 第1批 A栋\r\n1-12号测定站 31.70000
```

#### 2. histgram plot

```r
data_bar %>%
  ggplot(aes(house, values, fill = types)) +
  geom_col(width = .5, position = position_dodge(.5),
           color = "black") +
  scale_y_continuous(expand = expansion(0),
                     limits = c(0, 360),
                     breaks = seq(0, 360, 20)) +
  #facet_grid(.~batch) +
  geom_text(aes(x = house, y = values, label = values, group = types),
            position = position_dodge(0.5),
            color = "black",
            size = 5,
            vjust = 1.5) +
  geom_text(aes(x = house, y = values, label = batch, group = types),
            position = position_dodge(0.5),
            color = "black",
            size = 5,
            vjust = -0.5) +
  ggsci::scale_fill_futurama() +
  #scale_fill_grey() +
  #scale_fill_brewer(palette="Set1")
  #scale_fill_manual(values = c("#FAFAFA", "#D4D4D4", "#737373")) +
  labs(
    y = "数量",
    x = ""
  ) +
  theme(
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    panel.background = element_blank(),
    plot.title = element_text(size = 22, face = "bold",
                              hjust = 0.5,
                              margin = margin(b = 15)),
    axis.line = element_line(color = "black"),
    axis.title = element_text(size = 22, color = "black",
                              face = "bold"),
    axis.text = element_text(size = 22, color = "black"),
    axis.text.x = element_text(margin = margin(t = 10)),
    axis.text.y = element_text(size = 17),
    axis.title.y = element_text(margin = margin(r = 10)),
    axis.ticks.x = element_blank(),
    legend.title = element_blank(),
    legend.position = c(.6, 0.95),
    legend.background = element_rect(color = "black"),
    legend.text = element_text(size = 15),
    legend.margin = margin(t = 5, l = 5, r = 5, b = 5),
    legend.key = element_rect(color = NA, fill = NA)
  ) +
  guides(
    fill = guide_legend(
      keywidth = 1,
      keyheight = 1,
      default.unit= "cm"
    )
  )
```

<img src="/post/2022-09-03-ggplot2/index.zh-cn_files/figure-html/unnamed-chunk-2-1.png" width="1152" />

```r
p1 <- data_hist %>%
  ggplot(aes(x = mean_w, fill = house)) +
  geom_histogram(bins = 70) +
  facet_grid(batch~., scales = "free") +
  scale_x_continuous(breaks = seq(0, 100, 5),limits = (c(0, 100))) +
  ggsci::scale_fill_locuszoom()
summ1 <- data_hist %>%
  group_by(batch) %>%
  rstatix::get_summary_stats(mean_w, type = "common") %>%
  mutate_at(4:11, round, digits=2) %>%
  select(batch, n, min, max, median, mean_all = mean, sd) %>%
  mutate(lab = paste("n = ", n,"; mean = ", mean_all), position=c(80),
         lab2 = c(NA, NA, NA, "进站体重较大")) %>%
  select(batch, mean_all, lab, position, lab2)

p1 +
  geom_text(data = summ1, aes(x=position, y=Inf, label = lab), hjust=0, vjust=3.5, size=4, color = "black", inherit.aes = F) +
  geom_text(data = summ1, aes(x = 15, y = Inf, label = lab2), hjust=0, vjust=2.5, size=6, color = "red", inherit.aes = F) +
  geom_vline(data = summ1, aes(xintercept = mean_all), size=1, color = "purple") +
  theme_minimal()+
  labs(y = "计数",title = "**场各批测定站猪只进站体重",x = "进站体重（kg）") +
  theme(axis.title.x = element_text(vjust=0),
        axis.title.y = element_text(vjust=1),
        plot.title = element_text(color = "black", size = 20, face = "bold", vjust = 0.5, hjust = 0.5),
        strip.text = element_text(size = 15, face = "bold"),
        axis.title = element_text( size = 15, face = "bold" ),
        legend.position = "bottom",
        legend.title = element_blank()

  )
```

<img src="/post/2022-09-03-ggplot2/index.zh-cn_files/figure-html/unnamed-chunk-3-1.png" width="960" />
