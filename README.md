<p align="center">
    <h1 align="center"><a href="https://www.rusersplace.com">guoguo's blog</a></h1>
    <p align="center">头圆脸方，终身学习的数据分析爱好者 😘</p>
</p>

<p align="center">
    <a href="https://github.com/xianmin/hugo-theme-jane" target="_blank">
        <img alt="GitHub Workflow Status" src="https://img.shields.io/badge/blog%20theme-Hugo--theme--jane-orange">
    </a>
    <a href="https://github.com/tony2015116/blogdown" target="_blank">
        <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/tony2015116/blogdown">
    </a>
    <a href="#">
        <img src="https://img.shields.io/github/last-commit/tony2015116/blogdown" alt="GitHub last commit"/>
    </a>
    <a href="https://github.com/tony2015116/blog_comments" target="_blank">
        <img alt="Issues" src="https://img.shields.io/github/issues/tony2015116/blog_comments" />
    </a>
    <a href="https://github.com/tony2015116/blogdown/stargazers">
        <img src="https://img.shields.io/github/stars/tony2015116/blogdown" alt="Stars Badge"/>
    </a>
    <a href="https://github.com/tony2015116/blogdown/network/members">
        <img src="https://img.shields.io/github/forks/tony2015116/blogdown" alt="Forks Badge"/>
    </a>
    <a href="https://github.com/tony2015116/blogdown" target="_blank">
        <img alt="GitHub" src="https://img.shields.io/github/license/tony2015116/blogdown"/>
    </a>
    <a href="#" target="_blank">
        <img src="https://jaywcjlove.github.io/sb/lang/chinese.svg" alt="jaywcjlove/sb"/>
    </a>
    <br/>
    <a href="#" target="_blank">
        <img src="https://img.shields.io/badge/-Hugo-black?style=flat&logo=Hugo&labelColor=5c5c5c&color=1182c3" alt="Hugo"/>
    </a>
    <a href="#" target="_blank">
        <img src="https://img.shields.io/badge/-GitHub-black?style=flat&logo=GitHub&labelColor=5c5c5c&color=1182c3" alt="GitHub"/>
    </a>
    <a href="#" target="_blank">
        <img src="https://img.shields.io/badge/-Rstudio-black?style=flat&logo=Rstudio&labelColor=5c5c5c&color=1182c3" alt="Rstudio"/>
    </a>
     </a>
    <a href="#" target="_blank">
        <img src="https://img.shields.io/badge/-Netlify-black?style=flat&logo=Netlify&labelColor=5c5c5c&color=1182c3" alt="Netlify"/>
    </a>
    <a href="#" target="_blank">
        <img src="https://img.shields.io/badge/-Cloudflare-black?style=flat&logo=Cloudflare&labelColor=5c5c5c&color=1182c3" alt="Cloudflare"/>
    </a>
    <a href="https://www.name.com/zh-cn/" target="_blank"><img src="https://img.shields.io/badge/domain%20web-name.com-1182c3"></a>
    <br/>
    <img alt="Website" src="https://img.shields.io/website?url=https%3A%2F%2Frusersplace.com">
    <img alt="Uptime Robot ratio (7 days)" src="https://img.shields.io/uptimerobot/ratio/7/m791900776-ed1a1390af61a95b31efa693">
    <img alt="Uptime Robot status" src="https://img.shields.io/uptimerobot/status/m791900776-ed1a1390af61a95b31efa693">
 </p>

<!--- #整段注释
![jaywcjlove/sb](https://jaywcjlove.github.io/sb/lang/chinese.svg) #国旗badge
 <a href="https://github.com/pudongping/pudongping.github.io/pulls" target="_blank"><img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/pudongping/pudongping.github.io" /></a> #github pull request badge

#不考虑对齐的badge
![Hugo](https://img.shields.io/badge/-Hugo-black?style=plastic&logo=Hugo&labelColor=5c5c5c&color=1182c3) 
![GitHub](https://img.shields.io/badge/-GitHub-black?style=plastic&logo=GitHub&labelColor=5c5c5c&color=1182c3) 
![Rstudio](https://img.shields.io/badge/-Rstudio-black?style=plastic&logo=Rstudio&labelColor=5c5c5c&color=1182c3) 
![Netlify](https://img.shields.io/badge/-Netlify-black?style=plastic&logo=Netlify&labelColor=5c5c5c&color=1182c3) 
![cloudflare](https://img.shields.io/badge/-Cloudflare-black?style=plastic&logo=Cloudflare&labelColor=5c5c5c&color=1182c3) 
<a href="https://www.name.com/zh-cn/" target="_blank"><img src="https://img.shields.io/badge/website-name.com-1182c3"></a>
 --->

#### **前言**
我想要一个简洁美观，不花里胡哨的静态博客已经有几年了，奈何一致没有找到中意的hugo主题。我比较熟悉R语言，日常工作也都是基于Rstudio开展的，想找到与blogdown适配的hugo中文主题又是难上加难。直到我遇到了[Hugo-theme-jane](https://github.com/xianmin/hugo-theme-jane)，我瞬间又燃气了做一个自己的静态博客的愿望。有关jane主题是否与blogdown适配的问题我放到了最后，先搞起来，但我对css等这些建站技术一点都不了解，只能通过谷歌一点一点的去搜索解决办法，一点点的和blogdown适配的主题做比较，一步一步修改config.yaml文件来达到我想要的博客主题效果。最终，竟真的被我搞出来了😀。

#### **关于我的博客**
我的博客是基于<font color=red>**Rstudio + blogdown + GitHub + Netlify**</font>构架搭建。[Hugo-theme-jane](https://github.com/xianmin/hugo-theme-jane)精美简洁，同时又与**blogdown**比较契合的博客主题👍🏻。我的博客在此基础上做了少许修改。我的博客访问地址:point_right::[https://www.rusersplace.com](https://www.rusersplace.com)。

#### **如何搭建和我一模一样的博客？**
1. 相关软件及网站介绍
- R版本为：Version 4.1.0 (2021-05-18)
- Rstudio版本为：Version 1.4.1717
- R包blogdown版本为：Version 1.9.1
- Hugo版本为：Version 0.92.0
- GitHub：将你的博客内容托管到GitHub
- Git版本为: version 2.31.1.windows.1
- Netlify: 将博客内容静态部署到Netlify，使用GitHub账号登录部署即可
- Cloudflare： 加快博客访问速度
- name.com：购买.com域名,可以使用支付宝付款,我购买的域名大概100多块钱

2. 适合什么人搭建？
如果你使用R语言，同时对Rstudio用的比较熟练，我墙裂推荐你使用我的方法搭建博客。心动不如行动，快来fork我的repo：**blogdown**源代码吧，通过对[Hugo-theme-jane](https://github.com/xianmin/hugo-theme-jane)主题的修改，现在已经可以在Rstudio上写博客了。对于想写博客，又不想折腾的，且对简洁美观有要求的朋友，仅仅修改需要将你下载的repo中/content/post内容删除掉就可以写博客了。

3. 博客搭建思路
网络上已经有很多帖子写关于如何搭建静态博客了，综合起来还是可以理出大致的建站头绪的。首先你得对R，Rstudio比较熟悉，并且在你电脑上已经安装了（建议都安装比较新的版本）；电脑上安装Git，有自己的GitHub账号，通过Rstudio可以调用Git，打通和GitHub的关系，可以实现版本控制；在Rstudio上安装R包~blogdown，通过blogdown的说明，安装Hugo，有时Hugo不同通过Rstudio安装，就需要下载到本地再安装；通过blogdown建站到你指定的文件夹下，使用Jane主题；将博客所在文件夹push到github；申请Netlify账号，将在GitHub上的博客repo部署到netlify；购买.com域名；通过Cloudflare加快博客访问速度。

4. 博客搭建参考
下面的五个建站参考，基本可以解决99%的问题，唯一未涉及到的就是如何在Rstudio中使用Git。
-   [用 R 语言的 blogdown+hugo+netlify+github建博客](https://cosx.org/2018/01/build-blog-with-blogdown-hugo-netlify-github/) - 基本讲述了Rstudio+blogdown+netlify+github框架的构建
-   [如何搭建静态个人博客](https://cosx.org/2018/01/build-blog-with-blogdown-hugo-netlify-github/) - 基本讲述了Rstudio+blogdown+netlify+github框架的构建
-   [Create and publish a Website with R and Hugo](https://cosx.org/2018/01/build-blog-with-blogdown-hugo-netlify-github/) - 基本讲述了Rstudio+blogdown+netlify+github框架的构建
-   [Up & running with blogdown in 2021](https://www.apreshill.com/blog/2020-12-new-year-new-blogdown/) - 基本讲述了Rstudio+blogdown+netlify+github框架的构建
-   [Media Buy之免费且高速的Landing Page部署方案](https://maxjmac.com/affiliate-marketing/high-speed-landing-pages-host/#:~:text=Netlify%E6%9C%AC%E8%BA%AB%E6%98%AF%E4%B8%80%E4%B8%AA%E5%85%8D%E8%B4%B9%E7%9A%84%E9%9D%99%E6%80%81%E7%BD%91%E7%AB%99%E9%83%A8%E7%BD%B2%E6%96%B9%E6%A1%88%EF%BC%8C%E4%B8%BB%E8%A6%81%E6%98%AF%E7%BB%99%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%BD%BF%E7%94%A8%EF%BC%8C%E6%88%91%E7%9A%84%E5%8D%9A%E5%AE%A2%20https%3A%2F%2Fmaxjmac.com,%E6%9C%80%E5%88%9D%E4%B9%9F%E6%98%AF%E4%BD%BF%E7%94%A8Netlify%E4%BD%9C%E4%B8%BA%E9%83%A8%E7%BD%B2%E6%96%B9%E6%A1%88%E3%80%82%20%E5%AE%83%E6%AF%8F%E4%B8%AA%E6%9C%88%E6%9C%89100GB%E7%9A%84%E5%B8%A6%E5%AE%BD%E9%A2%9D%E5%BA%A6%EF%BC%8C%E7%9C%8B%E4%B8%8A%E5%8E%BB%E5%A5%BD%E5%83%8F%E4%B8%8D%E6%98%AF%E5%BE%88%E5%A4%9F%E7%94%A8%EF%BC%8C%E4%BD%86%E6%98%AF%E5%BD%93%E4%BD%A0%E9%85%8D%E5%90%88CloudFlare%E7%9A%84CDN%E8%BF%9B%E8%A1%8C%E4%BD%BF%E7%94%A8%E7%9A%84%E8%AF%9D%EF%BC%8C100GB%E6%98%AF%E5%AE%8C%E5%85%A8%E8%B6%B3%E5%A4%9F%E7%9A%84%E3%80%82) - Cloudflare相关使用介绍




<a href="https://dun.mianbaoduo.com/@guoguo" target="_blank"><img src="https://img.niucodata.com/dundunfan-bt.png" width="300"></a>
