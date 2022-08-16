---
title: 学习在R中使用MySQL
author: guoguo
date: '2022-08-15'
slug: index.zh-cn
categories:
  - 数据库操作
tags:
  - R
  - MySQL
  - RMySQL
  - RMariaDB
lastmod: '2022-08-15T19:33:31+08:00'
keywords: []
description: ''
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: no
reward: yes
mathjax: yes
---

<p style="text-indent:2em;font-size:;font-family:;">
在张敬信老师《R语言编程》中接触到如何使用R语言链接MySQL数据库。因为我对数据分析比较感兴趣，所以我觉得MySQL是必备技能之一。仅仅使用R语言可能应付不了大数据，但我对R语言很熟悉，所以这也是我学习MySQL的一个契机🤭。
</p>

<!--more-->

<p style="text-indent:2em;font-size:;font-family:;">
R语言是将数据载入内存再操作，但数据量超过内存限制时，将大数据存放在远程MySQL数据库中，通过R建立链接，再使用R命令进行数据探索。MySQL、SQL Server都是常见的数据库软件，再R中可以通过RMySQL、RMariaDB、RSQLite、odbc等R包建立与数据库的链接。dplyr是tidyverse生态中操作数据的核心R包，dbplyr包可以让你操作数据库像使用dplyr包操作数据一样简单方便。
</p>

#### 1. 配置MySQL开发环境

<p style="text-indent:2em;font-size:;font-family:;">
我是参考张老师的方法。使用MySQL zip版和Navicat(用于数据库管理)，MySQL的安装可以参考知乎空白格的<a href="https://zhuanlan.zhihu.com/p/64055680">mysql-8.0.16-winx64安装教程</a>，直到cmd可以出现以下界面：
</p>

<p align="center">
    <img src="images/cmd_mysql.png" alt="" width="100%"/>
</p>

#### 2. 新建MySQL链接和数据库

<p style="text-indent:2em;font-size:;font-family:;">
参考张老师的方法。使用navicat新建MySQL链接，输入链接名称（随便）和配置MySQL时设置好的用户名和密码。打开改链接，右键新建数据库，随机命名数据库名称为mydb，选择字符编码和排序规则。
</p>

<p align="center">
    <img src="images/navicat.png" alt="" width="50%"/><img src="images/navicat2.png" alt="" width="50%"/>
</p>

#### 3. 建立R与MySQL的链接

<p style="text-indent:2em;font-size:;font-family:;">
R包RMariaDB和RMySQL都可以使用dbConnect()函数建立与MySQL的链接，这里需要提供数据库后端、用户名、密码、数据库名称和主机。
</p>


```r
# load packages
library(RMariaDB)

con1 = dbConnect(MariaDB(), 
                 user = "root", 
                 password = "123456", 
                 dbname = "mydb", 
                 host = "localhost")

dbListTables(con1) # 查看 con 连接下的数据表
```

```
## [1] "exam"  "iris"  "iris2"
```


```r
# load packages
library(RMySQL)

con2 <- dbConnect(dbDriver('MySQL'), 
                  dbname='mydb', 
                  user = 'root', 
                  password = '123456', 
                  host = '127.0.0.1', 
                  port = 3306)

dbListTables(con2)
```

```
## [1] "exam"  "iris"  "iris2"
```

#### 4. 创建数据表

<p style="text-indent:2em;font-size:;font-family:;">
可以将R中自带数据集iris通过dbWriteTable()写入到数据表中。
</p>


```r
# 创建数据表
dbWriteTable(con1, name = "iris", value = iris, overwrite = TRUE)
```

#### 5. 数据表引用

<p style="text-indent:2em;font-size:;font-family:;">
使用tbl()函数获取数据表的引用。
</p>


```r
data <- dplyr::tbl(con1, "iris")
data
```

```
## # Source:   table<iris> [?? x 5]
## # Database: mysql  [root@localhost:NA/mydb]
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl> <chr>  
##  1          5.1         3.5          1.4         0.2 setosa 
##  2          4.9         3            1.4         0.2 setosa 
##  3          4.7         3.2          1.3         0.2 setosa 
##  4          4.6         3.1          1.5         0.2 setosa 
##  5          5           3.6          1.4         0.2 setosa 
##  6          5.4         3.9          1.7         0.4 setosa 
##  7          4.6         3.4          1.4         0.3 setosa 
##  8          5           3.4          1.5         0.2 setosa 
##  9          4.4         2.9          1.4         0.2 setosa 
## 10          4.9         3.1          1.5         0.1 setosa 
## # ... with more rows
## # i Use `print(n = ...)` to see more rows
```

#### 6. 数据表查询

<p style="text-indent:2em;font-size:;font-family:;">
dbplyr包可以使用dplyr语法执行SQL（结构化查询语言）查询。具体使用方法可以参考 <a href="https://dbplyr.tidyverse.org/reference/index.html">dbplyr reference</a>。
</p>


```r
# load packages
library(dbplyr)
library(dplyr)

data %>%
  group_by(Species) %>%
  summarise_all(mean, na.rm = TRUE)
```

```
## # Source:   SQL [3 x 5]
## # Database: mysql  [root@localhost:NA/mydb]
##   Species    Sepal.Length Sepal.Width Petal.Length Petal.Width
##   <chr>             <dbl>       <dbl>        <dbl>       <dbl>
## 1 setosa             5.01        3.43         1.46       0.246
## 2 versicolor         5.94        2.77         4.26       1.33 
## 3 virginica          6.59        2.97         5.55       2.03
```

<p style="text-indent:2em;font-size:;font-family:;">
dbplyr包提供了可以将dplyr代码翻译成SQL查询代码的函数show_query()。
</p>


```r
data %>%
  group_by(Species) %>%
  summarise_all(mean, na.rm = TRUE) %>%
  show_query()
```

```
## <SQL>
## SELECT
##   `Species`,
##   AVG(`Sepal.Length`) AS `Sepal.Length`,
##   AVG(`Sepal.Width`) AS `Sepal.Width`,
##   AVG(`Petal.Length`) AS `Petal.Length`,
##   AVG(`Petal.Width`) AS `Petal.Width`
## FROM `iris`
## GROUP BY `Species`
```

#### 7. 关闭R与MySQL的链接


```r
dbDisconnect(con1)
```
