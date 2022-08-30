---
title: SQL学习——数据过滤Filtering Data——WHERE子句
author: guoguo
date: '2022-08-30'
slug: index.zh-cn
categories:
  - 数据库操作
tags:
  - SQL
  - MySQL
  - R
lastmod: '2022-08-30T21:48:34+08:00'
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
今日学习SQL中WHERE子句，类似R中的filter()函数。SQL中可以结合AND&OR和比较运算符实现对数据表的过滤。
</p>

<!--more-->



#### 1. SQL中的WHERE使用方法


```sql
# WHERE 结合 AND
SELECT
employee_id, 
first_name,
last_name,
salary
FROM
employees
WHERE
salary > 5000 AND salary < 10000
ORDER BY 
salary DESC;
```


<div class="knitsql-table">


Table: Table 1: Displaying records 1 - 10

| employee_id|first_name  |last_name  | salary|
|-----------:|:-----------|:----------|------:|
|         103|Alexander   |Hunold     |   9000|
|         109|Daniel      |Faviet     |   9000|
|         176|Jonathon    |Taylor     |   8600|
|         177|Jack        |Livingston |   8400|
|         206|William     |Gietz      |   8300|
|         110|John        |Chen       |   8200|
|         121|Adam        |Fripp      |   8200|
|         120|Matthew     |Weiss      |   8000|
|         122|Payam       |Kaufling   |   7900|
|         112|Jose Manuel |Urman      |   7800|

</div>


```sql
# WHERE 结合 or
SELECT
employee_id, 
first_name,
last_name,
salary
FROM
employees
WHERE
salary < 5000 OR last_name = 'Chen'
ORDER BY 
salary DESC;
```


<div class="knitsql-table">


Table: Table 2: Displaying records 1 - 10

| employee_id|first_name |last_name | salary|
|-----------:|:----------|:---------|------:|
|         110|John       |Chen      |   8200|
|         105|David      |Austin    |   4800|
|         106|Valli      |Pataballa |   4800|
|         200|Jennifer   |Whalen    |   4400|
|         107|Diana      |Lorentz   |   4200|
|         192|Sarah      |Bell      |   4000|
|         193|Britney    |Everett   |   3900|
|         115|Alexander  |Khoo      |   3100|
|         116|Shelli     |Baida     |   2900|
|         117|Sigal      |Tobias    |   2800|

</div>


```sql
# WHERE 结合 BETWEEN
SELECT
employee_id, 
first_name,
last_name,
hire_date
FROM
employees
WHERE
hire_date
BETWEEN '1999-01-01' AND '2001-01-01'
ORDER BY
hire_date DESC;
```


<div class="knitsql-table">


Table: Table 3: 5 records

| employee_id|first_name |last_name  |hire_date  |
|-----------:|:----------|:----------|:----------|
|         179|Charles    |Johnson    |2000-01-04 |
|         113|Luis       |Popp       |1999-12-07 |
|         119|Karen      |Colmenares |1999-08-10 |
|         178|Kimberely  |Grant      |1999-05-24 |
|         107|Diana      |Lorentz    |1999-02-07 |

</div>

#### 2. 在R中实现上述操作


```r
# 以上步骤都可以在R连接MySQL数据库的情况下，操作命令在R中实现
library(dplyr)
library(dbplyr)
data <- tbl(con, "employees") %>% # 通过dplyr函数tbl()查询数据表
  select(employee_id, first_name, last_name, hire_date) %>% # 选择对应列
  filter(between(hire_date, '1999-01-01', '2001-01-01')) %>% # R中同样有类似BETWEEN功能的between()函数
  arrange(desc(hire_date)) # 按照雇佣日期倒序排序
data
```

```
## # Source:     SQL [5 x 4]
## # Database:   mysql  [root@localhost:NA/mydb]
## # Ordered by: desc(hire_date)
##   employee_id first_name last_name  hire_date 
##         <int> <chr>      <chr>      <date>    
## 1         179 Charles    Johnson    2000-01-04
## 2         113 Luis       Popp       1999-12-07
## 3         119 Karen      Colmenares 1999-08-10
## 4         178 Kimberely  Grant      1999-05-24
## 5         107 Diana      Lorentz    1999-02-07
```


```r
# 以上步骤都可以在R连接MySQL数据库的情况下，操作命令在R中实现
library(dplyr)
library(dbplyr)
data <- tbl(con, "employees") %>% # 通过dplyr函数tbl()查询数据表
  select(employee_id, first_name, last_name, salary) %>% # 选择对应列
  filter(salary < 5000 | last_name == 'Chen') %>% # filter()实现WHERE功能
  arrange(desc(salary)) # 按照工资倒序排序
data
```

```
## # Source:     SQL [?? x 4]
## # Database:   mysql  [root@localhost:NA/mydb]
## # Ordered by: desc(salary)
##    employee_id first_name last_name salary
##          <int> <chr>      <chr>      <dbl>
##  1         110 John       Chen        8200
##  2         105 David      Austin      4800
##  3         106 Valli      Pataballa   4800
##  4         200 Jennifer   Whalen      4400
##  5         107 Diana      Lorentz     4200
##  6         192 Sarah      Bell        4000
##  7         193 Britney    Everett     3900
##  8         115 Alexander  Khoo        3100
##  9         116 Shelli     Baida       2900
## 10         117 Sigal      Tobias      2800
## # ... with more rows
## # i Use `print(n = ...)` to see more rows
```
