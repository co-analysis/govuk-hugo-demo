---
title: "Hugo-ify R Markdown documents"
date: 2021-01-28
weight: 300
Summary: Using the {govukhugo} package to render and build sites with R Markdown documents
---

[Hugo](https://gohugo.io) is a static site builder that is fast and lightweight, it is the preferred engine for building [`{blogdown}`](https://cran.r-project.org/package=blogdown) sites.

[`govukhugo`](https://github.com/co-analysis/govukhugo) is a theme for Hugo that applies the [GOV.UK Design System](https://design-system.service.gov.uk/). The theme is designed with dashboard-/book-style output common for publishing data products, and has been strongly influenced by the application of the Design System's principle and components in Public Health England's [Coronavirus dashboard](https://coronavirus.data.gov.uk/).

`{govukhugo}` is an R package that enables the use of R Markdown documents in Hugo static sites using the `govukhugo` theme, it provides an easy way for R users to initialise a Hugo site using the `govukhugo` theme. The `govukhugo` theme is not compatible with `{blogdown}`, therefore the package also provides a means to render and build Rmarkdown documents.

Examples of how `{govukhugo}` converts a [static R Markdown page]({{< relref "tests/static_rmd.html" >}}) and an [interactive R Markdown page]({{< relref "tests/interactive_rmd.html" >}}) are provided in the tests section of this documentation.

{{< TOC >}}

## govdown or govukhugo
The work of `govukhugo` is inspired by the earlier efforts of the [`{govdown}`](https://ukgovdatascience.github.io/govdown/) package that worked entirely within the Rmarkdown ecosystem, `govukhugo` builds on the early lessons learnt by the `{govdown}` project and aims to overcome some of its limitations.

The design of `{govdown}` is itself inspired by the [`{bookdown}`](https://bookdown.org/yihui/bookdown/) package which is designed to enable R users to write books using Rmarkdown, including rendering them as HTML. Unfortunately `{bookdown}` rendered websites do not easily support sub-directories and all content is assumed to sit at the same level.

`{govdown}` renders content to look similar to that for standard GOV.UK service pages, this is a layout optimised for prose (guidance and reports) and transactional services (such as applying for a passport). However, this layout is not necessarily optimised for communicating data, statistics and analysis, `govukhugo` seeks to overcome this by adopting a 'dashboard' layout. In simple terms the standard layout supported by `{govdown}` can be considered a 'portrait' orientation, whereas the dashboard layout of `govukhugo` as having a 'landscape' orientation by default.

As a complete Rmarkdown package, `{govdown}` uses Pandoc and its lua filters to render content into the GOV.UK design system. This is particularly complicated to maintain and update, especially the support of design system components. The Hugo templating system makes it much easier to maintain the base scaffold of the `govukhugo` theme, and to customise individual sites as necessary. Furthermore, the Hugo shortcode system makes it easy to extend support for different design system components and patterns.

`govukhugo` and its R package are not a complete Rmarkdown package, as discussed below you cannot "knit" an Rmarkdown document into a govukhugo page, rather Rmarkdown is used to create interactive pages within the framework of a `govukhugo` site. The added benefit here is that the `govukhugo` can be used with other data science technologies and languages that can generate markdown or HTML content.


## Installing and using {govukhugo}

The `{govukhugo}` package is not currently on CRAN, you can install it from GitHub:

```r
remotes::install_github("co-analysis/govuk-hugo-r")
```

Within RStudio you can use `init_govuk_hugo()` to create a Hugo site with the `govukhugo` theme. Otherwise follow the general [getting started info]({{< relref "../_index.md" >}}).

```r
library(govukhugo)
init_govuk_hugo()
```

The package includes an R Markdown template that provides an outline skeleton which you can access from the R Markdown menu in R Studio.

It is recommended that you save R Markdown documents in the `R/Rmd` folder of your project. In the R Markdown YAML header you should specify the `section` (i.e. sub-folder of the `content` directory) where you want the Rmd file to be placed after it has been converted.

Once you have written and saved your R Markdown document(s), you can then build your Hugo site by calling `build_hugo_site()`.

```r
build_hugo_site()
```

By default `build_hugo()` will look for and process Rmd files in the `R/Rmd` folder, you can specify a different folder by the altering the `rmd_folder` argument, setting `with_rmd` to false skips the building of Rmd files.

```r
# specify a different folder
build_hugo(rmd_folder = "code/Rmarkdown")

# skip Rmd processing
build_hugo(with_rmd = FALSE)
```

In more advanced site building you might not want to build the Hugo site, just convert your R Markdown files. You can do this by calling `build_hugo_rmd()`. As with `build_hugo()` the default assumption is that R Markdown is stored in the `R/Rmd` folder.

```r
build_hugo_rmd()

# specify a different folder
build_hugo_rmd(rmd_folder = "code/Rmarkdown")
```

You can render a single R Markdown file by calling `render_rmd()`. This will use the `section` as defined in the YAML header, however for testing purposes you may want to output file somewhere else, which you can do by specifying a different folder using the `out_dir` argument.

```r
render_rmd("R/Rmd/my_file.Rmd")

render_rmd("R/Rmd/my_file.Rmd", out_dir = "R/test_output")
```

Interactive elements from the [`{DT}`](https://rstudio.github.io/DT/), [`{plotly}`](https://plot.ly/r/) and  [`{leaflet}`](https://rstudio.github.io/leaflet/) packages are supported (see below).

## Converting RMarkdown documents

While Hugo is intended for converting plain markdown (`.md`) files, `{blogdown}` websites rely on the fact that Hugo also processes HTML files (given certain parameters). However, as outlined in the [`{blogdown}` documentation](https://bookdown.org/yihui/blogdown/other-themes.html), Hugo themes are not always compatible and "it can be time-consuming" to adapt them.

This is the case for `govukhugo`. Trying to solve this problem, from investigating the inner workings of `{blogdown}` one learns that its `html_page()` format is a wrapper around the `bookdown::html_document2()` format, which itself is a wrapper around `rmarkdown::html_document()`.

Rather than invest time in making the `govukhugo` theme work with `{blogdown}` the `{govukhugo}` package goes back to first principles to create HTML that Hugo will process.

For end users the `build_hugo()` and `build_hugo_rmd()` functions are all that are required.


### Under the hood: the "Hugo-ification" process
The site building functions call `render_rmd()` which processes an Rmd file and converts it to an HTML file that Hugo will process. The Rmd is minimally rendered into HTML by `rmarkdown::html_document()`: without a theme, without MathJax, data frames are printed via `knitr::kable()` and as a self-contained document. A self-contained document is chosen so that static plots are stored as base64 content within the file rather than having to deal with separate images.

Having rendered the HTML file, it is then passed to a back-end function (`hugo_html()`), which "Hugo-ifies" the HTML. It replaces the HTML entities `&lt;` and `&gt;` with `<` and `>` so that code fragments will be processed by Hugo properly. It replaces the HTML tags for code blocks `<pre><code>` with Hugo's shortcode for code block syntax highlighting. Finally, it extracts the HTML content between the `<body>` tags, excluding the lines where the title and date have been written by `html_document()`.

The Hugo-ified HTML is then returned to `render_rmd()` which finishes the process by prepending the YAML front-matter of the Rmd file to the HTML. A `rmarkdown: true` parameter is also added to the YAML. Finally, the YAML is scanned for the `section` parameter, if present this is used to determine the sub-folder of the site's `content` directory that the HTML will be placed in.

## Supporting htmlwidgets
R Markdown documents that do not include interactive content, e.g. that print a data frame or include a plot image, will now be converted when Hugo builds the site. However, a common reason for writing R Markdown documents is to include interactive components. When rendering an R Markdown document that include an [`{htmlwidgets}`](http://www.htmlwidgets.org/) component the rendering process will insert the relevant dependencies into the `<head>` component of the resulting HTML document.

As just described, the "Hugo-ified" HTML process of `{govukhugo}` removes the head component, thus removing these dependencies. This is rectified by the setting of the `rmarkdown: true` parameter in the YAML front matter of the HTML page. When Hugo processes the HTML it reads this parameter in adds back in the dependencies to the head component of the relevant page. At present it adds in the dependencies for the [`{DT}`](https://rstudio.github.io/DT/), [`{plotly}`](https://plot.ly/r/) and  [`{leaflet}`](https://rstudio.github.io/leaflet/).

The [`{crosstalk}`](https://rstudio.github.io/crosstalk/) package's filtering controls that allow dynamic filtering of the data used by these three widgets are also supported. However, users should wrap any calls to these controls in the package's `unstrap()` function which removes the dependencies associated with the Bootstrap framework, if you do not remove these the page may render incorrectly. Note that these controls make use of the selectize.js library and may not work properly for users of assistive technologies.

### govuk_datatable()
The `{DT}` package provides an opinionated implementation of the [DataTables jQuery plugin](https://datatables.net/), which does not easily conform to the GOV.UK Design System. As a result `{govukhugo}` includes a `govuk_datatable()` function that acts as a wrapper around `DT::datatable()`. Note that `govuk_datatable()` only provides access to some aspects of the `datatable()` arguments, and does not support passing of additional arguments via a `...` argument, this is to minimise the potential for disrupting the application of GOV.UK style.

```r
govuk_datatable <- function(data,
                            element_id = NULL,
                            col_names = NULL,
                            page_length = 10,
                            search = TRUE,
                            small_text = FALSE,
                            buttons = TRUE,
                            col_defs = NULL)
```

`govuk_datatable()` requires only a `data` argument, this should be either a data frame or a matrix, it provides the following optional arguments:

- `element_id`: an id for the HTML chunk
- `col_names`: a vector of column names, if not supplied the column names of the data object will be used
- `page_length`: the number of rows to show in the table, note that end-users cannot change this setting
- `search`: whether to include the table search functionality
- `small_text`: whether the table should render with a smaller font-size (only recommended for very large tables)
- `buttons`: whether to include a copy and csv download button with the table
- `col_defs`: a list of column definitions (see the [`{DT}`](https://rstudio.github.io/DT/options.html) and [DataTables](https://datatables.net/reference/option/columnDefs) documentation for more details)

`govuk_datatable()` returns a `DT::datatable` object, meaning that `{DT}` formatting [functions](https://rstudio.github.io/DT/functions.html), such as `DT::formatPercentage()`, should work on the returned object. Styling functions should be used with caution.

An example of `govuk_datatable()` can be seen on the interactive R Markdown [test page]({{< relref "tests/interactive_rmd.html" >}})