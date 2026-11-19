---
title: "SQL 学习：逻辑运算符"
author: "郭猛"
date: "2022-08-31"
slug: "sql-logical-operators"
aliases:
  - "/2022/08/31/index.zh-cn/"
categories:
  - "SQL"
tags:
  - "SQL"
series:
  - "sql"
description: "SQL 中的逻辑运算符，包括 ALL、ANY、BETWEEN、IN、LIKE 等。"
lastmod: "2022-08-31T17:40:15+08:00"
keywords: []
comment: true
toc: false
autoCollapseToc: false
mathjax: false
---
今日学习SQL中的逻辑运算符。和R语言中的使用方法差不多，且命令比较相似，但ALL和ANY真的是难到我了🤣

<!--more-->

#### ![](images/logical_operator.PNG)

#### 1. ALL和ANY的使用方法

```sql
SELECT
department_id, first_name, last_name, salary
FROM
employees
WHERE
salary >= ALL(
SELECT
salary
FROM
employees
WHERE
department_id = 8
)
ORDER BY 
salary DESC;
```

<div class="knitsql-table">

Table: Table 1: 4 records

| department_id|first_name |last_name | salary|
|-------------:|:----------|:---------|------:|
|             9|Steven     |King      |  24000|
|             9|Neena      |Kochhar   |  17000|
|             9|Lex        |De Haan   |  17000|
|             8|John       |Russell   |  14000|

</div>

#### 
