---
title: SQL数据表查询querying data
author: guoguo
date: '2022-08-27'
slug: index.zh-cn
categories:
  - 数据库操作
tags:
  - SQL
  - MySQL
  - R
lastmod: '2022-08-27T22:30:16+08:00'
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
先学习SQL中最简单的SELECT语句。因为和R中数据框的操作比较相似，所以我觉得自己接受的还是比较快的。这里主要是使用在MySQL中模拟的数据中熟悉SQL的操作，和R中的操作互相印证。
</p>

<!--more-->



#### 1. 查询数据表


```sql
SELECT * FROM jobs;
```


<div class="knitsql-table">


Table: Table 1: Displaying records 1 - 10

|job_id |job_title                      | min_salary| max_salary|
|:------|:------------------------------|----------:|----------:|
|1      |Public Accountant              |       4200|       9000|
|2      |Accounting Manager             |       8200|      16000|
|3      |Administration Assistant       |       3000|       6000|
|4      |President                      |      20000|      40000|
|5      |Administration Vice President  |      15000|      30000|
|6      |Accountant                     |       4200|       9000|
|7      |Finance Manager                |       8200|      16000|
|8      |Human Resources Representative |       4000|       9000|
|9      |Programmer                     |       4000|      10000|
|10     |Marketing Manager              |       9000|      15000|

</div>

#### 2. 从数据表中挑选列


```sql
SELECT job_title, max_salary FROM jobs;
```


<div class="knitsql-table">


Table: Table 2: Displaying records 1 - 10

|job_title                      | max_salary|
|:------------------------------|----------:|
|Public Accountant              |       9000|
|Accounting Manager             |      16000|
|Administration Assistant       |       6000|
|President                      |      40000|
|Administration Vice President  |      30000|
|Accountant                     |       9000|
|Finance Manager                |      16000|
|Human Resources Representative |       9000|
|Programmer                     |      10000|
|Marketing Manager              |      15000|

</div>

#### 3. SELECT语句中实现简单计算


```sql
SELECT job_title, max_salary*2 FROM jobs;
```


<div class="knitsql-table">


Table: Table 3: Displaying records 1 - 10

|job_title                      | max_salary*2|
|:------------------------------|------------:|
|Public Accountant              |        18000|
|Accounting Manager             |        32000|
|Administration Assistant       |        12000|
|President                      |        80000|
|Administration Vice President  |        60000|
|Accountant                     |        18000|
|Finance Manager                |        32000|
|Human Resources Representative |        18000|
|Programmer                     |        20000|
|Marketing Manager              |        30000|

</div>


```sql
# 通过 AS 实现生成新的变量
SELECT job_title, max_salary, max_salary*2 AS double_salary FROM jobs;
```


<div class="knitsql-table">


Table: Table 4: Displaying records 1 - 10

|job_title                      | max_salary| double_salary|
|:------------------------------|----------:|-------------:|
|Public Accountant              |       9000|         18000|
|Accounting Manager             |      16000|         32000|
|Administration Assistant       |       6000|         12000|
|President                      |      40000|         80000|
|Administration Vice President  |      30000|         60000|
|Accountant                     |       9000|         18000|
|Finance Manager                |      16000|         32000|
|Human Resources Representative |       9000|         18000|
|Programmer                     |      10000|         20000|
|Marketing Manager              |      15000|         30000|

</div>

#### 4. 在R中实现上述操作


```r
# 以上步骤都可以在R连接MySQL数据库的情况下，操作命令在R中实现
library(dplyr)
library(dbplyr)
tbl(con, "jobs") %>% # 通过dplyr函数tbl()查询数据表
  select(job_id, max_salary) %>% # 通过select()选择列
  mutate(double_salary = max_salary*2) # 通过mutate()增加新的变量列
```

```
## # Source:   SQL [?? x 3]
## # Database: mysql  [root@localhost:NA/mydb]
##    job_id max_salary double_salary
##     <int>      <dbl>         <dbl>
##  1      1       9000         18000
##  2      2      16000         32000
##  3      3       6000         12000
##  4      4      40000         80000
##  5      5      30000         60000
##  6      6       9000         18000
##  7      7      16000         32000
##  8      8       9000         18000
##  9      9      10000         20000
## 10     10      15000         30000
## # ... with more rows
## # i Use `print(n = ...)` to see more rows
```
