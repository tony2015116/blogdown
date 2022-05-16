---
title: hello world2
author: tony
date: '2022-05-07'
slug: hello-world2
categories: []
tags: []
lastmod: '2022-05-07T15:29:34+08:00'
keywords: []
description: ''
comment: no
toc: no
autoCollapseToc: no
contentCopyright: no
reward: no
mathjax: no
---

# 标题一
该次仅测试用
love 33

```r
summary(iris)
```

```
##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
##        Species  
##  setosa    :50  
##  versicolor:50  
##  virginica :50  
##                 
##                 
## 
```

```r
plot(iris$Sepal.Length ~ iris$Sepal.Width)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-1-1.png" width="672" />

## Footnote-2

```
## Warning: 程辑包'ggplot2'是用R版本4.1.1 来建造的
```

```
## Warning: `guides(<scale> = FALSE)` is deprecated. Please use `guides(<scale> =
## "none")` instead.
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-1.png" width="672" />

<script language=JavaScript>
<!--
var caution = false
function setCookie(name, value, expires, path, domain, secure){
var curCookie = name + "=" + escape(value) +
((expires) ? "; expires=" + expires.toGMTString() : "") +
((path) ? "; path=" + path : "") +
((domain) ? "; domain=" + domain : "") +
((secure) ? "; secure" : "")
if (!caution || (name + "=" + escape(value)).length<= 4000)
document.cookie = curCookie
else
if (confirm("Cookie exceeds 4KB and will be cut!"))
document.cookie = curCookie
}
function getCookie(name) {
var prefix = name + "="
var cookieStartIndex = document.cookie.indexOf(prefix)
if (cookieStartIndex == -1)
return null
var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex+ prefix.length)
if (cookieEndIndex == -1)
cookieEndIndex = document.cookie.length
return unescape(document.cookie.substring(cookieStartIndex +prefix.length, cookieEndIndex))
}
function deleteCookie(name, path, domain) {
if (getCookie(name)) {
document.cookie = name + "=" +
((path) ? "; path=" + path : "") +
((domain) ? "; domain=" + domain : "") +
"; expires=Thu, 01-Jan-70 00:00:01 GMT"
}
}
function fixDate(date) {
var base = new Date(0)
var skew = base.getTime()
if (skew > 0)
date.setTime(date.getTime() - skew)
}
var now = new Date()
fixDate(now)
now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000)
var visits = getCookie("counter")
if (!visits)
visits = 1
else
visits = parseInt(visits) + 1
setCookie("counter", visits, now)
document.write("您是第" + visits + "位访问本专题的！")
// -->
</script>
![](index_files/figure-html/unnamed-chunk-1-1.png)

<!--more-->
<script src="https://utteranc.es/client.js"
repo="tony2015116/blog_comments"
issue-term="pathname"
label="💬"
theme="github-light"
crossorigin="anonymous"
async>
  </script>
