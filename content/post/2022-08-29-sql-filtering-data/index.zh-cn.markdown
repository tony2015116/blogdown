---
title: SQL学习——数据过滤Filtering Data
author: guoguo
date: '2022-08-29'
slug: index.zh-cn
categories:
  - 数据库操作
tags:
  - SQL
  - MySQL
  - R
lastmod: '2022-08-29T18:43:55+08:00'
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
今日学习SQL中DISTINCT语句，类似R中的dplyr::distinct()函数。
</p>

<!--more-->



#### 1. 过滤重复值DISTINCT


```sql
# 从employees数据表选择salary列，按照从大到小顺序排列salary,并去除重复值
SELECT 
DISTINCT salary 
FROM 
employees 
ORDER BY Salary DESC;
```


<div class="knitsql-table">


Table: Table 1: Displaying records 1 - 10

| salary|
|------:|
|  24000|
|  17000|
|  14000|
|  13500|
|  13000|
|  12000|
|  11000|
|  10000|
|   9000|
|   8600|

</div>


```sql
# 从employees数据表选择多列，排序,并去除重复值
SELECT 
DISTINCT job_id, salary
FROM 
employees 
ORDER BY job_id, salary DESC;
```


<div class="knitsql-table">


Table: Table 2: Displaying records 1 - 10

| job_id| salary|
|------:|------:|
|      1|   8300|
|      2|  12000|
|      3|   4400|
|      4|  24000|
|      5|  17000|
|      6|   9000|
|      6|   8200|
|      6|   7800|
|      6|   7700|
|      6|   6900|

</div>

#### 2. 限制查询返回行数LIMIT


```sql
# 查询employees数据表，按照first_name排序，并返回排序后的前10行
SELECT
employee_id,
first_name,
last_name
FROM
employees
ORDER BY
first_name
LIMIT 10;
```


<div class="knitsql-table">


Table: Table 3: Displaying records 1 - 10

| employee_id|first_name |last_name |
|-----------:|:----------|:---------|
|         121|Adam       |Fripp     |
|         115|Alexander  |Khoo      |
|         103|Alexander  |Hunold    |
|         193|Britney    |Everett   |
|         104|Bruce      |Ernst     |
|         179|Charles    |Johnson   |
|         109|Daniel     |Faviet    |
|         105|David      |Austin    |
|         114|Den        |Raphaely  |
|         107|Diana      |Lorentz   |

</div>


```sql
# 查询employees数据表，按照first_name排序，屏蔽掉前3行，从第4行起，返回后面的10行
SELECT
employee_id,
first_name,
last_name
FROM
employees
ORDER BY
first_name
LIMIT 10 OFFSET 3;
```


<div class="knitsql-table">


Table: Table 4: Displaying records 1 - 10

| employee_id|first_name |last_name   |
|-----------:|:----------|:-----------|
|         193|Britney    |Everett     |
|         104|Bruce      |Ernst       |
|         179|Charles    |Johnson     |
|         109|Daniel     |Faviet      |
|         105|David      |Austin      |
|         114|Den        |Raphaely    |
|         107|Diana      |Lorentz     |
|         118|Guy        |Himuro      |
|         204|Hermann    |Baer        |
|         126|Irene      |Mikkilineni |

</div>

#### 3. 在R中实现上述操作


```r
# 以上步骤都可以在R连接MySQL数据库的情况下，操作命令在R中实现
library(dplyr)
library(dbplyr)
data <- tbl(con, "employees") %>% # 通过dplyr函数tbl()查询数据表
  select(employee_id, first_name, last_name, salary) %>% # 选择对应列
  distinct(first_name, .keep_all = TRUE) %>% # 去除该列重复值
  arrange(salary) # 排序
data
```

```
## # Source:     SQL [?? x 4]
## # Database:   mysql  [root@localhost:NA/mydb]
## # Ordered by: salary
##    employee_id first_name last_name   salary
##          <int> <chr>      <chr>        <dbl>
##  1         118 Guy        Himuro        2600
##  2         126 Irene      Mikkilineni   2700
##  3         117 Sigal      Tobias        2800
##  4         116 Shelli     Baida         2900
##  5         193 Britney    Everett       3900
##  6         192 Sarah      Bell          4000
##  7         107 Diana      Lorentz       4200
##  8         200 Jennifer   Whalen        4400
##  9         105 David      Austin        4800
## 10         106 Valli      Pataballa     4800
## # ... with more rows
## # i Use `print(n = ...)` to see more rows
```

```r
head(data, n = 10) #返回查询结果的前10行，offset未找到对应函数
```

```
## # Source:     SQL [10 x 4]
## # Database:   mysql  [root@localhost:NA/mydb]
## # Ordered by: salary
##    employee_id first_name last_name   salary
##          <int> <chr>      <chr>        <dbl>
##  1         118 Guy        Himuro        2600
##  2         126 Irene      Mikkilineni   2700
##  3         117 Sigal      Tobias        2800
##  4         116 Shelli     Baida         2900
##  5         193 Britney    Everett       3900
##  6         192 Sarah      Bell          4000
##  7         107 Diana      Lorentz       4200
##  8         200 Jennifer   Whalen        4400
##  9         105 David      Austin        4800
## 10         106 Valli      Pataballa     4800
```
