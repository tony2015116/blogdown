---
title: "盘点那些牛X的R包\U0001F496"
author: guoguo
date: '2022-08-24'
slug: "盘点那些牛X的R包\U0001F496"
categories:
  - 数据分析工具
tags:
  - R
  - R package
lastmod: '2022-08-24T17:14:47+08:00'
keywords: []
description: ''
comment: no
toc: no
autoCollapseToc: no
contentCopyright: no
reward: no
mathjax: no
---
<p style="text-indent:2em;font-size:;font-family:;">
R中🐂🍺的📦太多了，很多可能都没听说过。不是这些R包不够好用，只是新的R包出来的速度太快太多了，而且小伙伴能接触到较新R包的机会也比较少，基本都是在知乎上了解到的。我是一个比较爱折腾的人，刚好喜欢R又在推特中关注了很多R包开发者和数据科学家，这让我有机会接触到最新的和最好用的R包。我的收藏夹了收藏好多R包参考网站，现在想整理出来分析给大家。
</p>
<!--more-->
#### **1. gtExtras package**
<p align="center">
    <a href="https://jthomasmock.github.io/gtExtras/index.html"><img align="center" width="87px" src="https://jthomasmock.github.io/gtExtras/logo.png"/></a>
    <p align="left" style="text-indent:2em;font-size:;font-family:;">
    gtExtras包是为{gt}包提供一些额外的辅助函数，来帮助使用gt包创建漂亮的表格。特点是可以在表格中增加图形，如折线图、密度图和条形图等；也可以修改表格主题样式、增加表头等；可以很好的将data.frame格式的表格导出为图片和pdf格式。
    </p>
</p>

#### **2. gtsummary package**
<p align="center">
    <a href="https://www.danieldsjoberg.com/gtsummary/index.html"><img align="center" width="87px" src="https://www.danieldsjoberg.com/gtsummary/reference/figures/logo.png"/></a>
    <p align="left" style="text-indent:2em;font-size:;font-family:;">
    gtsummary包是结合{broom},{gt}等包的综合型R包，可以汇总data.frame或tibble;汇总常见的回归模型；自定义gtsummary表格，如增加表头、修改主题等；在Rmarkdown中生成汇总表和回归汇总表的统计报告。特点是可以基于{gt}导出漂亮的图片表格，但是必须使用自带的tbl_summary()+gusummary::as_gt()+gt::gtsave()生成png或pdf;导出word文件需要tbl_summary()+gtsummary::as_flex_table()+flextable::save_as_docx，而非使用flextabl::flextable()...。具体可以参考下图，gtsummary结合了很多其它包的打印引擎生成自己的as_*()函数。
    <p align="center">
    <img align="center" width="60%" src="https://www.danieldsjoberg.com/gtsummary/reference/figures/gt_output_formats.PNG"/></a>
    </p>
</p>

#### **3. crosstable package**
<p align="center">
    <a href="https://danchaltiel.github.io/crosstable/index.html"><img align="center" width="87px" src="https://danchaltiel.github.io/crosstable/logo.png"/></a>
    <p align="left" style="text-indent:2em;font-size:;font-family:;">
    crosstable包的核心函数只有一个crosstable(),同样是计算数据的描述性统计。可以结合officer包将结果报告导出到word中。可以结合gt包的as_gt()函数转为gt表格式，或者结合as_flextable()函数转为flextable格式。
</p>

#### **4. rio package**
<p align="center">
    <a href="https://thomasleeper.com/rio/index.html"><img align="center" width="87px" src="https://thomasleeper.com/rio/reference/figures/logo.png"/></a>
    <p align="left" style="text-indent:2em;font-size:;font-family:;">
    rio包的核心函数有4个，分别是import()、import_list()、export()、export_list()。import()和export()函数可以单独导入/导出一个文件；import_list()和export_list()可以读取,如一个excel多个sheet或者多个excel文件并合并，export_list()可以导出列表到一个excel文件多个sheet或多个excel。相信以上几个函数就能满足90%以上的数据导入和导出功能需求了。rio包的特点是兼容并包，实现绝大多数的数据格式的导入和导出，将其它类似的R包功能整合到rio中。
</p>

#### **5. janitor package**
<p align="center">
    <a href="https://sfirke.github.io/janitor/index.html"><img align="center" width="87px" src="https://cdn.jsdelivr.net/gh/tony2015116/PicGo/202209091552414.png"/></a>
    <p align="left" style="text-indent:2em;font-size:;font-family:;">
    janitor包是我经常的一个用来处理脏数据的R包。里面包含了很对简单的但很实用的函数。我经常使用的函数有获取重复值get_dupes(),清理对象名称clean_names,日期格式的转换convert_to_date()、convert_to_datetime()、excel_numeric_to_date(),去除空白行列remove_empty()、remove_empty_cols()、remove_empty_rows()，还有其它的一些我不经常使用的函数。janitor包的特点就是在不经意之间会用到它。
</p>
