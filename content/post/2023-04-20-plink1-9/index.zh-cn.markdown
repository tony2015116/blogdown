---
title: 使用plink1.9替换个体ID以及格式转换
author: guoguo
date: '2023-04-20'
slug: index.zh-cn
categories:
  - 数据处理
  - Genomic Selection
tags:
  - plink1.9
  - 生物芯片数据
  - 格式转换
  - 替换芯片个体ID
lastmod: '2023-04-20T21:56:30+08:00'
keywords: []
description: '使用plink替换生物芯片个体ID'
comment: yes
toc: no
autoCollapseToc: no
contentCopyright: no
reward: no
mathjax: no
---

<p style="text-indent:2em;font-size:;font-family:;">
刚好有芯片数据需要处理，就结合chatGPT重新整理了一下使用plink替换芯片中个体ID的方法。
</p>

<!--more-->

#### 替换芯片个体ID

<p style="text-indent:2em;font-size:;font-family:;">
提前准备了测试文件toy.ped和toy.map。其中芯片个体ID在toy.ped中，分别为1000000000和1000000001。
</p>


```bash
cd C:/Users/Dell/Downloads/plink
ls -l
less -S toy.map
less -S toy.ped
```

```
## total 41
## -rw-r--r-- 1 Dell None  974 Apr 20 22:36 a1.log
## -rw-r--r-- 1 Dell None  418 Apr 20 22:36 a1.vcf
## -rw-r--r-- 1 Dell None  982 Apr 20 22:36 a2.log
## -rw-r--r-- 1 Dell None  414 Apr 20 22:36 a2.vcf
## -rw-r--r-- 1 Dell None 1042 Apr 20 22:36 a3.log
## -rw-r--r-- 1 Dell None  410 Apr 20 22:36 a3.vcf
## -rw-r--r-- 1 Dell None 1081 Apr 20 22:36 a4.log
## -rw-r--r-- 1 Dell None  414 Apr 20 22:36 a4.vcf
## -rw-r--r-- 1 Dell None  970 Apr 20 22:36 a5.log
## -rw-r--r-- 1 Dell None   97 Apr 20 22:36 a5.raw
## -rw-r--r-- 1 Dell None 1030 Apr 20 22:36 a6.log
## -rw-r--r-- 1 Dell None   93 Apr 20 22:36 a6.raw
## -rw-r--r-- 1 Dell None  520 Apr 20 21:23 code.txt
## -rw-r--r-- 1 Dell None   48 Apr 20 20:17 id_map.txt
## -rw-r--r-- 1 Dell None   27 Oct 20  2020 toy.map
## -rw-r--r-- 1 Dell None   58 Oct 20  2020 toy.ped
## -rw-r--r-- 1 Dell None 1001 Apr 20 22:36 toy.updated.log
## -rw-r--r-- 1 Dell None   29 Apr 20 22:36 toy.updated.map
## -rw-r--r-- 1 Dell None   28 Apr 20 22:36 toy.updated.nosex
## -rw-r--r-- 1 Dell None   58 Apr 20 22:36 toy.updated.ped
## 1	rs0	0	1000
## 1	rs10	0	1001
## 1 1000000000 0 0 1 1 0 0 A A
## 1 1000000001 0 0 1 2 C C A G
```


```bash
cd C:/Users/Dell/Downloads/plink
awk '{print $1, $2}' toy.ped
```

```
## 1 1000000000
## 1 1000000001
```

<p style="text-indent:2em;font-size:;font-family:;">
准备一个文本文件，这里是id_map.txt, 第1列是旧FID，第2列是旧IID，第3列是新FID，第4列是新IID，每列使用空格或tab隔开。对于空缺的，可以使用0替代。
</p>


```bash
cd C:/Users/Dell/Downloads/plink
less -S id_map.txt
```

```
## 1	1000000000	1	sample_1
## 1	1000000001	1	sample_2
```

<p style="text-indent:2em;font-size:;font-family:;">
比较toy.ped和toy.updated.ped中的个体ID即IID，已替换为新的芯片ID。
</p>


```bash
cd C:/Users/Dell/Downloads/plink
plink --file toy --update-ids id_map.txt --recode --out toy.updated
less -S toy.ped
less -S toy.updated.ped
```

```
## PLINK v1.90b6.26 64-bit (2 Apr 2022)           www.cog-genomics.org/plink/1.9/
## (C) 2005-2022 Shaun Purcell, Christopher Chang   GNU General Public License v3
## Logging to toy.updated.log.
## Options in effect:
##   --file toy
##   --out toy.updated
##   --recode
##   --update-ids id_map.txt
## 
## 32578 MB RAM detected; reserving 16289 MB for main workspace.
## Scanning .ped file... 0%50%100%
.ped scan complete (for binary autoconversion).
## Performing single-pass .bed write (2 variants, 2 people).
## 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%
--file: toy.updated-temporary.bed + toy.updated-temporary.bim +
## toy.updated-temporary.fam written.
## 2 variants loaded from .bim file.
## 2 people (2 males, 0 females) loaded from .fam.
## 2 phenotype values loaded from .fam.
## --update-ids: 2 people updated.
## Using 1 thread (no multithreaded calculations invoked).
## Before main variant filters, 2 founders and 0 nonfounders present.
## Calculating allele frequencies... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99% done.
## Total genotyping rate is 0.75.
## 2 variants and 2 people pass filters and QC.
## Among remaining phenotypes, 1 is a case and 1 is a control.
## --recode ped to toy.updated.ped + toy.updated.map ... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99%done.
## 1 1000000000 0 0 1 1 0 0 A A
## 1 1000000001 0 0 1 2 C C A G
## 1 sample_1 0 0 1 1 0 0 A A
## 1 sample_2 0 0 1 2 C C G A
```

#### plink格式转换中容易忽略的问题及一些相关常用代码

##### \--recode vcf 和 --recode vcf-iid的区别

在 PLINK 1.9 中，--recode vcf 和 --recode vcf-iid 都用于将数据转换为 VCF 格式。但它们之间的主要区别在于生成的 VCF 文件中的样本 ID（individual ID）表示方式。

--recode vcf：使用此选项时，PLINK 会在生成的 VCF 文件中将样本 ID 设置为 "FID_IID"，其中 FID 是家族 ID（Family ID），IID 是个体 ID（Individual ID）。在 PLINK 的 PED 文件和其他输入格式中，样本通常都有一个家族 ID 和一个个体 ID。如果家族 ID 和个体 ID 相同，生成的 VCF 文件中的样本 ID 将是 "IID_IID" 的形式。

--recode vcf-iid：使用此选项时，PLINK 仅使用个体 ID（IID）作为生成的 VCF 文件中的样本 ID。即使样本具有家族 ID，也不会将其包含在 VCF 文件的样本 ID 中。


```bash
cd C:/Users/Dell/Downloads/plink
plink --file toy --recode vcf --out a1
plink --file toy --recode vcf-iid --out a2
less -S a1.vcf
less -S a2.vcf
```

```
## PLINK v1.90b6.26 64-bit (2 Apr 2022)           www.cog-genomics.org/plink/1.9/
## (C) 2005-2022 Shaun Purcell, Christopher Chang   GNU General Public License v3
## Logging to a1.log.
## Options in effect:
##   --file toy
##   --out a1
##   --recode vcf
## 
## 32578 MB RAM detected; reserving 16289 MB for main workspace.
## Scanning .ped file... 0%50%100%
.ped scan complete (for binary autoconversion).
## Performing single-pass .bed write (2 variants, 2 people).
## 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%
--file: a1-temporary.bed + a1-temporary.bim + a1-temporary.fam written.
## 2 variants loaded from .bim file.
## 2 people (2 males, 0 females) loaded from .fam.
## 2 phenotype values loaded from .fam.
## Using 1 thread (no multithreaded calculations invoked).
## Before main variant filters, 2 founders and 0 nonfounders present.
## Calculating allele frequencies... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99% done.
## Total genotyping rate is 0.75.
## 2 variants and 2 people pass filters and QC.
## Among remaining phenotypes, 1 is a case and 1 is a control.
## --recode vcf to a1.vcf ... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99%done.
## PLINK v1.90b6.26 64-bit (2 Apr 2022)           www.cog-genomics.org/plink/1.9/
## (C) 2005-2022 Shaun Purcell, Christopher Chang   GNU General Public License v3
## Logging to a2.log.
## Options in effect:
##   --file toy
##   --out a2
##   --recode vcf-iid
## 
## 32578 MB RAM detected; reserving 16289 MB for main workspace.
## Scanning .ped file... 0%50%100%
.ped scan complete (for binary autoconversion).
## Performing single-pass .bed write (2 variants, 2 people).
## 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%
--file: a2-temporary.bed + a2-temporary.bim + a2-temporary.fam written.
## 2 variants loaded from .bim file.
## 2 people (2 males, 0 females) loaded from .fam.
## 2 phenotype values loaded from .fam.
## Using 1 thread (no multithreaded calculations invoked).
## Before main variant filters, 2 founders and 0 nonfounders present.
## Calculating allele frequencies... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99% done.
## Total genotyping rate is 0.75.
## 2 variants and 2 people pass filters and QC.
## Among remaining phenotypes, 1 is a case and 1 is a control.
## --recode vcf-iid to a2.vcf ... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99%done.
## ##fileformat=VCFv4.2
## ##fileDate=20230420
## ##source=PLINKv1.90
## ##contig=<ID=1,length=1002>
## ##INFO=<ID=PR,Number=0,Type=Flag,Description="Provisional reference allele, may not be based on real reference genome">
## ##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
## #CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	1_1000000000	1_1000000001
## 1	1000	rs0	C	.	.	.	PR	GT	./.	0/0
## 1	1001	rs10	A	G	.	.	PR	GT	0/0	0/1
## ##fileformat=VCFv4.2
## ##fileDate=20230420
## ##source=PLINKv1.90
## ##contig=<ID=1,length=1002>
## ##INFO=<ID=PR,Number=0,Type=Flag,Description="Provisional reference allele, may not be based on real reference genome">
## ##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
## #CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	1000000000	1000000001
## 1	1000	rs0	C	.	.	.	PR	GT	./.	0/0
## 1	1001	rs10	A	G	.	.	PR	GT	0/0	0/1
```

##### 或许有用的一些代码


```bash
cd C:/Users/Dell/Downloads/plink
plink --vcf a1.vcf --update-ids id_map.txt --recode --out toy.updated
less -S toy.updated.ped
plink --file toy --update-ids id_map.txt --recode vcf-iid --out a3
less -S a3.vcf
plink --file toy --update-ids id_map.txt --recode vcf --out a4
less -S a4.vcf
plink --file toy --recodeA --out a5
less -S a5.vcf
plink --file toy --update-ids id_map.txt --recodeA --out a6
less -S a6.vcf
```

```
## PLINK v1.90b6.26 64-bit (2 Apr 2022)           www.cog-genomics.org/plink/1.9/
## (C) 2005-2022 Shaun Purcell, Christopher Chang   GNU General Public License v3
## Logging to toy.updated.log.
## Options in effect:
##   --out toy.updated
##   --recode
##   --update-ids id_map.txt
##   --vcf a1.vcf
## 
## 32578 MB RAM detected; reserving 16289 MB for main workspace.
## 
--vcf: toy.updated-temporary.bed + toy.updated-temporary.bim +
## toy.updated-temporary.fam written.
## 2 variants loaded from .bim file.
## 2 people (0 males, 0 females, 2 ambiguous) loaded from .fam.
## Ambiguous sex IDs written to toy.updated.nosex .
## --update-ids: 2 people updated.
## Using 1 thread (no multithreaded calculations invoked).
## Before main variant filters, 2 founders and 0 nonfounders present.
## Calculating allele frequencies... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99% done.
## Total genotyping rate is 0.75.
## 2 variants and 2 people pass filters and QC.
## Note: No phenotypes present.
## --recode ped to toy.updated.ped + toy.updated.map ... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99%done.
## 1 sample_1 0 0 0 -9 0 0 A A
## 1 sample_2 0 0 0 -9 C C G A
## PLINK v1.90b6.26 64-bit (2 Apr 2022)           www.cog-genomics.org/plink/1.9/
## (C) 2005-2022 Shaun Purcell, Christopher Chang   GNU General Public License v3
## Logging to a3.log.
## Options in effect:
##   --file toy
##   --out a3
##   --recode vcf-iid
##   --update-ids id_map.txt
## 
## 32578 MB RAM detected; reserving 16289 MB for main workspace.
## Scanning .ped file... 0%50%100%
.ped scan complete (for binary autoconversion).
## Performing single-pass .bed write (2 variants, 2 people).
## 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%
--file: a3-temporary.bed + a3-temporary.bim + a3-temporary.fam written.
## 2 variants loaded from .bim file.
## 2 people (2 males, 0 females) loaded from .fam.
## 2 phenotype values loaded from .fam.
## --update-ids: 2 people updated.
## Using 1 thread (no multithreaded calculations invoked).
## Before main variant filters, 2 founders and 0 nonfounders present.
## Calculating allele frequencies... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99% done.
## Total genotyping rate is 0.75.
## 2 variants and 2 people pass filters and QC.
## Among remaining phenotypes, 1 is a case and 1 is a control.
## --recode vcf-iid to a3.vcf ... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99%done.
## ##fileformat=VCFv4.2
## ##fileDate=20230420
## ##source=PLINKv1.90
## ##contig=<ID=1,length=1002>
## ##INFO=<ID=PR,Number=0,Type=Flag,Description="Provisional reference allele, may not be based on real reference genome">
## ##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
## #CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	sample_1	sample_2
## 1	1000	rs0	C	.	.	.	PR	GT	./.	0/0
## 1	1001	rs10	A	G	.	.	PR	GT	0/0	0/1
## PLINK v1.90b6.26 64-bit (2 Apr 2022)           www.cog-genomics.org/plink/1.9/
## (C) 2005-2022 Shaun Purcell, Christopher Chang   GNU General Public License v3
## Logging to a4.log.
## Options in effect:
##   --file toy
##   --out a4
##   --recode vcf
##   --update-ids id_map.txt
## 
## 32578 MB RAM detected; reserving 16289 MB for main workspace.
## Scanning .ped file... 0%50%100%
.ped scan complete (for binary autoconversion).
## Performing single-pass .bed write (2 variants, 2 people).
## 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%
--file: a4-temporary.bed + a4-temporary.bim + a4-temporary.fam written.
## 2 variants loaded from .bim file.
## 2 people (2 males, 0 females) loaded from .fam.
## 2 phenotype values loaded from .fam.
## --update-ids: 2 people updated.
## Using 1 thread (no multithreaded calculations invoked).
## Before main variant filters, 2 founders and 0 nonfounders present.
## Calculating allele frequencies... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99% done.
## Total genotyping rate is 0.75.
## 2 variants and 2 people pass filters and QC.
## Among remaining phenotypes, 1 is a case and 1 is a control.
## --recode vcf to a4.vcf ... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99%done.
## Warning: Underscore(s) present in sample IDs.
## ##fileformat=VCFv4.2
## ##fileDate=20230420
## ##source=PLINKv1.90
## ##contig=<ID=1,length=1002>
## ##INFO=<ID=PR,Number=0,Type=Flag,Description="Provisional reference allele, may not be based on real reference genome">
## ##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
## #CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	1_sample_1	1_sample_2
## 1	1000	rs0	C	.	.	.	PR	GT	./.	0/0
## 1	1001	rs10	A	G	.	.	PR	GT	0/0	0/1
## PLINK v1.90b6.26 64-bit (2 Apr 2022)           www.cog-genomics.org/plink/1.9/
## (C) 2005-2022 Shaun Purcell, Christopher Chang   GNU General Public License v3
## Note: --recodeA flag deprecated.  Use "--recode A ...".
## Logging to a5.log.
## Options in effect:
##   --file toy
##   --out a5
##   --recode A
## 
## 32578 MB RAM detected; reserving 16289 MB for main workspace.
## Scanning .ped file... 0%50%100%
.ped scan complete (for binary autoconversion).
## Performing single-pass .bed write (2 variants, 2 people).
## 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%
--file: a5-temporary.bed + a5-temporary.bim + a5-temporary.fam written.
## 2 variants loaded from .bim file.
## 2 people (2 males, 0 females) loaded from .fam.
## 2 phenotype values loaded from .fam.
## Using 1 thread (no multithreaded calculations invoked).
## Before main variant filters, 2 founders and 0 nonfounders present.
## Calculating allele frequencies... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99% done.
## Total genotyping rate is 0.75.
## 2 variants and 2 people pass filters and QC.
## Among remaining phenotypes, 1 is a case and 1 is a control.
## --recode A to a5.raw ... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99%done.
## a5.vcf: No such file or directory
## PLINK v1.90b6.26 64-bit (2 Apr 2022)           www.cog-genomics.org/plink/1.9/
## (C) 2005-2022 Shaun Purcell, Christopher Chang   GNU General Public License v3
## Note: --recodeA flag deprecated.  Use "--recode A ...".
## Logging to a6.log.
## Options in effect:
##   --file toy
##   --out a6
##   --recode A
##   --update-ids id_map.txt
## 
## 32578 MB RAM detected; reserving 16289 MB for main workspace.
## Scanning .ped file... 0%50%100%
.ped scan complete (for binary autoconversion).
## Performing single-pass .bed write (2 variants, 2 people).
## 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%
--file: a6-temporary.bed + a6-temporary.bim + a6-temporary.fam written.
## 2 variants loaded from .bim file.
## 2 people (2 males, 0 females) loaded from .fam.
## 2 phenotype values loaded from .fam.
## --update-ids: 2 people updated.
## Using 1 thread (no multithreaded calculations invoked).
## Before main variant filters, 2 founders and 0 nonfounders present.
## Calculating allele frequencies... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99% done.
## Total genotyping rate is 0.75.
## 2 variants and 2 people pass filters and QC.
## Among remaining phenotypes, 1 is a case and 1 is a control.
## --recode A to a6.raw ... 0%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23%24%25%26%27%28%29%30%31%32%33%34%35%36%37%38%39%40%41%42%43%44%45%46%47%48%49%50%51%52%53%54%55%56%57%58%59%60%61%62%63%64%65%66%67%68%69%70%71%72%73%74%75%76%77%78%79%80%81%82%83%84%85%86%87%88%89%90%91%92%93%94%95%96%97%98%99%done.
## a6.vcf: No such file or directory
```
