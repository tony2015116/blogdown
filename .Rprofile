# Restart the R session after changing these project options.
if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

options(
  blogdown.hugo.version = "0.170.0",
  blogdown.serve_site.startup = FALSE,
  blogdown.knit.on_save = FALSE,
  blogdown.author = "郭猛",
  blogdown.ext = ".md",
  blogdown.subdir = "post",
  blogdown.new_bundle = TRUE,
  # R 运行结果前缀用 "#>"（knitr 默认是 "##"），和代码注释 "#" 区分开
  knitr.chunk.comment = "#>"
)
