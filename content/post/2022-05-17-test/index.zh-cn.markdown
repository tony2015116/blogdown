---
title: test
author: tony
date: '2022-05-17'
slug: index.zh-cn
categories:
  - 技能
tags:
  - R
lastmod: '2022-05-17T15:57:34+08:00'
keywords: []
description: ''
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: no
reward: no
mathjax: no
---

```r
summary(iris)
```

```
##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
##        Species  
##  setosa    :50  
##  versicolor:50  
##  virginica :50  
##                 
##                 
## 
```

```r
knitr::kable(
  head(mtcars[, 1:8], 10), booktabs = TRUE,
  caption = 'A table of the first 10 rows of the mtcars data.'
)
```



Table: Table 1: A table of the first 10 rows of the mtcars data.

|                  |  mpg| cyl|  disp|  hp| drat|    wt|  qsec| vs|
|:-----------------|----:|---:|-----:|---:|----:|-----:|-----:|--:|
|Mazda RX4         | 21.0|   6| 160.0| 110| 3.90| 2.620| 16.46|  0|
|Mazda RX4 Wag     | 21.0|   6| 160.0| 110| 3.90| 2.875| 17.02|  0|
|Datsun 710        | 22.8|   4| 108.0|  93| 3.85| 2.320| 18.61|  1|
|Hornet 4 Drive    | 21.4|   6| 258.0| 110| 3.08| 3.215| 19.44|  1|
|Hornet Sportabout | 18.7|   8| 360.0| 175| 3.15| 3.440| 17.02|  0|
|Valiant           | 18.1|   6| 225.0| 105| 2.76| 3.460| 20.22|  1|
|Duster 360        | 14.3|   8| 360.0| 245| 3.21| 3.570| 15.84|  0|
|Merc 240D         | 24.4|   4| 146.7|  62| 3.69| 3.190| 20.00|  1|
|Merc 230          | 22.8|   4| 140.8|  95| 3.92| 3.150| 22.90|  1|
|Merc 280          | 19.2|   6| 167.6| 123| 3.92| 3.440| 18.30|  1|
knitr::kable(
  head(mtcars[, 1:8], 10), booktabs = TRUE,
  caption = 'A table of the first 10 rows of the mtcars data.'
)
