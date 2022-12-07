---
title: Genomic Selection-k折交叉验证可视化
author: guoguo
date: '2022-12-07'
slug: index.zh-cn
categories:
  - Genomic Selection
  - 数据可视化
tags:
  - k-fold cross validation
  - R
  - rsample
  - caret
  - naniar
lastmod: '2022-12-07T23:17:37+08:00'
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
最近参加了有关基因组选择的ASReml-R培训，培训中实现交叉验证的工具和我使用的不同，我使用的是rsample包，属于tidymodels，培训中中使用的是机器学习包caret，这个包了解不多，应该已经被tidymodels包替代。虽然知道交叉验证的基本概念，但这就像一个黑盒子，不清楚到底是怎么分的。同时，我也想比较一下两个R包进行交叉验证划分的训练集和验证集有什么不同。刚好在Wx公众号《R语言和统计》上看到一个可以实现缺失值可视化的R包naniar，那就开始干吧！
</p>

<!--more-->


```r
# load packages
library(caret)
library(rsample)
library(naniar)
library(tidyverse)

# import data
data <- read.csv("C:/Users/Dell/Desktop/phe_gblup.csv")

# head data
head(data)
```

```
##     ID Sex Generation      phe
## 1 1061   F          3 110.0875
## 2 1062   M          3  98.2636
## 3 1063   F          3 106.5717
## 4 1064   F          3 117.0777
## 5 1065   M          3 110.6748
## 6 1066   M          3 121.8752
```

-   使用caret划分训练集和验证集


```r
# caret 5-fold cross-validation
set.seed(123)
w = createFolds(1:length(data$ID),k=5)
id1 = w[[1]]
id2 = w[[2]]
id3 = w[[3]]
id4 = w[[4]]
id5 = w[[5]]

d1 = d2 = d3 = d4 = d5 = data
d1[id1,4] = NA
d2[id2,4] = NA
d3[id3,4] = NA
d4[id4,4] = NA
d5[id5,4] = NA

# head d1
head(d1) #已经将data中phe列的部分值转为NA，其中非NA为训练集，NA部分为验证集
```

```
##     ID Sex Generation      phe
## 1 1061   F          3       NA
## 2 1062   M          3  98.2636
## 3 1063   F          3 106.5717
## 4 1064   F          3       NA
## 5 1065   M          3 110.6748
## 6 1066   M          3       NA
```

```r
# 合并
caret_res = list(d1, d2, d3, d4, d5) %>% 
  reduce(left_join, by = "ID") %>%
  select(1,d1=4,d2=7,d3=10,d4=13,d5=16) %>%
  mutate(d1 = case_when(!is.na(d1) ~ "have", TRUE ~ "empty"),
         d2 = case_when(!is.na(d2) ~ "have", TRUE ~ "empty"),
         d3 = case_when(!is.na(d3) ~ "have", TRUE ~ "empty"),
         d4 = case_when(!is.na(d4) ~ "have", TRUE ~ "empty"),
         d5 = case_when(!is.na(d5) ~ "have", TRUE ~ "empty")) %>%
  mutate(across(everything(), ~na_if(., "empty")))

head(caret_res) #d1到d5都为phe列，只是把非NA替换为have,保持不变;ID列完整无缺失
```

```
##     ID   d1   d2   d3   d4   d5
## 1 1061 <NA> have have have have
## 2 1062 have have <NA> have have
## 3 1063 have have have have <NA>
## 4 1064 <NA> have have have have
## 5 1065 have have have have <NA>
## 6 1066 <NA> have have have have
```

```r
# 使用naniar对缺失值（验证集）可视化
vis_miss(caret_res)
```

<img src="/post/2022-12-07-genomic-selection-k/index.zh-cn_files/figure-html/unnamed-chunk-2-1.png" width="672" />

```r
# 对caret_res排序后再可视化
caret_res %>%
  arrange(d1,d2,d3,d4,d5) %>%
  vis_miss()
```

<img src="/post/2022-12-07-genomic-selection-k/index.zh-cn_files/figure-html/unnamed-chunk-2-2.png" width="672" />

-   使用caret划分训练集和验证集


```r
# rsample 5-fold cross-validation
set.seed(123)
rsample_divide <- data %>%
  mutate(trait = "trait1") %>% #需要使用nest,所以新增一列trait(随便取的)
  pretidy::w2l_nest_df(4, trait) %>%
  mutate(data = map(data, ~filter(., !is.na(value)))) %>%
  mutate(cv_split = map(data, ~vfold_cv(., v = 5, repeats = 1, strata = "value", pool = 0.5, breaks = 4))) %>% 
  unnest_legacy(cv_split) %>%
  mutate(reference = map(splits, training), #提取训练集
         validate = map(splits, testing), .keep = "unused") #提取验证集

head(rsample_divide)
```

```
## # A tibble: 5 x 5
##   name  trait  id    reference            validate          
##   <chr> <chr>  <chr> <list>               <list>            
## 1 phe   trait1 Fold1 <tibble [1,200 x 4]> <tibble [300 x 4]>
## 2 phe   trait1 Fold2 <tibble [1,200 x 4]> <tibble [300 x 4]>
## 3 phe   trait1 Fold3 <tibble [1,200 x 4]> <tibble [300 x 4]>
## 4 phe   trait1 Fold4 <tibble [1,200 x 4]> <tibble [300 x 4]>
## 5 phe   trait1 Fold5 <tibble [1,200 x 4]> <tibble [300 x 4]>
```

```r
a1 = rsample_divide$validate[[1]]
a2 = rsample_divide$validate[[2]]
a3 = rsample_divide$validate[[3]]
a4 = rsample_divide$validate[[4]]
a5 = rsample_divide$validate[[5]]

head(a5)
```

```
## # A tibble: 6 x 4
##      ID Sex   Generation value
##   <int> <chr>      <int> <dbl>
## 1  1062 M              3  98.3
## 2  1063 F              3 107. 
## 3  1077 F              3 132. 
## 4  1080 F              3 118. 
## 5  1085 F              3 131. 
## 6  1088 F              3  76.4
```

```r
rsample_res = list(a1,a2,a3,a4,a5) %>% reduce(full_join, by = "ID") %>%
  select(1,a1=4,a2=7,a3=10,a4=13,a5=16) %>%
  mutate(a1 = case_when(is.na(a1) ~ "have", TRUE ~ "empty"),
         a2 = case_when(is.na(a2) ~ "have", TRUE ~ "empty"),
         a3 = case_when(is.na(a3) ~ "have", TRUE ~ "empty"),
         a4 = case_when(is.na(a4) ~ "have", TRUE ~ "empty"),
         a5 = case_when(is.na(a5) ~ "have", TRUE ~ "empty")) %>%
  mutate(across(everything(), ~na_if(., "empty")))

head(rsample_res)
```

```
## # A tibble: 6 x 6
##      ID a1    a2    a3    a4    a5   
##   <int> <chr> <chr> <chr> <chr> <chr>
## 1  1061 <NA>  have  have  have  have 
## 2  1066 <NA>  have  have  have  have 
## 3  1073 <NA>  have  have  have  have 
## 4  1079 <NA>  have  have  have  have 
## 5  1082 <NA>  have  have  have  have 
## 6  1084 <NA>  have  have  have  have
```

```r
# 使用naniar对缺失值（验证集）可视化
vis_miss(rsample_res)
```

<img src="/post/2022-12-07-genomic-selection-k/index.zh-cn_files/figure-html/unnamed-chunk-3-1.png" width="672" />

-   将caret和rsample结果合并

<p style="text-indent:2em;font-size:;font-family:;">
比较两个R包对训练集和验证集的划分，看起来差不多。我用的rsample比较多，可以调整参数，caret包也可以调节参数使数据集划分的更合理一些。同时，我也有一个疑问，基因组选择中的交叉验证能不能这样直接使用？
</p>


```r
caret_res %>%
  left_join(rsample_res, by = "ID") %>%
  vis_miss()
```

<img src="/post/2022-12-07-genomic-selection-k/index.zh-cn_files/figure-html/unnamed-chunk-4-1.png" width="672" />
