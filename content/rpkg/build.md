---
title: "Build tools"
date: 2021-02-18
summary: "Functions for building govukhugo sites from Rmarkdown"
---

The `{govukhugo}` R package includes two functions for building the Hugo. Use `build_hugo()` to convert Rmarkdown files and the Hugo site, use `build_hugo_rmd()` if you only want to convert Rmarkdown files. The custom rendering function `render_rmd()` is exported to the user, but is not intended for general use. A fuller description of the process is provided in the [main documentation]({{< ref "/docs/rmarkdown.md" >}}).

```r
build_hugo(
  with_rmd = TRUE, 
  rmd_folder = "R/Rmd", 
  rebuild = FALSE
)

build_hugo_rmd(
  rmd_folder = "R/Rmd",
  rebuild = FALSE
)

render_rmd(
  rmd_file, 
  tmp_dir = tempdir(), 
  out_dir = NULL,
  quiet = TRUE
)
```

## Arguments
{{< summarylist noborder >}}
{{< summaryitem "with_rmd" >}}Whether to build Rmarkdown files, default is `TRUE`{{< /summaryitem >}}
{{< summaryitem "rmd_folder" >}}The location of the Rmarkdown files, default is `R/Rmd`{{< /summaryitem >}}
{{< summaryitem "rebuild" >}}Whether to rebuild all the Rmarkdown files, default is `FALSE`{{< /summaryitem >}}
{{< /summarylist >}}

## build_hugo()
`build_hugo()` is a wrapper around `build_hugo_rmd()` that calls the Hugo site builder after the Rmarkdown files have been converted to the format the govukhugo theme expects, this removes the need to call `build_hugo_rmd()` and then switch to a shell terminal to call Hugo directly. The arguments `rmd_folder` and `rebuild` are passed directly to `build_hugo_rmd()`. Calling `build_hugo(with_rmd = FALSE)` is equivalent to calling Hugo from the terminal.

## build_hugo_rmd()
`build_hugo_rmd()` controls the process of building Rmarkdown files into HTML files that can be processed by Hugo.

It is assumed that the Rmarkdown files are stored in an `R/Rmd` folder under the main site directory, however this can be changed via the argument `rmd_folder`. Any data used by the Rmarkdown files is assumed to be in an `R/data` folder under the main site directory, this cannot be changed programmatically at this stage.

The default behaviour of `build_hugo_rmd()` is to only process files that have been changed. This is done by checking the file `rmd.log` in the Rmarkdown folder, which logs ths md5 checksums of the Rmarkdown files. If the log is not available or the setting `rebuild = TRUE` is supplied then all Rmarkdown files will be reprocessed.

## render_rmd()
The process of converting an Rmarkdown file to govukhugo format is controlled by `render_rmd()`, it is called by `build_hugo_rmd()` to convert each Rmarkdown file. While exposed to end users it is not intended for general purpose usage as it implicitly relies on assumptions put in place by `build_hugo_rmd()`.

The main purpose of `render_rmd()` is to post-process a knitted Rmarkdown document. The function knits a file to HTML using `rmarkdown::html_document()` but then strips out header information, reverts the conversion of some punctuation and applies Hugo shortcodes to code blocks. It will then append the Rmarkdown YAML front matter to the HTML and adds a `rmarkdown: true` parameter that ensures the relevant javascript and CSS plugins are added for supported HTML widgets.