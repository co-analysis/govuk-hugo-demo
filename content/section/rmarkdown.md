---
title: "Hugo-ify R Markdown documents"
date: 2021-01-28
---

[Hugo](https://gohugo.io) is a static site builder that is fast and lightweight, it is the preferred engine for building [`{blogdown}`](https://cran.r-project.org/package=blogdown) sites.

[`govuk-hugo`](https://github.com/co-analysis/govuk-hugo) is a theme for Hugo that applies the [GOV.UK Design System](https://design-system.service.gov.uk/). The theme is designed with dashboard-/book-style output common for publishing data products, and has been strongly influenced by the application of the Design System's principle and components in Public Health England's [Coronavirus dashboard](https://coronavirus.data.gov.uk/).

`{govukhugo}` is an R package that enables the use of R Markdown documents in Hugo static sites using the `govuk-hugo` theme, it provides an easy way for R users to initialise a Hugo site using the `govuk-hugo` theme. The `govuk-hugo` theme is not compatible with `{blogdown}`, therefore the package also provides a means to render and build Rmarkdown documents.

## Converting RMarkdown documents

While Hugo is intended for converting plain markdown (`.md`) files, `{blogdown}` websites rely on the fact that Hugo also processes HTML files (given certain parameters). However, as outlined in the [`{blogdown}` documentation](https://bookdown.org/yihui/blogdown/other-themes.html), Hugo themes are not always compatible.

> If you find a certain theme does not work well with blogdown, you may report to https://github.com/rstudio/blogdown/issues, and we will try to investigate the reason, but it can be time-consuming to learn and understand how a new theme works, so we recommend that you learn more about Hugo by yourself before asking, and we also encourage users to help each other there.

This is the case for `govuk-hugo`. Trying to solve this problem, from investigating the inner workings of `{blogdown}` one learns that its `html_page()` format is a wrapper around the `bookdown::html_document2()` format, which itself is a wrapper around `rmarkdown::html_document()`.

Rather than invest time in making the `govuk-hugo` theme work with `{blogdown}` the `{govukhugo}` package goes back to first principles to create HTML that Hugo will process.

For end users the `build_hugo()` and `build_hugo_rmd()` functions are all that are required.

## Under the hood: "Hugo-ification"
The site building functions call `render_rmd()` which processes an Rmd file and converts it to an HTML file that Hugo will process. The Rmd is minimally rendered into HTML by `rmarkdown::html_document()`: without a theme, without MathJax, data frames are printed via `knitr::kable()` and as a self-contained document. A self-contained document is chosen so that static plots are stored as base64 content within the file rather than having to deal with separate images.

Having rendered the HTML file, it is then passed to a back-end function (`hugo_html()`), which "Hugo-ifies" the HTML. At present this comprises three actions:

1. Replace the HTML entities `&lt;` and `&gt;` with `<` and `>` so that code fragments will be processed by Hugo properly.
2. Replace the HTML tags for code blocks `<pre><code>` with Hugo's shortcode for code block syntax highlighting.
3. Extracts the HTML content between the `<body>` tags, excluding the lines where the title and date have been written by `html_document()`.

The Hugo-ified HTML is then returned to `render_rmd()` which finishes the process by prepending the YAML front-matter of the Rmd file to the HTML. A `rmarkdown: true` parameter is also added to the YAML. Finally, the YAML is scanned for the `section` parameter, if present this is used to determine the sub-folder of the site's `content` directory that the HTML will be placed in.

## Supporting htmlwidgets
R Markdown documents that do not include interactive content, e.g. that print a data frame or include a plot image, will now be converted when Hugo builds the site. However, a common reason for writing R Markdown documents is to include interactive components. When rendering an R Markdown document that include an [`{htmlwidgets}`](http://www.htmlwidgets.org/) component the rendering process will insert the relevant dependencies into the `<head>` component of the resulting HTML document.

As just described, the "Hugo-ified" HTML process of `{govhugo}` removes the head component, thus removing these dependencies. This is rectified by the setting of the `rmarkdown: true` parameter in the YAML front matter of the HTML page. When Hugo processes the HTML it reads this parameter in adds back in the dependencies to the head component of the relevant page. At present it adds in the dependencies for the [`{DT}`](https://rstudio.github.io/DT/), [`{plotly}`](https://plot.ly/r/) and  [`{leaflet}`](https://rstudio.github.io/leaflet/).

