---
title: R语言中数据的读取和导出
author: guoguo
date: '2022-07-28'
slug: index.zh-cn
categories:
  - 数据读取和导出
tags:
  - R
  - purrr
  - readxl
  - rio
lastmod: '2022-07-28T22:37:14+08:00'
keywords: []
description: 'R语言中实现数据的批量读取和导出'
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: "如需转载，请联系作者，谢谢"
reward: yes
mathjax: yes
---

<p style="text-indent:2em;font-size:;font-family:;">
在R语言中，我总结了比较常用的几种批量读取数据和导出数据的方式。主要是将常用的数据读取和导出R包和基础函数结合purrr包实现批量的读取和导出数据。
</p>

<!--more-->

<div style="float: left; clear: both;" align="left">
<img src="images/icon-rio_readxl_purrr.png" width="30%" alt="" align=right hspace="5" vspace="5"/>
<p style="text-indent:2em;font-size:;font-family:;">
数据的读取和导出是数据分析中重要的一环，做数据分析，要先学会如何读取数据，分析完成后要知道结果如何导出。readxl中的read_excel函数；rio中的import、import_list函数；readr中的read_csv函数；vroom中的vroom函数；data.table中的fread函数；基础函数read.table、read.csv都是比较常用的数据读取函数。rio中的export、export_list函数；readr中的write_csv函数；基础函数write.table、write.csv是常用的数据导出函数。这些R包中还有很多读取、导出各种格式的函数或其它R包中未介绍到的函数。我日常数据分析工作中比较常见的数据格式是.xlsx、.csv和.txt，所以上述介绍到的函数是完全足够我使用的。单个的数据读取基本就不用介绍了，参考各个R包的Reference中的列子足以。下面介绍一下怎么批量读取或导出数据。
</p>
</div>

<p style="text-indent:2em;font-size:;font-family:;">
在介绍如何批量读取数据之前，我们先介绍如何批量数据数据，也方便生成示列数据供后面介绍批量读取。这里我们使用R中自带的iris数据集，中文名叫安德森鸢尾花卉数据集。iris数据集中有三个品种的鸢尾花（第5列），每个样本包含了花萼长度、花萼宽度、花瓣长度、花瓣宽度四个特征（前4列）。
</p>


```r
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```


```r
# load packages
library(tidyverse) #使用其中的purrr
library(readxl)
library(rio)
library(fs) #利用其中的dir_ls函数，其作用和list.files一样
library(gt)
```

#### 一、批量导出数据

##### 方法1：使用group()和group_walk()函数，导出.csv和.pdf文件


```r
# 批量导出csv文件
iris %>%
  group_by(Species) %>%
  group_walk(~ write_csv(.x, paste0("C:/Users/Dell/Downloads/data/test/", .y$Species, ".csv")))

list.files("C:/Users/Dell/Downloads/data/test", pattern = ".csv", full.names = TRUE)
```

```
## [1] "C:/Users/Dell/Downloads/data/test/setosa.csv"    
## [2] "C:/Users/Dell/Downloads/data/test/versicolor.csv"
## [3] "C:/Users/Dell/Downloads/data/test/virginica.csv"
```

```r
# 批量导出pdf文件
iris %>%
  group_by(Species) %>%
  group_walk(~ .x %>%
               gt() %>%
               gtsave(.,
                      filename = paste0("C:/Users/Dell/Downloads/data/test/", .y$Species, ".pdf"),
                      zoom = .85))

list.files("C:/Users/Dell/Downloads/data/test", pattern = ".pdf", full.names = TRUE)
```

```
## [1] "C:/Users/Dell/Downloads/data/test/setosa.pdf"    
## [2] "C:/Users/Dell/Downloads/data/test/versicolor.pdf"
## [3] "C:/Users/Dell/Downloads/data/test/virginica.pdf"
```

##### 方法2：使用nest()和pwalk()函数，导出.xlsx文件


```r
iris %>%    
  nest(-Species) %>%    
  pwalk(~rio::export(x = .y, file = paste0("C:/Users/Dell/Downloads/data/test/", .x, ".xlsx")))

list.files("C:/Users/Dell/Downloads/data/test", pattern = ".xlsx", full.names = TRUE)
```

```
## [1] "C:/Users/Dell/Downloads/data/test/iris.xlsx"      
## [2] "C:/Users/Dell/Downloads/data/test/setosa.xlsx"    
## [3] "C:/Users/Dell/Downloads/data/test/versicolor.xlsx"
## [4] "C:/Users/Dell/Downloads/data/test/virginica.xlsx"
```

##### 方法3：针对列表，使用names()和walk()函数，导出.txt文件


```r
# method1生成列表
setosa <- iris %>%
  filter(Species == "setosa")
versicolor <- iris %>%
  filter(Species == "versicolor")
virginica <- iris %>%
  filter(Species == "virginica")

iris_list <- list(setosa = setosa, versicolor = versicolor, virginica = virginica)

# method2生成列表
iris_list <- iris %>%
  group_split(Species) %>%
  set_names("setosa", "versicolor", "virginica")

# 导出
iris_list %>%
  names(.) %>%
  walk(~write.table(iris_list[[.]], paste0("C:/Users/Dell/Downloads/data/test/",.,".txt"), row.names = F, sep = "\t", quote = F))

list.files("C:/Users/Dell/Downloads/data/test", pattern = ".txt", full.names = TRUE)
```

```
## [1] "C:/Users/Dell/Downloads/data/test/setosa.txt"    
## [2] "C:/Users/Dell/Downloads/data/test/versicolor.txt"
## [3] "C:/Users/Dell/Downloads/data/test/virginica.txt"
```

##### 方法4：针对列表，使用rio包的export()或export_list()函数一步到位


```r
# 将列表iris_list(方法3)导出到一个.xlsx中，列表名为sheet名
rio::export(iris_list, "C:/Users/Dell/Downloads/data/test/iris.xlsx")
# 将iris_list导出多个csv文件，文件名为分别为列表名
rio::export_list(iris_list, file = "C:/Users/Dell/Downloads/data/test/%s.csv")
```

#### 二、批量导入数据


```r
# 后面文件读取都已.xlsx格式文件为列
all_files <- dir_ls("C:/Users/Dell/Downloads/data/test/read_data/",glob = "*xlsx")
#all_files <- list.files(pattern = ".xlsx", full.names = T)
```

##### 方法1：使用import_list()函数


```r
data <- rio::import_list(all_files, rbind = T, rbind_label = "Species")
head(data)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width
## 1          5.1         3.5          1.4         0.2
## 2          4.9         3.0          1.4         0.2
## 3          4.7         3.2          1.3         0.2
## 4          4.6         3.1          1.5         0.2
## 5          5.0         3.6          1.4         0.2
## 6          5.4         3.9          1.7         0.4
##                                                   Species
## 1 C:/Users/Dell/Downloads/data/test/read_data/setosa.xlsx
## 2 C:/Users/Dell/Downloads/data/test/read_data/setosa.xlsx
## 3 C:/Users/Dell/Downloads/data/test/read_data/setosa.xlsx
## 4 C:/Users/Dell/Downloads/data/test/read_data/setosa.xlsx
## 5 C:/Users/Dell/Downloads/data/test/read_data/setosa.xlsx
## 6 C:/Users/Dell/Downloads/data/test/read_data/setosa.xlsx
```

##### 方法2：读取多个.xlsx并合并


```r
# 下面两种写法都可以, 可以添加read_excel相关的参数
data <- map(all_files, read_excel, col_types = rep("guess", 4)) %>%
  bind_rows(.id = "Species")
head(data)
```

```
## # A tibble: 6 x 5
##   Species                      Sepal.Length Sepal.Width Petal.Length Petal.Width
##   <chr>                               <dbl>       <dbl>        <dbl>       <dbl>
## 1 C:/Users/Dell/Downloads/dat~          5.1         3.5          1.4         0.2
## 2 C:/Users/Dell/Downloads/dat~          4.9         3            1.4         0.2
## 3 C:/Users/Dell/Downloads/dat~          4.7         3.2          1.3         0.2
## 4 C:/Users/Dell/Downloads/dat~          4.6         3.1          1.5         0.2
## 5 C:/Users/Dell/Downloads/dat~          5           3.6          1.4         0.2
## 6 C:/Users/Dell/Downloads/dat~          5.4         3.9          1.7         0.4
```

```r
data <- map(all_files, ~read_excel(., col_types = rep("guess", 4))) %>%
  bind_rows(.id = "Species")
head(data)
```

```
## # A tibble: 6 x 5
##   Species                      Sepal.Length Sepal.Width Petal.Length Petal.Width
##   <chr>                               <dbl>       <dbl>        <dbl>       <dbl>
## 1 C:/Users/Dell/Downloads/dat~          5.1         3.5          1.4         0.2
## 2 C:/Users/Dell/Downloads/dat~          4.9         3            1.4         0.2
## 3 C:/Users/Dell/Downloads/dat~          4.7         3.2          1.3         0.2
## 4 C:/Users/Dell/Downloads/dat~          4.6         3.1          1.5         0.2
## 5 C:/Users/Dell/Downloads/dat~          5           3.6          1.4         0.2
## 6 C:/Users/Dell/Downloads/dat~          5.4         3.9          1.7         0.4
```

##### 方法3：读取多个.xlsx并合并


```r
data <- map_dfr(all_files, readxl::read_excel, col_names = TRUE, .id = "Species")
head(data)
```

```
## # A tibble: 6 x 5
##   Species                      Sepal.Length Sepal.Width Petal.Length Petal.Width
##   <chr>                               <dbl>       <dbl>        <dbl>       <dbl>
## 1 C:/Users/Dell/Downloads/dat~          5.1         3.5          1.4         0.2
## 2 C:/Users/Dell/Downloads/dat~          4.9         3            1.4         0.2
## 3 C:/Users/Dell/Downloads/dat~          4.7         3.2          1.3         0.2
## 4 C:/Users/Dell/Downloads/dat~          4.6         3.1          1.5         0.2
## 5 C:/Users/Dell/Downloads/dat~          5           3.6          1.4         0.2
## 6 C:/Users/Dell/Downloads/dat~          5.4         3.9          1.7         0.4
```

```r
data <- map_dfr(all_files, rio::import, .id = "Species") %>%
  # 将Species列的路径信息去除，仅保留文件名
  mutate(Species = str_replace(Species, ".*/", ""),
         Species = str_replace(Species, "\\.xlsx", ""))
head(data)
```

```
##   Species Sepal.Length Sepal.Width Petal.Length Petal.Width
## 1  setosa          5.1         3.5          1.4         0.2
## 2  setosa          4.9         3.0          1.4         0.2
## 3  setosa          4.7         3.2          1.3         0.2
## 4  setosa          4.6         3.1          1.5         0.2
## 5  setosa          5.0         3.6          1.4         0.2
## 6  setosa          5.4         3.9          1.7         0.4
```

##### 方法4：读取读个csv并合并


```r
# vroom 好像无法读取xlsx
all_files_vroom <- dir_ls("C:/Users/Dell/Downloads/data/test/",glob = "*csv")
data <- vroom::vroom(all_files_vroom, id = "herd", delim = ",")
head(data)
```

```
## # A tibble: 6 x 6
##   herd                 Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##   <chr>                       <dbl>       <dbl>        <dbl>       <dbl> <chr>  
## 1 C:/Users/Dell/Downl~          5.1         3.5          1.4         0.2 setosa 
## 2 C:/Users/Dell/Downl~          4.9         3            1.4         0.2 setosa 
## 3 C:/Users/Dell/Downl~          4.7         3.2          1.3         0.2 setosa 
## 4 C:/Users/Dell/Downl~          4.6         3.1          1.5         0.2 setosa 
## 5 C:/Users/Dell/Downl~          5           3.6          1.4         0.2 setosa 
## 6 C:/Users/Dell/Downl~          5.4         3.9          1.7         0.4 setosa
```

##### 方法5：读取一个.xlsx多个sheet为列表


```r
# 读取为列表
path <- "C:/Users/Dell/Downloads/data/test/iris.xlsx"
data <- path %>%
  excel_sheets() %>%
  set_names() %>%
  map(read_excel, path = path)
str(data)
```

```
## List of 3
##  $ setosa    : tibble [50 x 5] (S3: tbl_df/tbl/data.frame)
##   ..$ Sepal.Length: num [1:50] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##   ..$ Sepal.Width : num [1:50] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##   ..$ Petal.Length: num [1:50] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##   ..$ Petal.Width : num [1:50] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##   ..$ Species     : chr [1:50] "setosa" "setosa" "setosa" "setosa" ...
##  $ versicolor: tibble [50 x 5] (S3: tbl_df/tbl/data.frame)
##   ..$ Sepal.Length: num [1:50] 7 6.4 6.9 5.5 6.5 5.7 6.3 4.9 6.6 5.2 ...
##   ..$ Sepal.Width : num [1:50] 3.2 3.2 3.1 2.3 2.8 2.8 3.3 2.4 2.9 2.7 ...
##   ..$ Petal.Length: num [1:50] 4.7 4.5 4.9 4 4.6 4.5 4.7 3.3 4.6 3.9 ...
##   ..$ Petal.Width : num [1:50] 1.4 1.5 1.5 1.3 1.5 1.3 1.6 1 1.3 1.4 ...
##   ..$ Species     : chr [1:50] "versicolor" "versicolor" "versicolor" "versicolor" ...
##  $ virginica : tibble [50 x 5] (S3: tbl_df/tbl/data.frame)
##   ..$ Sepal.Length: num [1:50] 6.3 5.8 7.1 6.3 6.5 7.6 4.9 7.3 6.7 7.2 ...
##   ..$ Sepal.Width : num [1:50] 3.3 2.7 3 2.9 3 3 2.5 2.9 2.5 3.6 ...
##   ..$ Petal.Length: num [1:50] 6 5.1 5.9 5.6 5.8 6.6 4.5 6.3 5.8 6.1 ...
##   ..$ Petal.Width : num [1:50] 2.5 1.9 2.1 1.8 2.2 2.1 1.7 1.8 1.8 2.5 ...
##   ..$ Species     : chr [1:50] "virginica" "virginica" "virginica" "virginica" ...
```

##### 方法6：读取一个.xlsx中多个sheet，并合并


```r
# 读取为数据框
path <- "C:/Users/Dell/Downloads/data/test/iris.xlsx"
data <- path %>%
  excel_sheets() %>%
  set_names() %>%
  map_df(~ read_excel(path = path, sheet = .x), .id = "Sheet")
head(data)
```

```
## # A tibble: 6 x 6
##   Sheet  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##   <chr>         <dbl>       <dbl>        <dbl>       <dbl> <chr>  
## 1 setosa          5.1         3.5          1.4         0.2 setosa 
## 2 setosa          4.9         3            1.4         0.2 setosa 
## 3 setosa          4.7         3.2          1.3         0.2 setosa 
## 4 setosa          4.6         3.1          1.5         0.2 setosa 
## 5 setosa          5           3.6          1.4         0.2 setosa 
## 6 setosa          5.4         3.9          1.7         0.4 setosa
```

##### 方法7：读取多个.xlsx文件，每个.xlsx文件中又有多个sheet

![](images/screenshots.gif)


```r
all_files <- dir_ls("C:/Users/Dell/Downloads/data/test/read_mul_data/",glob = "*xlsx")
import_sheets <- function(files){
  tab_names <- readxl::excel_sheets(files)
  list_all <- map(tab_names, function(x) readxl::read_excel(path = files, sheet = x)) %>%
    set_names(tab_names) %>%
    bind_rows(.id = "Part")
}

excel_names <- all_files %>%
  str_replace(".*/","") %>%
  str_replace("\\.xlsx","")

data <- map(all_files, import_sheets) %>%
  set_names(excel_names) %>%
  bind_rows(.id = "file_name")

head(data)
```

```
## # A tibble: 6 x 6
##   file_name Part  Sepal.Length Sepal.Width Petal.Length Petal.Width
##   <chr>     <chr>        <dbl>       <dbl>        <dbl>       <dbl>
## 1 setosa1   part1          5.1         3.5          1.4         0.2
## 2 setosa1   part1          4.9         3            1.4         0.2
## 3 setosa1   part1          4.7         3.2          1.3         0.2
## 4 setosa1   part1          4.6         3.1          1.5         0.2
## 5 setosa1   part1          5           3.6          1.4         0.2
## 6 setosa1   part1          5.4         3.9          1.7         0.4
```

```r
tail(data)
```

```
## # A tibble: 6 x 6
##   file_name   Part  Sepal.Length Sepal.Width Petal.Length Petal.Width
##   <chr>       <chr>        <dbl>       <dbl>        <dbl>       <dbl>
## 1 versicolor1 partB          6           2.7          5.1         1.6
## 2 versicolor1 partB          5.4         3            4.5         1.5
## 3 versicolor1 partB          6           3.4          4.5         1.6
## 4 versicolor1 partB          6.7         3.1          4.7         1.5
## 5 versicolor1 partB          6.3         2.3          4.4         1.3
## 6 versicolor1 partB          5.6         3            4.1         1.3
```

#### 三、总结

<p style="text-indent:2em;font-size:;font-family:;">
批量读取和导出文件中包含的逻辑是以读取/导出函数读取一个文件为基础，将读取或导出函数的参数传递给purr中的循环函数，使用purrr包实现循环读取并合并。上述方法不仅限与文中所用到的格式，只要能想到的格式，都可以尝试使用对应读取或导出函数按照上述规则进行批量读取或导出。
</p>
