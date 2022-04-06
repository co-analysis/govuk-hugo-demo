---
title: "Features"
date: 2021-01-01
type: post
weight: 100
summary: "Features of govukhugo"
---

The `govukhugo` theme provides a version of the GOV.UK Design System for Hugo, presently it is only designed for dashboard and book-style content, which is inspired by the UK Health Security Agency (formerly Public Health England) [Coronavirus dashboard](https://coronavirus.data.gov.uk/). The majority of this is done via Hugo templates to construct the site scaffold.

## GOV.UK Design System
Some of the [Design System styles and components](https://design-system.service.gov.uk/components/) are natively supported by `govukhugo`. Headings and links are converted using Hugo render hooks. For general text, lists, blockquotes, and tables a lightweight JavaScript function enables this support, making `govukhugo` unsuitable for environments that do not support JavaScript. The following elements are processed by the `govukhugo` JavaScript: paragraphs, lists, blockquotes, strong/bold emphasis, and tables. JavaScript is also required for the tabs and accordions Deisng System components, as well supporting mobile navigation.

A number of Hugo [shortcodes]({{< ref "/docs/shortcodes.md" >}}) exist to provide access to further aspects of the Design System, including: lead/small paragraph styling, section breaks, details, warning text, rendering links as GOV.UK style buttons, notification banners, and tags. Shortcodes are also available to insert a in-page table of contents and a file download link.

The default `config.yaml` sets `unsafe: true`  in the markdown configuration, this allows you to include raw HTML in your markdown documents (by default Hugo ignores raw HTML in markdown documents), which allows you to include other components as desired.

The GOV.UK [colour palette](https://design-system.service.gov.uk/styles/colour/) is available via CSS variables, for example `background-color: var(--govuk-colour-bright-purple)` gives you the "bright-purple" <span style="width: 0.7em; height: 0.7em; background-color: var(--govuk-colour-bright-purple); display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-border-colour);">&nbsp;</span> from the palette.

## Code blocks and syntax highlighting
The GOV.UK Design System does not include a component or styles for code blocks/highlighting. While the Design System documentation does include code blocks itself, as `govukhugo` is intended for use by analysts it may feature a larger amount of code visible to users than the Design System, therefore the styling of code blocks in `govukhugo` has been designed separately.

Both in-line code and code blocks use [Fira Code](https://github.com/tonsky/FiraCode), a version of Fira Mono that has been specifically designed for use with code. Notably it provides a lighter weight and greater x-height than Courier (the default monospace font), as well as ligatures to enhance readability.

`govukhugo` makes use of Hugo's native support for [syntax highlighting](https://gohugo.io/content-management/syntax-highlighting/) of code blocks via [Chroma](https://github.com/alecthomas/chroma). Code blocks are rendered with line numbers to make it easier to reference and follow code. It uses a limited colour palette, comments are styled in grey italics, names/functions are coloured in blue, literal values (strings, numbers) are coloured in purple, while keywords/reserved terms are displayed in bold.


## R Markdown
R Markdown documents are supported via the `{govukhugo}` R package, this provides complete support for fully static RMarkdown output. Interactive R Markdown documents that use the following `{htmlwidgets}` are supported:

* [`{DT}`](https://rstudio.github.io/DT/) for interactive tables
* [`{plotly}`](https://plot.ly/r/) for interactive charts
* [`{leaflet}`](https://rstudio.github.io/leaflet/). for interactive maps

You can read more about the package on the [R Markdown page]({{< relref rmarkdown.md >}}).
