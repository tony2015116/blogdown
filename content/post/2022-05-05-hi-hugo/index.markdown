---
title: Hi Hugo
author: tony
date: '2022-05-05'
slug: []
categories: []
tags: []
lastmod: '2022-05-05T19:59:59+08:00'
keywords: []
description: ''
#comment: yes
#toc: no
#autoCollapseToc: no
#contentCopyright: no
#reward: no
#mathjax: no
---
<!--more-->

```r
summary(Orange)
```

```
##  Tree       age         circumference  
##  3:7   Min.   : 118.0   Min.   : 30.0  
##  1:7   1st Qu.: 484.0   1st Qu.: 65.5  
##  5:7   Median :1004.0   Median :115.0  
##  2:7   Mean   : 922.1   Mean   :115.9  
##  4:7   3rd Qu.:1372.0   3rd Qu.:161.5  
##        Max.   :1582.0   Max.   :214.0
```

```r
library(ggplot2)
```

```
## Warning: 程辑包'ggplot2'是用R版本4.1.1 来建造的
```

```r
plot <- ggplot(Orange, aes(x = age, 
                   y = circumference, 
                   colour = Tree)) +
  geom_point() +
  geom_line() +
  theme_bw()
plot
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-1.png" width="672" />

<!--more-->

```r
par(mar = c(0, 1, 0, 1))
pie(
  c(280, 60, 20),
  c('Sky', 'Sunny side of pyramid', 'Shady side of pyramid'),
  col = c('#0292D8', '#F7EA39', '#C4B632'),
  init.angle = -50, border = NA
)
```

<div class="figure">
<img src="{{< blogdown/postref >}}index_files/figure-html/pie-1.png" alt="A fancy pie chart." width="672" />
<p class="caption">Figure 1: A fancy pie chart.</p>
</div>
