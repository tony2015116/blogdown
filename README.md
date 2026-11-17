# MGUO 的博客

[![GitHub Pages 部署状态](https://github.com/tony2015116/blogdown/actions/workflows/pages.yml/badge.svg?branch=main)](https://github.com/tony2015116/blogdown/actions/workflows/pages.yml)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.md)

[访问博客](https://blog.mguo.dpdns.org/) · [个人主页](https://mguo.dpdns.org/)

这里记录我在 R 语言、数据分析和猪遗传育种工作中的实践。文章主要整理实际遇到的问题、可复用的代码，以及对分析方法的理解。

## 一、博客导航

- 首页按时间显示最新文章，顶部的「归档」「标签」「分类」可用来查找旧文章。
- 顶部导航随页面滚动固定在上方，右侧的太阳或月亮图标用于切换明暗模式。
- 博客侧栏提供「个人主页」和 GitHub 入口。个人主页顶部的「博客」可跳回本站。
- 页脚的「关于博客」介绍写作内容和建站方式。

## 二、在 RStudio 本地预览

克隆仓库或拉取最新的 `main`。双击打开 `blogdown.Rproj`，如果项目已打开，先在 RStudio 选择 **Session → Restart R**。博客使用 blogdown 和定制的 [Hugo Jane](https://github.com/xianmin/hugo-theme-jane) 主题。本地和 GitHub Actions 都固定使用 **Hugo 0.170.0**。

首次使用时，在 RStudio 的 Console 安装依赖。

```r
install.packages("blogdown")
blogdown::install_hugo(version = "0.170.0", extended = FALSE)
blogdown::hugo_version()
```

如果 Windows 64 位电脑提示找不到该版本，从 [Hugo 官方发布页下载兼容文件名的 ZIP](https://github.com/gohugoio/hugo/releases/download/v0.170.0/hugo_extended_0.170.0_windows-amd64.zip)。保留原文件名和 ZIP 格式，在 RStudio 运行以下命令并选择下载的文件。

```r
blogdown::install_hugo(version = file.choose(), extended = FALSE)
blogdown::hugo_version()
```

运行 `blogdown::serve_site()` 开启本地预览。保存普通 Markdown 后可看到更新。预览结束时运行 `blogdown::stop_server()`。

## 三、新建和发布文章

1. 在 RStudio 选择 **Addins → New Post**，填写标题和简短的英文 Slug。普通文章选 **Markdown**。需要运行 R 代码时选 **R Markdown (.Rmarkdown)**。
2. 文章位于 `content/post/日期-短名/`。配图可以放在文章文件夹里，用 `![说明](图片.png)` 引用同目录图片。
3. 新文章默认是草稿。本地确认后，将文章头部的 `draft: true` 改为 `draft: false`。
4. R Markdown 文章在本地安装所需的 R 包，然后点击 **Knit**。修改正文或草稿状态后再 Knit 一次。也可以在 Console 指定单篇文件渲染，将下面的示例路径换成实际路径。

   ```r
   blogdown::build_site(
     build_rmd = "content/post/2026-11-17-my-post/index.Rmarkdown",
     run_hugo = FALSE
   )
   ```

5. 提交文章和配图。R Markdown 文章同时提交 `.Rmarkdown` 源文件、Knit 生成的 `.markdown` 文件及相关资源。推送到 `main` 后，GitHub Actions 用 Hugo 生成并发布网站。R 代码在本地 Knit 时执行。

发布进度可在 [Build and deploy blog](https://github.com/tony2015116/blogdown/actions/workflows/pages.yml) 查看。部署完成后，在博客首页打开新文章，核对正文和图片。

## 四、常用维护位置

| 要修改的内容 | 文件或目录 |
| --- | --- |
| 文章和配图 | [`content/post/`](content/post/) |
| 「关于博客」正文 | [`content/about.md`](content/about.md) |
| 博客地址、网站标题和导航项 | [`config.yaml`](config.yaml) |
| 顶栏、作者侧栏和页脚 | [`layouts/_default/baseof.html`](layouts/_default/baseof.html) |
| 首页文章列表 | [`layouts/index.html`](layouts/index.html) |
| 站点样式与明暗切换 | [`static/css/custom.css`](static/css/custom.css)、[`static/js/blog-theme.js`](static/js/blog-theme.js) |
| Jane 基础样式（已编译的 CSS） | [`assets/sass/jane.min.css`](assets/sass/jane.min.css) |
| RStudio 博客项目选项 | [`.Rprofile`](.Rprofile) |
| GitHub Pages 发布流程 | [`.github/workflows/pages.yml`](.github/workflows/pages.yml) |

Hugo 直接读取并生成带内容指纹的 Jane 基础样式。写文章和日常修改 `static/css/custom.css` 无需安装 Sass。

## 五、GitHub Pages 与域名

仓库的 [Settings → Pages](https://github.com/tony2015116/blogdown/settings/pages) 使用 **GitHub Actions** 作为发布来源，自定义域名为 `blog.mguo.dpdns.org`。当前 DNS 配置如下。

| 类型 | 名称 | 目标 | Cloudflare 代理 |
| --- | --- | --- | --- |
| CNAME | `blog` | `tony2015116.github.io` | 仅 DNS |

迁移域名时，同步更新 `config.yaml` 的 `baseURL` 和 Pages 自定义域名。DNS 检查通过、证书签发后，可在 Pages 设置中启用 **Enforce HTTPS**。发布工作流读取 Pages 的站点地址，生成 HTTPS 链接。

项目代码许可见 [LICENSE.md](LICENSE.md)。
