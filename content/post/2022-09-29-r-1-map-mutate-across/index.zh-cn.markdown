---
title: R函数:map()+mutate()+across()
author: 郭猛
date: '2022-09-29'
slug: map-mutate-across
aliases:
  - /2022/09/29/index.zh-cn/
categories:
  - 数据处理
tags:
  - R
  - tidyverse
  - purrr
lastmod: '2022-09-29T23:08:42+08:00'
keywords: []
description: ''
comment: true
toc: false
autoCollapseToc: false
mathjax: false
---
<p style="text-indent:2em;font-size:;font-family:;">
R中很多常用又很牛掰的函数，还记得在推上有个牛人，每天一个R函数，整整写了一年，最后出了一本书。我在数据处理过程中会遇到很多方便且功能强大的函数，特别是不同R包中函数的组合功能就更加强大了，所以我也有一个想法，将我在数据处理过程中使用到的强大的R函数或函数组合也记录下来，不是每天一个函数，而是遇到哪个写哪个🤭。
</p>
<!--more-->
<p style="text-indent:2em;font-size:;font-family:;">
今日想分享一下列表中数据框变量类型的转换或其它类型，涉及purrr中的map()函数，dplyr中的mutate()函数和across()函数。如果仅仅是mutate()和across()函数，dplyr的reference都有详细介绍，这里是借助map()函数应用到列表中。
</p>

```r
# load packages
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.2 --
## v ggplot2 3.3.6     v purrr   0.3.4
## v tibble  3.1.8     v dplyr   1.0.9
## v tidyr   1.2.0     v stringr 1.4.0
## v readr   2.1.2     v forcats 0.5.1
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
# iris str
str(iris)
```

```
## 'data.frame':	150 obs. of  5 variables:
##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

```r
# 将列表中factor类型的Species和double类型的Petal.Length、Petal.Width变量转为字符串型
# group_split()
iris %>%
  group_by(Species) %>%
  group_split() %>%
  map(mutate, across(where(is.factor) | !c(Sepal.Length, Sepal.Width), as.character))
```

```
## [[1]]
## # A tibble: 50 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl> <chr>        <chr>       <chr>  
##  1          5.1         3.5 1.4          0.2         setosa 
##  2          4.9         3   1.4          0.2         setosa 
##  3          4.7         3.2 1.3          0.2         setosa 
##  4          4.6         3.1 1.5          0.2         setosa 
##  5          5           3.6 1.4          0.2         setosa 
##  6          5.4         3.9 1.7          0.4         setosa 
##  7          4.6         3.4 1.4          0.3         setosa 
##  8          5           3.4 1.5          0.2         setosa 
##  9          4.4         2.9 1.4          0.2         setosa 
## 10          4.9         3.1 1.5          0.1         setosa 
## # ... with 40 more rows
## # i Use `print(n = ...)` to see more rows
## 
## [[2]]
## # A tibble: 50 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species   
##           <dbl>       <dbl> <chr>        <chr>       <chr>     
##  1          7           3.2 4.7          1.4         versicolor
##  2          6.4         3.2 4.5          1.5         versicolor
##  3          6.9         3.1 4.9          1.5         versicolor
##  4          5.5         2.3 4            1.3         versicolor
##  5          6.5         2.8 4.6          1.5         versicolor
##  6          5.7         2.8 4.5          1.3         versicolor
##  7          6.3         3.3 4.7          1.6         versicolor
##  8          4.9         2.4 3.3          1           versicolor
##  9          6.6         2.9 4.6          1.3         versicolor
## 10          5.2         2.7 3.9          1.4         versicolor
## # ... with 40 more rows
## # i Use `print(n = ...)` to see more rows
## 
## [[3]]
## # A tibble: 50 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species  
##           <dbl>       <dbl> <chr>        <chr>       <chr>    
##  1          6.3         3.3 6            2.5         virginica
##  2          5.8         2.7 5.1          1.9         virginica
##  3          7.1         3   5.9          2.1         virginica
##  4          6.3         2.9 5.6          1.8         virginica
##  5          6.5         3   5.8          2.2         virginica
##  6          7.6         3   6.6          2.1         virginica
##  7          4.9         2.5 4.5          1.7         virginica
##  8          7.3         2.9 6.3          1.8         virginica
##  9          6.7         2.5 5.8          1.8         virginica
## 10          7.2         3.6 6.1          2.5         virginica
## # ... with 40 more rows
## # i Use `print(n = ...)` to see more rows
```

```r
# group_nest()
iris %>%
  group_by(Species) %>%
  group_nest() %>%
  mutate(data = map(data, mutate, across(where(is.factor) | !c(Sepal.Length, Sepal.Width), as.character))) %>%
  unnest(data)
```

```
## # A tibble: 150 x 5
##    Species Sepal.Length Sepal.Width Petal.Length Petal.Width
##    <fct>          <dbl>       <dbl> <chr>        <chr>      
##  1 setosa           5.1         3.5 1.4          0.2        
##  2 setosa           4.9         3   1.4          0.2        
##  3 setosa           4.7         3.2 1.3          0.2        
##  4 setosa           4.6         3.1 1.5          0.2        
##  5 setosa           5           3.6 1.4          0.2        
##  6 setosa           5.4         3.9 1.7          0.4        
##  7 setosa           4.6         3.4 1.4          0.3        
##  8 setosa           5           3.4 1.5          0.2        
##  9 setosa           4.4         2.9 1.4          0.2        
## 10 setosa           4.9         3.1 1.5          0.1        
## # ... with 140 more rows
## # i Use `print(n = ...)` to see more rows
```

```r
# 将列表中double类型且变量不为Sepal.Length、Sepal.Width的列四舍五入到给定位数
# group_split()
iris %>%
  group_by(Species) %>%
  group_split() %>%
  map(mutate, across(where(is.double) & !c(Sepal.Length, Sepal.Width), round, digits = 0))
```

```
## [[1]]
## # A tibble: 50 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
##  1          5.1         3.5            1           0 setosa 
##  2          4.9         3              1           0 setosa 
##  3          4.7         3.2            1           0 setosa 
##  4          4.6         3.1            2           0 setosa 
##  5          5           3.6            1           0 setosa 
##  6          5.4         3.9            2           0 setosa 
##  7          4.6         3.4            1           0 setosa 
##  8          5           3.4            2           0 setosa 
##  9          4.4         2.9            1           0 setosa 
## 10          4.9         3.1            2           0 setosa 
## # ... with 40 more rows
## # i Use `print(n = ...)` to see more rows
## 
## [[2]]
## # A tibble: 50 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species   
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>     
##  1          7           3.2            5           1 versicolor
##  2          6.4         3.2            4           2 versicolor
##  3          6.9         3.1            5           2 versicolor
##  4          5.5         2.3            4           1 versicolor
##  5          6.5         2.8            5           2 versicolor
##  6          5.7         2.8            4           1 versicolor
##  7          6.3         3.3            5           2 versicolor
##  8          4.9         2.4            3           1 versicolor
##  9          6.6         2.9            5           1 versicolor
## 10          5.2         2.7            4           1 versicolor
## # ... with 40 more rows
## # i Use `print(n = ...)` to see more rows
## 
## [[3]]
## # A tibble: 50 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species  
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>    
##  1          6.3         3.3            6           2 virginica
##  2          5.8         2.7            5           2 virginica
##  3          7.1         3              6           2 virginica
##  4          6.3         2.9            6           2 virginica
##  5          6.5         3              6           2 virginica
##  6          7.6         3              7           2 virginica
##  7          4.9         2.5            4           2 virginica
##  8          7.3         2.9            6           2 virginica
##  9          6.7         2.5            6           2 virginica
## 10          7.2         3.6            6           2 virginica
## # ... with 40 more rows
## # i Use `print(n = ...)` to see more rows
```

```r
# group_nest()
iris %>%
  group_by(Species) %>%
  group_nest() %>%
  mutate(data = map(data, mutate, across(where(is.double) & !c(Sepal.Length, Sepal.Width), round, digits = 0))) %>%
  unnest(data)
```

```
## # A tibble: 150 x 5
##    Species Sepal.Length Sepal.Width Petal.Length Petal.Width
##    <fct>          <dbl>       <dbl>        <dbl>       <dbl>
##  1 setosa           5.1         3.5            1           0
##  2 setosa           4.9         3              1           0
##  3 setosa           4.7         3.2            1           0
##  4 setosa           4.6         3.1            2           0
##  5 setosa           5           3.6            1           0
##  6 setosa           5.4         3.9            2           0
##  7 setosa           4.6         3.4            1           0
##  8 setosa           5           3.4            2           0
##  9 setosa           4.4         2.9            1           0
## 10 setosa           4.9         3.1            2           0
## # ... with 140 more rows
## # i Use `print(n = ...)` to see more rows
```

