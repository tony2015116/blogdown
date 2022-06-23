---
title: 实现睿保乐nedap种猪性能测定数据自动下载
author: guoguo
date: '2022-06-20'
slug: index.zh-cn
categories:
  - 爬虫
  - 自动化
tags:
  - R
  - selenium
  - RSelenium
  - chromedriver
  - taskscheduleR
  - purrr
lastmod: '2022-06-20T23:48:26+08:00'
keywords: []
description: ''
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: "如需转载，请联系作者，谢谢"
reward: yes
mathjax: no
---

<p style="text-indent:2em;font-size:;font-family:;">
是否每天都要在同一个网站上下载几百份的excel文件？😱是否可虑过自动下载替代手动下载？再加上定时下载呢？是不是很cool?虽然这篇博文是讲的是实现对睿保乐种猪测定系统网站上csv数据自动、定时下载，但也可以作为参考应用到其它场景中。
</p>

<p align="center">
    <img src="images/nedap.png" alt="" width="100%"/>
</p>

<!--more-->

##### 常规方法下载的难点

<p style="text-indent:2em;font-size:;font-family:;">
一般的做法那就是一台测定站每天每天的下载，要下载几十上百台；其次，就是选定多台测定站一天或者一台测定站多天数据来下载。但因为不能一次性下载太多，选定日期和测定站范围太大会导致下载的数据不完整，无论你怎么选择，都是要人工手动进行下载，如果每天下载几百台测定站，没有个把小时是比较难搞定的。
</p>

##### 实现定时自动下载

<p style="text-indent:32px;">
我的思路是依托R平台，使用<font color=red> Selenium + chromedriver + RSelenium + taskscheduleR + purrr</font> 来实现定时自动下载所有数据。
    </p>

> Selenium 是一个用于Web应用程序测试的工具。Selenium测试直接运行在浏览器中，就像真正的用户在操作一样。

-   下载安装谷歌浏览器并安装；

-   下载和谷歌浏览器对应版本的chromedriver；

    [*http://chromedriver.storage.googleapis.com/index.html*](http://chromedriver.storage.googleapis.com/index.html)

    [*https://registry.npmmirror.com/binary.html?path=chromedriver/*](https://registry.npmmirror.com/binary.html?path=chromedriver/)

-   下载selenium-server，本地也必须已经安装java；

    [*https://www.selenium.dev/downloads/*](https://www.selenium.dev/downloads/)

    ![](images/selenium-server.png)

-   在R中安装RSelenium包，通过R代码指令控制谷歌浏览器，替代鼠标点击网站页面；

    ![](images/rselenium.svg)

-   使用谷歌浏览器打开网页，将光标放在所需要点击和输入的地方，点击鼠标右键，选择\~\~\~\~检查，拷贝xpath；

    ![](images/nedap-01.png)

-   按照点击顺序，分别获取xpath。模仿点击网页，输入文本等，最后组合成函数；

-   将以下代码放到.bat文件中，双击运行，必须运行Selenium后，在R中才能使用RSelenium包；

    ![](images/run-selenium.svg)

-   使用purrr包循环运行编写的函数，生成R脚本，实现循环下载；

-   使用taskscheduleR包实现定时运行R脚本；

##### 参考连接：

1.  <https://www.bilibili.com/video/BV1354y1p7GY?p=1>

2.  <https://blog.csdn.net/qq_38984677/article/details/81353537>
