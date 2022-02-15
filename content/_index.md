---
title: "Build GOV.UK style static sites with Hugo"
date: 2021-01-22
type: post
listpages: false
---

This site demonstrates how the `govukhugo` theme works.

`govukhugo` is a theme for the [Hugo](https://gohugo.io/) static site builder that provides a version of the [GOV.UK Design System](https://design-system.service.gov.uk/) for Hugo. Presently it is only designed for dashboard style content, and heavily inspired by the UK government [Coronavirus dashboard](https://coronavirus.data.gov.uk/). While technology agnostic, it has also been developed with a view to supporting the development of data-based sites using [R and R Markdown]({{< ref "/docs/rmarkdown.html" >}}) and there is an associated [R package](https://github.com/co-analysis/govuk-hugo-r) to support this.

This site provides both [documentation]({{< ref "/docs/_index.md" >}}) and [examples]({{< ref "/tests/_index.md" >}}).

## Getting started

To use `govukhugo`, install Hugo as per the [getting started](https://gohugo.io/getting-started/) advice and then create a new site.

If creating from scratch (i.e. without an existing directory) the following code will create a Hugo site in the folder called `SITEDIR`:

```shell
$ hugo new site SITEDIR -f "yaml"
```

You can initialise an existing directory (e.g. if you've already created an empty git repo) as a Hugo site by navigating to the directory and then forcing a new site to be built:

```shell
$ cd SITEDIR
$ hugo new site . --force -f "yaml"
```

Note that YAML is preferred for the format of config files, all documentation for `govukhugo` will use YAML. TOML (Hugo's default) should work, but is not supported and has not been tested.

### Add the `govukhugo` theme

Add as a git clone/submodule, as the theme is under active development it is recommended that you use git to add the theme so that you can easily get updates.

If your hugo site is in its own git repo then add as a submodule:

```shell
$ git submodule add https://github.com/co-analysis/govukhugo.git themes/govukhugo
```

If you hugo site is not a git repo then clone the theme:

```shell
$ git clone https://github.com/co-analysis/govukhugo.git themes/govukhugo
```

You can also manually add the theme, this is not recommended as it will be less easy for you to track updates:

1. Download the govukhugo repo's [zip file](https://github.com/co-analysis/govukhugo/archive/main.zip)
1. Create a `govukhugo` folder inside the `themes` folder
1. Extract the zip file and copy the files and folders into the themes/govukhugo folder

### Configure

To apply the `govukhugo` theme, your `config.yaml` file should look like:

```yaml
baseURL: https://your.site/
languageCode: en-gb
title: Your site
theme: govukhugo
publishDir: docs
canonifyurls: true

pygmentsUseClasses: true

markup:
  goldmark:
    renderer:
      unsafe: true
  highlight:
    anchorLineNos: false
    codeFences: true
    guessSyntax: false
    hl_Lines: ""
    lineAnchors: ""
    lineNoStart: 1
    lineNos: true
    lineNumbersInTable: true
    noClasses: true
    style: github
    tabWidth: 2


params:
  govuk: false
  logo: none
  product: Your site
  phase: alpha
  feedbackurl: https://your.site/feedback
  builtby: Your Team
  builtbyurl: https://your.org/
```

If deploying to GitHub Pages you must set `publishDir: docs` and `canonifyurls: true`.

Set `unsafe: true` if you want to be able to use raw HTML in in markdown documents.

Unless you are deploying to a .gov.uk subdomain you should set `govuk: false` - this ensures you do not use GOV.UK's New Transport font, nor use the GOV.UK crown in the header and as the favicon, these are only permitted for use on .gov.uk subdomains. Setting `govuk: true` will activate the use of the New Transport font, it should also be coupled with the setting `logo: crown` to include the GOV.UK crown to the site header.

You can provide a product name using `product: Product Name` which will provide the product name in the header. If a product name is not provided the `title` specified at the top of the `config.yaml` file will be used.

To add a GOV.UK style "phase" banner set `phase: alpha` or `phase: beta` in the params. You must also provide a feedback URL using `feedbackurl: https://your.site/feedback`.

You can add a "built by" reference by setting `builtby: Your Team`. You must also provide a URL to your team or organisation's main website using `builtbyurl: https://your.org/`