---
title: SQL学习——生成SQL样本数据库
author: guoguo
date: '2022-08-18'
slug: index.zh-cn
categories:
  - 数据库操作
tags:
  - SQL
  - MySQL
  - vscode
  - sample data
lastmod: '2022-08-18T21:32:19+08:00'
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
工欲善其事必先利其器，我想学习SQL，除了安装必要的MySQL、vscode外(网上可以找到很多写的非常棒的安装教程)，还需要必要的样本数据来操作。前几天将R自带的iris数据集导入到了MySQL中作为样品数据，但上网搜了一下SQL的简单教程，这才意识到学习SQL并不是一个简单的iris数据集可以的（涉及很多具有相同变量table的操作）。我选择了其中一个附带样本数据库的教程——<a href="https://www.sqltutorial.org/">SQL tutorial</a> 来学习。
</p>

<!--more-->

#### 1. 使用教程中提供的脚本生成样本数据

-   下面的SQL脚本在MySQL中生成HR样本数据库

    [Create HR Sample Database in MySQL](https://www.sqltutorial.org/wp-content/uploads/2020/04/mysql.txt "Create HR Sample Database in MySQL")

-   下面的脚本在MySQL中将数据插入到tables中

    [Load HR Data in MySQL](https://www.sqltutorial.org/wp-content/uploads/2020/04/mysql-data.txt "Load HR Data in MySQL")

<p style="text-indent:2em;font-size:;font-family:;">
我觉得在vscode中比在R中好执行SQL命令，所以上上述两个脚本分别复制粘贴到vscode中的.SQL脚本文件中并运行,最终生成HR样本数据库。
</p>

<p align="center">
    <img src="images/vscode_sql_sample.png" alt="" width="100%"/>
</p>

#### 2. 样本数据库介绍

<p style="text-indent:2em;font-size:;font-family:;">
该教程中，需要学习的SQL样本数据是小公司的人力资源数据。
</p>

![](images/smaple_data_summary.png)

HR样本数据库一共有7个表：

1.  employees表储存了员工的数据。

2.  jobs表储存了包括工作头衔和薪酬范围的数据。

3.  departments表储存了部门的数据。

4.  dependents表储存了员工的家属信息。

5.  locations表储存了公司部门的位置信息。

6.  countries表储存了公司开展业务的国家的数据。

7.  regions表储存了亚洲，欧洲，美国以及中东和非洲等地区的数据。国家在这些区域中。

下图中记录了表的名称和数据量：

#### ![](images/sample_table.png)

从R中查看样本数据库的表


```r
# load packages
library(RMariaDB)

con = dbConnect(MariaDB(), 
                 user = "root", 
                 password = "123456", 
                 dbname = "mydb", 
                 host = "localhost")

dbListTables(con) # 查看 con 连接下的数据表
```

```
## [1] "countries"   "departments" "dependents"  "employees"   "jobs"       
## [6] "locations"   "regions"
```

#### 3. 在R中使用SQL命令


```sql
# 选择jobs表
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

#### 4. 使用dbplyr包


```r
# load packages
library(dplyr)
library(dbplyr)

# 数据表引用
data <- tbl(con, "jobs")
data
```

```
## # Source:   table<jobs> [?? x 4]
## # Database: mysql  [root@localhost:NA/mydb]
##    job_id job_title                      min_salary max_salary
##     <int> <chr>                               <dbl>      <dbl>
##  1      1 Public Accountant                    4200       9000
##  2      2 Accounting Manager                   8200      16000
##  3      3 Administration Assistant             3000       6000
##  4      4 President                           20000      40000
##  5      5 Administration Vice President       15000      30000
##  6      6 Accountant                           4200       9000
##  7      7 Finance Manager                      8200      16000
##  8      8 Human Resources Representative       4000       9000
##  9      9 Programmer                           4000      10000
## 10     10 Marketing Manager                    9000      15000
## # ... with more rows
## # i Use `print(n = ...)` to see more rows
```

```r
# 数据表查询
data %>%
  filter(min_salary > 10000)
```

```
## # Source:   SQL [2 x 4]
## # Database: mysql  [root@localhost:NA/mydb]
##   job_id job_title                     min_salary max_salary
##    <int> <chr>                              <dbl>      <dbl>
## 1      4 President                          20000      40000
## 2      5 Administration Vice President      15000      30000
```
