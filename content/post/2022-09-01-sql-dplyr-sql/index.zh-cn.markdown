---
title: SQL学习——dplyr与SQL语言互转
author: guoguo
date: '2022-09-01'
slug: index.zh-cn
categories:
  - 数据库操作
tags:
  - SQL
  - MySQL
  - R
lastmod: '2022-09-01T20:24:54+08:00'
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
dplyr和dbplyr结合可以将dplyr语句转为SQL语句；queryparser和tidyquery结合可以将SQL语句转为dplyr语句，但是对于复杂的SQL语句，无法转为dplyr语句。
</p>

<!--more-->



#### 1. dplyr转SQL语句

[![](images/dplyr2sql.png)](https://rstd.io/global2021/irenesteves)


```r
# 以上步骤都可以在R连接MySQL数据库的情况下，操作命令在R中实现
# load packages
library(dplyr)
library(dbplyr)
data <- tbl(con, "employees") # 通过dplyr函数tbl()查询数据表
data %>% 
  filter(salary > 14000) %>% # 筛选salary大于14000
  select(first_name, last_name, salary) %>% # 选择对应列
  arrange(desc(salary)) %>%
  show_query() # SQL语句
```

```
## <SQL>
## SELECT `first_name`, `last_name`, `salary`
## FROM `employees`
## WHERE (`salary` > 14000.0)
## ORDER BY `salary` DESC
```

#### 2. SQL转dplyr

![tidyquery and queryparser: Translating SQL Queries to dplyr Pipelines](images/sql2dplyr.png)


```r
# load packages
library(queryparser)
```

```
## Warning: 程辑包'queryparser'是用R版本4.1.3 来建造的
```

```r
library(tidyquery)
```

```
## Warning: 程辑包'tidyquery'是用R版本4.1.3 来建造的
```

```r
employees = tbl(con, "employees") # 通过dplyr函数tbl()查询数据表
show_dplyr("SELECT
department_id, first_name, last_name, salary FROM employees
WHERE
salary > 14000
ORDER BY 
salary DESC")
```

```
## employees %>%
##   filter(salary > 14000) %>%
##   select(department_id, first_name, last_name, salary) %>%
##   arrange(desc(salary))
```
