<p align="center">
    <h1 align="center"><a href="https://blog.mguo.dpdns.org/">guoguo's blog</a></h1>
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
        <img src="https://img.shields.io/badge/-GitHub%20Pages-black?style=flat&logo=github&labelColor=5c5c5c&color=1182c3" alt="GitHub Pages"/>
    </a>
    <a href="#" target="_blank">
        <img src="https://img.shields.io/badge/-Cloudflare-black?style=flat&logo=Cloudflare&labelColor=5c5c5c&color=1182c3" alt="Cloudflare"/>
    </a>
    <a href="https://www.name.com/zh-cn/" target="_blank"><img src="https://img.shields.io/badge/domain%20web-name.com-1182c3"></a>
    <br/>
    <img alt="Website" src="https://img.shields.io/website?url=https%3A%2F%2Fblog.mguo.dpdns.org%2F">
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
我的博客是基于<font color=red>**RStudio + blogdown + GitHub Pages**</font>构架搭建。[Hugo-theme-jane](https://github.com/xianmin/hugo-theme-jane)精美简洁，同时又与**blogdown**比较契合的博客主题👍🏻。我的博客在此基础上做了少许修改。我的博客访问地址:point_right::[https://blog.mguo.dpdns.org/](https://blog.mguo.dpdns.org/)。

## 在 RStudio 写博客

### 一、首次打开

1. 将仓库克隆或拉取到本地，双击打开 `blogdown.Rproj`。
2. 首次使用时，在 RStudio 的 Console 运行以下命令。当前主题用 Sass 生成样式，需要 Hugo **Extended**。项目和 GitHub Actions 统一使用 `0.92.0`。

   ```r
   install.packages("blogdown")
   blogdown::install_hugo(version = "0.92.0", extended = TRUE)
   ```

3. 运行 `blogdown::serve_site()` 开启预览。网页会随 Markdown 保存刷新。需要关闭预览时，运行 `blogdown::stop_server()`。

### 二、新建与预览

- **普通文章**选 RStudio 的 **Addins → New Post**，填写标题和简短的英文 Slug，格式选 **Markdown**。文章和配图放在同一个 `content/post/日期-短名/` 文件夹。在文章里用 `![说明](图片.png)` 引用同目录图片。
- **需要运行 R 代码的文章**在同一个对话框里选 **R Markdown (.Rmarkdown)**。安装文章用到的 R 包后单击 **Knit**。也可在 Console 指定当前文件渲染。

  ```r
  blogdown::build_site(
    build_rmd = "content/post/2026-11-17-my-post/index.Rmarkdown",
    run_hugo = FALSE
  )
  ```

  将示例路径换成实际路径。已有文章用已提交的 `.markdown` 和图片预览。如果只修改了一篇 R Markdown，单独 Knit 这一篇即可。

- 新文章默认含 `draft: true`。本地可以预览草稿。准备发布时改成 `draft: false`，如果是 R Markdown，修改后再 Knit 一次。

### 三、提交与发布

提交并推送 Markdown 文章及配图。对于 R Markdown 文章，还需一并提交源文件和 Knit 生成的 `.markdown`。启用 GitHub Pages 后，推送到 `main` 会触发仓库里的 **Build and deploy blog** 工作流。GitHub Actions 运行 Hugo 并发布 `public/`。文章里的 R 代码在本地 Knit 时运行。

### 四、首次开通 GitHub Pages

1. 打开本仓库的 [Settings → Pages](https://github.com/tony2015116/blogdown/settings/pages)，把 **Build and deployment → Source** 设为 **GitHub Actions**。
2. 在同一页面的 **Custom domain** 中填入 `blog.mguo.dpdns.org` 并保存。到管理 `mguo.dpdns.org` 的 DNS 控制台添加以下记录。

   | 类型 | 名称 | 目标 |
   | --- | --- | --- |
   | CNAME | `blog` | `tony2015116.github.io` |

3. 等待 GitHub 的 DNS 检查通过，确认 **Enforce HTTPS** 已勾选。可在 [Actions](https://github.com/tony2015116/blogdown/actions/workflows/pages.yml) 中手动运行 **Build and deploy blog**，用 Pages 设置页显示的地址验收。

`config.yaml` 记录博客的正式地址。GitHub Actions 从 Pages 设置读取实际发布地址，构建时将导航、样式和文章链接指到该地址。

### 博客搭建参考


下面的五个建站参考，基本可以解决99%的问题，唯一未涉及到的就是如何在Rstudio中使用Git。
-   [用 R 语言的 blogdown+hugo+netlify+github建博客](https://cosx.org/2018/01/build-blog-with-blogdown-hugo-netlify-github/) - 基本讲述了Rstudio+blogdown+netlify+github框架的构建
-   [如何搭建静态个人博客](https://cosx.org/2018/01/build-blog-with-blogdown-hugo-netlify-github/) - 基本讲述了Rstudio+blogdown+netlify+github框架的构建
-   [Create and publish a Website with R and Hugo](https://cosx.org/2018/01/build-blog-with-blogdown-hugo-netlify-github/) - 基本讲述了Rstudio+blogdown+netlify+github框架的构建
-   [Up & running with blogdown in 2021](https://www.apreshill.com/blog/2020-12-new-year-new-blogdown/) - 基本讲述了Rstudio+blogdown+netlify+github框架的构建
-   [Media Buy之免费且高速的Landing Page部署方案](https://maxjmac.com/affiliate-marketing/high-speed-landing-pages-host/#:~:text=Netlify%E6%9C%AC%E8%BA%AB%E6%98%AF%E4%B8%80%E4%B8%AA%E5%85%8D%E8%B4%B9%E7%9A%84%E9%9D%99%E6%80%81%E7%BD%91%E7%AB%99%E9%83%A8%E7%BD%B2%E6%96%B9%E6%A1%88%EF%BC%8C%E4%B8%BB%E8%A6%81%E6%98%AF%E7%BB%99%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%E4%BD%BF%E7%94%A8%EF%BC%8C%E6%88%91%E7%9A%84%E5%8D%9A%E5%AE%A2%20https%3A%2F%2Fmaxjmac.com,%E6%9C%80%E5%88%9D%E4%B9%9F%E6%98%AF%E4%BD%BF%E7%94%A8Netlify%E4%BD%9C%E4%B8%BA%E9%83%A8%E7%BD%B2%E6%96%B9%E6%A1%88%E3%80%82%20%E5%AE%83%E6%AF%8F%E4%B8%AA%E6%9C%88%E6%9C%89100GB%E7%9A%84%E5%B8%A6%E5%AE%BD%E9%A2%9D%E5%BA%A6%EF%BC%8C%E7%9C%8B%E4%B8%8A%E5%8E%BB%E5%A5%BD%E5%83%8F%E4%B8%8D%E6%98%AF%E5%BE%88%E5%A4%9F%E7%94%A8%EF%BC%8C%E4%BD%86%E6%98%AF%E5%BD%93%E4%BD%A0%E9%85%8D%E5%90%88CloudFlare%E7%9A%84CDN%E8%BF%9B%E8%A1%8C%E4%BD%BF%E7%94%A8%E7%9A%84%E8%AF%9D%EF%BC%8C100GB%E6%98%AF%E5%AE%8C%E5%85%A8%E8%B6%B3%E5%A4%9F%E7%9A%84%E3%80%82) - Cloudflare相关使用介绍
