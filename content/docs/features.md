---
title: "Features"
date: 2021-01-01
type: post
weight: 100
summary: "Features of govuk-hugo"
---

The `govuk-hugo` theme provides a version of the GOV.UK Design System for Hugo, presently it is only designed for dashboard and book-style content, which is inspired by Public Health England's [Coronavirus dashboard](https://coronavirus.data.gov.uk/). The majority of this is done via Hugo templates to construct the site scaffold.

## GOV.UK Design System
The following [Design System components](https://design-system.service.gov.uk/components/) are natively supported by `govuk-hugo`:

* Headings
* Lists (all UL lists will be bullet lists)
* Blockquotes
* Tables

A lightweight JavaScript function enables this support, making `govuk-hugo` unsuitable for environments that do not support JavaScript.

The default `config.yaml` sets `unsafe: true`  in the markdown configuration, this allows you to include raw HTML in your markdown documents (by default Hugo ignores raw HTML in markdown documents), this allows you to include other components as desired. In due course it is intended to provide support for (some) Design System Components via Hugo shortcodes.

The GOV.UK [colour palette](https://design-system.service.gov.uk/styles/colour/) is available via CSS variables, for example `background-color: var(--govuk-colour-bright-purple)` gives you the "bright-purple" <span style="width: 0.7em; height: 0.7em; background-color: var(--govuk-colour-bright-purple); display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-border-colour);">&nbsp;</span> from the palette.

## Code blocks and syntax highlighting
The GOV.UK Design System does not include a component or styles for code blocks/highlighting. While the Design System documentation does include code blocks itself, as `govuk-hugo` is intended for use by analysts it is likely to feature a larger amount of code visible to uses that the design the styling of code blocks in `govuk-hugo` has been designed separately.

Both in-line code and code blocks use [Fira Code](https://github.com/tonsky/FiraCode), a version of Fira Mono that has been specifically designed for use with code. Notably it provides a lighter weight and greater x-height than Courier (the default monospace font), as well as ligatures to enhance readability.

`govuk-hugo` makes use of Hugo's native support for [syntax highlighting](https://gohugo.io/content-management/syntax-highlighting/) of code blocks via [Chroma](https://github.com/alecthomas/chroma). Code blocks are rendered with line numbers to make it easier to reference and follow code. It uses a limited colour palette, comments are styled in grey italics, names/functions are coloured in blue, literal values (strings, numbers) are coloured in purple, while keywords/reserved terms are displayed in bold.


## R Markdown
R Markdown documents are supported via the `{govukhugo}` R package, this provides complete support for fully static RMarkdown output. Interactive R Markdown documents that use the following `{htmlwidgets}` are supported:

* [`{DT}`](https://rstudio.github.io/DT/) for interactive tables
* [`{plotly}`](https://plot.ly/r/) for interactive charts
* [`{leaflet}`](https://rstudio.github.io/leaflet/). for interactive maps

You can read more about the package on the [R Markdown page]({{< relref rmarkdown.md >}}).
