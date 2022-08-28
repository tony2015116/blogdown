---
title: SQL学习——排序ORDER BY
author: guoguo
date: '2022-08-28'
slug: index.zh-cn
categories:
  - 数据库操作
tags:
  - SQL
  - MySQL
  - R
lastmod: '2022-08-28T12:47:46+08:00'
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
今日学习SQL中的ORDER BY关键字，结合昨日SELECT语句，对选择的结果进行排序。同样的，在R中也很好操作。
</p>

<!--more-->



#### 1. 选择employee数据表


```sql
SELECT employee_id, first_name, last_name, hire_date, salary FROM employees;
```


<div class="knitsql-table">


Table: Table 1: Displaying records 1 - 10

|employee_id |first_name |last_name |hire_date  | salary|
|:-----------|:----------|:---------|:----------|------:|
|100         |Steven     |King      |1987-06-17 |  24000|
|101         |Neena      |Kochhar   |1989-09-21 |  17000|
|102         |Lex        |De Haan   |1993-01-13 |  17000|
|103         |Alexander  |Hunold    |1990-01-03 |   9000|
|104         |Bruce      |Ernst     |1991-05-21 |   6000|
|105         |David      |Austin    |1997-06-25 |   4800|
|106         |Valli      |Pataballa |1998-02-05 |   4800|
|107         |Diana      |Lorentz   |1999-02-07 |   4200|
|108         |Nancy      |Greenberg |1994-08-17 |  12000|
|109         |Daniel     |Faviet    |1994-08-16 |   9000|

</div>

#### 2. 使用ORDER BY进行排序


```sql
# 按照日期顺序升序
SELECT employee_id, first_name, last_name, hire_date, salary FROM employees ORDER BY hire_date;
```


<div class="knitsql-table">


Table: Table 2: Displaying records 1 - 10

| employee_id|first_name |last_name |hire_date  | salary|
|-----------:|:----------|:---------|:----------|------:|
|         100|Steven     |King      |1987-06-17 |  24000|
|         200|Jennifer   |Whalen    |1987-09-17 |   4400|
|         101|Neena      |Kochhar   |1989-09-21 |  17000|
|         103|Alexander  |Hunold    |1990-01-03 |   9000|
|         104|Bruce      |Ernst     |1991-05-21 |   6000|
|         102|Lex        |De Haan   |1993-01-13 |  17000|
|         204|Hermann    |Baer      |1994-06-07 |  10000|
|         205|Shelley    |Higgins   |1994-06-07 |  12000|
|         206|William    |Gietz     |1994-06-07 |   8300|
|         203|Susan      |Mavris    |1994-06-07 |   6500|

</div>


```sql
# 按照字母顺序降序
SELECT employee_id, first_name, last_name, hire_date, salary FROM employees ORDER BY first_name DESC;
```


<div class="knitsql-table">


Table: Table 3: Displaying records 1 - 10

| employee_id|first_name |last_name |hire_date  | salary|
|-----------:|:----------|:---------|:----------|------:|
|         206|William    |Gietz     |1994-06-07 |   8300|
|         106|Valli      |Pataballa |1998-02-05 |   4800|
|         203|Susan      |Mavris    |1994-06-07 |   6500|
|         100|Steven     |King      |1987-06-17 |  24000|
|         117|Sigal      |Tobias    |1997-07-24 |   2800|
|         116|Shelli     |Baida     |1997-12-24 |   2900|
|         205|Shelley    |Higgins   |1994-06-07 |  12000|
|         123|Shanta     |Vollman   |1997-10-10 |   6500|
|         192|Sarah      |Bell      |1996-02-04 |   4000|
|         122|Payam      |Kaufling  |1995-05-01 |   7900|

</div>

#### 3. 多列同时排序


```sql
# job_title升序，max_salary降序
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY first_name, last_name DESC;
```


<div class="knitsql-table">


Table: Table 4: Displaying records 1 - 10

| employee_id|first_name |last_name |hire_date  | salary|
|-----------:|:----------|:---------|:----------|------:|
|         121|Adam       |Fripp     |1997-04-10 |   8200|
|         115|Alexander  |Khoo      |1995-05-18 |   3100|
|         103|Alexander  |Hunold    |1990-01-03 |   9000|
|         193|Britney    |Everett   |1997-03-03 |   3900|
|         104|Bruce      |Ernst     |1991-05-21 |   6000|
|         179|Charles    |Johnson   |2000-01-04 |   6200|
|         109|Daniel     |Faviet    |1994-08-16 |   9000|
|         105|David      |Austin    |1997-06-25 |   4800|
|         114|Den        |Raphaely  |1994-12-07 |  11000|
|         107|Diana      |Lorentz   |1999-02-07 |   4200|

</div>

#### 4. 在R中实现上述操作


```r
# 以上步骤都可以在R连接MySQL数据库的情况下，操作命令在R中实现
library(dplyr)
library(dbplyr)
data <- tbl(con, "employees") %>% # 通过dplyr函数tbl()查询数据表
  select(employee_id, first_name, last_name, hire_date, salary) # 通过select()选择列
head(data)
```

```
## # Source:   SQL [6 x 5]
## # Database: mysql  [root@localhost:NA/mydb]
##   employee_id first_name last_name hire_date  salary
##         <int> <chr>      <chr>     <date>      <dbl>
## 1         100 Steven     King      1987-06-17  24000
## 2         101 Neena      Kochhar   1989-09-21  17000
## 3         102 Lex        De Haan   1993-01-13  17000
## 4         103 Alexander  Hunold    1990-01-03   9000
## 5         104 Bruce      Ernst     1991-05-21   6000
## 6         105 David      Austin    1997-06-25   4800
```


```r
# 按日期顺序升序
data %>%
    arrange(hire_date)
```

```
## # Source:     SQL [?? x 5]
## # Database:   mysql  [root@localhost:NA/mydb]
## # Ordered by: hire_date
##    employee_id first_name last_name hire_date  salary
##          <int> <chr>      <chr>     <date>      <dbl>
##  1         100 Steven     King      1987-06-17  24000
##  2         200 Jennifer   Whalen    1987-09-17   4400
##  3         101 Neena      Kochhar   1989-09-21  17000
##  4         103 Alexander  Hunold    1990-01-03   9000
##  5         104 Bruce      Ernst     1991-05-21   6000
##  6         102 Lex        De Haan   1993-01-13  17000
##  7         205 Shelley    Higgins   1994-06-07  12000
##  8         204 Hermann    Baer      1994-06-07  10000
##  9         206 William    Gietz     1994-06-07   8300
## 10         203 Susan      Mavris    1994-06-07   6500
## # ... with more rows
## # i Use `print(n = ...)` to see more rows
```

```r
# 按字母顺序降序
data %>%
  arrange(desc(first_name))
```

```
## # Source:     SQL [?? x 5]
## # Database:   mysql  [root@localhost:NA/mydb]
## # Ordered by: desc(first_name)
##    employee_id first_name last_name hire_date  salary
##          <int> <chr>      <chr>     <date>      <dbl>
##  1         206 William    Gietz     1994-06-07   8300
##  2         106 Valli      Pataballa 1998-02-05   4800
##  3         203 Susan      Mavris    1994-06-07   6500
##  4         100 Steven     King      1987-06-17  24000
##  5         117 Sigal      Tobias    1997-07-24   2800
##  6         116 Shelli     Baida     1997-12-24   2900
##  7         205 Shelley    Higgins   1994-06-07  12000
##  8         123 Shanta     Vollman   1997-10-10   6500
##  9         192 Sarah      Bell      1996-02-04   4000
## 10         122 Payam      Kaufling  1995-05-01   7900
## # ... with more rows
## # i Use `print(n = ...)` to see more rows
```

```r
# 多列同时排序
data %>%
  arrange(first_name, desc(last_name))
```

```
## # Source:     SQL [?? x 5]
## # Database:   mysql  [root@localhost:NA/mydb]
## # Ordered by: first_name, desc(last_name)
##    employee_id first_name last_name hire_date  salary
##          <int> <chr>      <chr>     <date>      <dbl>
##  1         121 Adam       Fripp     1997-04-10   8200
##  2         115 Alexander  Khoo      1995-05-18   3100
##  3         103 Alexander  Hunold    1990-01-03   9000
##  4         193 Britney    Everett   1997-03-03   3900
##  5         104 Bruce      Ernst     1991-05-21   6000
##  6         179 Charles    Johnson   2000-01-04   6200
##  7         109 Daniel     Faviet    1994-08-16   9000
##  8         105 David      Austin    1997-06-25   4800
##  9         114 Den        Raphaely  1994-12-07  11000
## 10         107 Diana      Lorentz   1999-02-07   4200
## # ... with more rows
## # i Use `print(n = ...)` to see more rows
```
