---
title: test2
author: tony
date: '2022-05-19'
slug: index.zh-cn
categories: []
tags: []
lastmod: '2022-05-19T18:03:17+08:00'
keywords: []
description: 'jlsfjlsdfjlfsdfjlsadf'
comment: yes
toc: no
autoCollapseToc: no
#contentCopyright: ""
reward: yes
mathjax: yes
---
<script src="/rmarkdown-libs/kePrint/kePrint.js"></script>
<link href="/rmarkdown-libs/lightable/lightable.css" rel="stylesheet" />

<p style="text-indent:2em;font-size:;font-family:;">
折腾了好些天了，终于我的博客是完全在Rstudio上写的，下面是我的博客可以实现的内容。经理放假拉省的积分链接发了卢卡斯的飞机离开发就拉萨的飞机了记录卡撒旦发几款卢卡斯的积分；理发师尽量扩大飞机离开附件就拉萨的飞机了就卢卡斯的积分发骄傲将发生大快捷方式大量经理据了解杰拉德JFK了经理。🤩
</p>

<!--more-->

#### test

1.  使用Python

    
    ```python
    import pandas as pd
    url = "C:/Users/Dell/Documents/R/win-library/4.1/readr/extdata/mtcars.csv"
    df = pd.read_csv(url, sep = ",")
    df.head()
    ```
    
    ```
    ##     mpg  cyl   disp   hp  drat     wt   qsec  vs  am  gear  carb
    ## 0  21.0    6  160.0  110  3.90  2.620  16.46   0   1     4     4
    ## 1  21.0    6  160.0  110  3.90  2.875  17.02   0   1     4     4
    ## 2  22.8    4  108.0   93  3.85  2.320  18.61   1   1     4     1
    ## 3  21.4    6  258.0  110  3.08  3.215  19.44   1   0     3     1
    ## 4  18.7    8  360.0  175  3.15  3.440  17.02   0   0     3     2
    ```

2.  使用R语言

    
    ```r
    library(readr)
    df <- read_csv(readr_example("mtcars.csv"),comment = "")
    head(df)
    ```
    
    ```
    ## # A tibble: 6 x 11
    ##     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
    ##   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ## 1  21       6   160   110  3.9   2.62  16.5     0     1     4     4
    ## 2  21       6   160   110  3.9   2.88  17.0     0     1     4     4
    ## 3  22.8     4   108    93  3.85  2.32  18.6     1     1     4     1
    ## 4  21.4     6   258   110  3.08  3.22  19.4     1     0     3     1
    ## 5  18.7     8   360   175  3.15  3.44  17.0     0     0     3     2
    ## 6  18.1     6   225   105  2.76  3.46  20.2     1     0     3     1
    ```

    <table class=" lightable-paper lightable-hover" style='font-family: "Arial Narrow", arial, helvetica, sans-serif; width: auto !important; margin-left: auto; margin-right: auto;'>
     <thead>
    <tr>
    <th style="empty-cells: hide;" colspan="1"></th>
    <th style="padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="TRUE">Hello</div></th>
    <th style="padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="TRUE">World</div></th>
    </tr>
      <tr>
       <th style="text-align:left;"> car </th>
       <th style="text-align:left;"> mpg </th>
       <th style="text-align:left;"> cyl </th>
       <th style="text-align:left;"> disp </th>
       <th style="text-align:left;"> hp </th>
      </tr>
     </thead>
    <tbody>
      <tr>
       <td style="text-align:left;"> Mazda RX4 </td>
       <td style="text-align:left;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #ffcc6f">21.0</span> </td>
       <td style="text-align:left;"> <span style="-webkit-transform: rotate(60deg); -moz-transform: rotate(60deg); -ms-transform: rotate(60deg); -o-transform: rotate(60deg); transform: rotate(60deg); display: inline-block; "><span style="     color: white !important;border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: red !important;text-align: center;">6</span></span> </td>
       <td style="text-align:left;"> <span style="  font-style: italic;   color: green !important;">160</span> </td>
       <td style="text-align:left;width: 3cm; "> <span style="display: inline-block; direction: rtl; unicode-bidi: plaintext; border-radius: 4px; padding-right: 2px; background-color: lightgreen; width: 62.86%">110</span> </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Mazda RX4 Wag </td>
       <td style="text-align:left;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #ffcc6f">21.0</span> </td>
       <td style="text-align:left;"> <span style="-webkit-transform: rotate(120deg); -moz-transform: rotate(120deg); -ms-transform: rotate(120deg); -o-transform: rotate(120deg); transform: rotate(120deg); display: inline-block; "><span style="     color: white !important;border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: red !important;text-align: center;">6</span></span> </td>
       <td style="text-align:left;"> <span style="  font-style: italic;   color: green !important;">160</span> </td>
       <td style="text-align:left;width: 3cm; "> <span style="display: inline-block; direction: rtl; unicode-bidi: plaintext; border-radius: 4px; padding-right: 2px; background-color: lightgreen; width: 62.86%">110</span> </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Datsun 710 </td>
       <td style="text-align:left;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #ffa500">22.8</span> </td>
       <td style="text-align:left;"> <span style="-webkit-transform: rotate(180deg); -moz-transform: rotate(180deg); -ms-transform: rotate(180deg); -o-transform: rotate(180deg); transform: rotate(180deg); display: inline-block; "><span style="     color: white !important;border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: red !important;text-align: center;">4</span></span> </td>
       <td style="text-align:left;"> <span style="  font-style: italic;   color: green !important;">108</span> </td>
       <td style="text-align:left;width: 3cm; "> <span style="display: inline-block; direction: rtl; unicode-bidi: plaintext; border-radius: 4px; padding-right: 2px; background-color: lightgreen; width: 53.14%">93</span> </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Hornet 4 Drive </td>
       <td style="text-align:left;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #ffc357">21.4</span> </td>
       <td style="text-align:left;"> <span style="-webkit-transform: rotate(240deg); -moz-transform: rotate(240deg); -ms-transform: rotate(240deg); -o-transform: rotate(240deg); transform: rotate(240deg); display: inline-block; "><span style="     color: white !important;border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: red !important;text-align: center;">6</span></span> </td>
       <td style="text-align:left;"> <span style=" font-weight: bold;    color: red !important;">258</span> </td>
       <td style="text-align:left;width: 3cm; "> <span style="display: inline-block; direction: rtl; unicode-bidi: plaintext; border-radius: 4px; padding-right: 2px; background-color: lightgreen; width: 62.86%">110</span> </td>
      </tr>
      <tr>
       <td style="text-align:left;"> Hornet Sportabout </td>
       <td style="text-align:left;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #ffffff">18.7</span> </td>
       <td style="text-align:left;"> <span style="-webkit-transform: rotate(300deg); -moz-transform: rotate(300deg); -ms-transform: rotate(300deg); -o-transform: rotate(300deg); transform: rotate(300deg); display: inline-block; "><span style="     color: white !important;border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: red !important;text-align: center;">8</span></span> </td>
       <td style="text-align:left;"> <span style=" font-weight: bold;    color: red !important;">360</span> </td>
       <td style="text-align:left;width: 3cm; "> <span style="display: inline-block; direction: rtl; unicode-bidi: plaintext; border-radius: 4px; padding-right: 2px; background-color: lightgreen; width: 100.00%">175</span> </td>
      </tr>
    </tbody>
    </table>

3.  无序列表

    -   注释

        
        ```r
        # R代码中的文本注释
        head(mtcars[,1:5]) #总结数据
        ```
        
        ```
        ##                    mpg cyl disp  hp drat
        ## Mazda RX4         21.0   6  160 110 3.90
        ## Mazda RX4 Wag     21.0   6  160 110 3.90
        ## Datsun 710        22.8   4  108  93 3.85
        ## Hornet 4 Drive    21.4   6  258 110 3.08
        ## Hornet Sportabout 18.7   8  360 175 3.15
        ## Valiant           18.1   6  225 105 2.76
        ```

    -   代码文本框

            b <- "this is normal code"

    -   代码高亮

        
        ```r
        b <- "this is normal code"
        ```

4.  有序列表

    1.  各级标题

        # 一级标题

        ## 二级标题

        ### 三级标题

        #### 四级标题

        ##### 五级标题

        ###### 六级标题

    2.  *斜体*

    3.  **加粗**

    4.  `行内代码文本`

    5.  ***粗斜体***

    6.  行内公式

        \$ y=f(x)/t^2 \$ \#不可用

    7.  公式块 $$ y=f(x)/t^2 $$

    8.  特殊字符转义，如 { }

    9.  [my blog](https://www.rusersplace.com)

    10. 动图

        <a href="https://www.animatedimages.org/cat-cats-209.htm"><img src="https://www.animatedimages.org/data/media/209/animated-cat-image-0167.gif" border="0" alt="animated-cat-image-0167" /></a>

    11. 本地图片

        ![猫](images/pexels-pixabay-57416.jpg)

    12. 表情

        🥰📷

    13. 引用块

        > "I thoroughly disapprove of duels. If a man should challenge me, I would take him kindly and forgivingly by the hand and lead him to a quiet place and kill him."
        >
        > --- Mark Twain

    14. 字体

        <span style="font-family:楷体;">楷体</span>显示为楷体 ，<span style="font-family:Times New Roman;">Times New Roman</span>显示为Times New Roman

    15. 字号

        <span style="font-size:5px;">字号25px</span>显示为字号25px

    16. 文字颜色

        <span style="color:red;">红色文字</span>显示为红色文字 ，<span style="color:#33C0FF;">文字色号\#33C0FF</span>显示为文字色号\#33C0FF

    17. 文字背景

        <span style="background-color:yellow;">背景为黄色</span>显示为背景为黄色 ，<span style="background-color:#33FF8B;">背景色号为\#33FF8B</span>

    18. 下划线

        <p style="text-decoration: underline;">下划线</p>

    19. 删除线

        <p style="text-decoration: line-through;">删除线</p>

        ~~删除线~~

    20. 上划线

        <p style="text-decoration: overline;">上划线</p>

    21. 积分了撒打发

5.  首行缩进

    <p style="text-indent:32px;">
    子曰：<span style="color:red;">“学而时习之，不亦说乎？</span>有朋自远方来，不亦乐乎？人不知而不愠，不亦君子乎？”
    </p>

6.  悬挂缩进

    <p style="text-indent:-2em;padding-left:2em;">
    子曰：“学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知而不愠，不亦君子乎？”
    </p>

7.  整体左缩进

    <p style="padding-left:2em;">
    子曰：“学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知而不愠，不亦君子乎？”
    </p>

8.  整体左右均缩进

    <p style="padding-left:2em;padding-right:2em">
    子曰：“学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知而不愠，不亦君子乎？”
    </p>

9.  插入视频

    <video controls>

    <source src="https://www.w3schools.com/html/movie.mp4" type="video/mp4">

    </video>

    <span style="font-size:12px;"> *来自网络的视频，网址为：<https://www.w3schools.com/html/movie.mp4>* </span>

10. insert definition

    term

    :   1.  item1
        2.  item2
        3.  item3

11. 待选框

    term

    :   1.  [ ] item1
        2.  [ ] item2
        3.  [ ] item3

12. 待定

| Col1 | Col2 | Col3 |
|------|:----:|------|
| a    |      |      |
| bc   |      |      |
| c    |      |      |

| Col1 | Col2 | Col3 |
|------|------|------|
|      |      |      |
|      |      |      |
