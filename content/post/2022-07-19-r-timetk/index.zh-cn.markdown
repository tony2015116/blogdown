---
title: 漂亮的时间序列可视化R包timetk
author: guoguo
date: '2022-07-19'
slug: index.zh-cn
categories:
  - 数据可视化
tags:
  - R
  - 时间序列
lastmod: '2022-07-19T22:45:52+08:00'
keywords: []
description: 'R语言时间序列可视乎'
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: "如需转载，请联系作者，谢谢"
reward: yes
mathjax: yes
---

<p style="text-indent:2em;font-size:;font-family:;">
timetk包做出的时间序列可视化非常漂亮！😍
</p>

<!--more-->

<p style="text-indent:2em;font-size:;font-family:;">
使用timetk包对环境监控数据进行时间序列可视化的过程中有几个重要的步骤。先使用rio包读取数据；使用tidyverse包对数据进行整理，转变数据类型，将宽格式数据转为长格式数据；按照分组变量进行分组，再使用timetk中的函数plot_time_series做时间序列图，函数参数可以参考timetk的reference，横坐标按照日进行break，横坐标标签以月-日格式展示。
</p>


```r
library(tidyverse)
library(rio)
library(timetk)
library(janitor)
data <- import("C:/Users/Dell/Downloads/test/timetk_test.xls")
data %>%
  mutate(采集时间 = str_remove(采集时间, ".0$")) %>%
  mutate(across(5:9, as.double)) %>% #将5到9列转为数字类型
  mutate_at("采集时间", convert_to_datetime) %>% #使用convert_to_datetime函数将字符串转为日期时间格式
  pivot_longer(5:9, names_to = "item", values_to = "value") %>% #将宽格式数据转为长格式数据
  group_by(item) %>%
  plot_time_series(采集时间, value,
                       .color_var = lubridate::day(采集时间),
                       .interactive = FALSE,
                       .facet_ncol = 2,
                       .facet_scales = "free",
                       .smooth = FALSE,
                       .smooth_size = 0.15,
                       .legend_show = FALSE,
                       .line_size = 0.3,
                       .title = "环境参数可视化(R语言)",
                       .x_lab = "日期",
                       .y_lab = "各监控项的值"
                       ) +
  scale_y_continuous(labels = scales::comma_format()) +
  scale_x_datetime(date_breaks = "1 day",  labels = scales::date_format("%m-%d")) +
  theme(axis.text.x = element_text(angle = -90, hjust = 1))
```

<img src="/post/2022-07-19-r-timetk/index.zh-cn_files/figure-html/unnamed-chunk-1-1.png" width="672" />
