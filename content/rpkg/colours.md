---
title: "Use GOV.UK colours"
date: 2021-02-18
summary: "Functions for building govukhugo sites from Rmarkdown"
---

Methods to access and use the GOV.UK design system [colour palette](https://design-system.service.gov.uk/styles/colour/) from within the `{govukhugo}` package. The GOV.UK design system includes a colour palette, these can be accessed via the `govuk_colours` vector, it includes both Sass variable colour names (e.g. govuk-text-colour) as well as the named colour palette. The GOV.UK colour scheme was not designed with data visualisation in mind. The `govuk_palette()` function provides an opinionated selection of GOV.UK colours for use in charts (e.g. via `ggplot2::scale_fill_manual()`).

You should always think carefully about the colours you use in data visualisation and ensure your visualisation does not rely solely on colour to convey meaning. Depending on the nature of your visualisation it may be appropriate to use other colour scales, such as the [Color Brewer scales](https://colorbrewer2.org) by Cynthia Brewer (available in R through the [`{RColorBrewer}`](https://cran.r-project.org/package=RColorBrewer) package).

```r
govuk_colours["blue"]

govuk_palette("categorical")
```

## Arguments
{{< summarylist noborder >}}
{{< summaryitem "pal" >}}One of `categorical` (the default), `blue`, `blrd`, `bldrd_dark`, `blyl`, `putq`, or a colour name from `govuk_colours`{{< /summaryitem >}}
{{< /summarylist >}}

## govuk_colours

The `govuk_colours` vector provides all of the colours listed in the Design System [colour palettes documentation](https://design-system.service.gov.uk/styles/colour/) colour palette, this includes both the palette colours and the Sass named variables (e.g. `govuk-text-colour`).

### Palette colours

* `red` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-red); display: inline-block; vertical-align: middle;">&nbsp;</span> (#d4351c)
* `yellow` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-yellow); display: inline-block; vertical-align: middle;">&nbsp;</span> (#ffdd00)
* `green` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-green); display: inline-block; vertical-align: middle;">&nbsp;</span> (#00703c)
* `blue` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-blue); display: inline-block; vertical-align: middle;">&nbsp;</span> (#1d70b8)
* `dark-blue` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-dark-blue); display: inline-block; vertical-align: middle;">&nbsp;</span> (#003078)
* `light-blue` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-light-blue); display: inline-block; vertical-align: middle;">&nbsp;</span> (#5694ca)
* `purple` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-purple); display: inline-block; vertical-align: middle;">&nbsp;</span> (#4c2c92)
* `black` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-black); display: inline-block; vertical-align: middle;">&nbsp;</span> (#0b0c0c)
* `dark-grey` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-dark-grey); display: inline-block; vertical-align: middle;">&nbsp;</span> (#505a5f)
* `mid-grey` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-mid-grey); display: inline-block; vertical-align: middle;">&nbsp;</span> (#b1b4b6)
* `light-grey` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-light-grey); display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-colour-mid-grey)">&nbsp;</span> (#f3f2f1)
* `white` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-white); display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-colour-mid-grey)">&nbsp;</span> (#ffffff)
* `light-purple` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-light-purple); display: inline-block; vertical-align: middle;">&nbsp;</span> (#6f72af)
* `bright-purple` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-bright-purple); display: inline-block; vertical-align: middle;">&nbsp;</span> (#912b88)
* `pink` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-pink); display: inline-block; vertical-align: middle;">&nbsp;</span> (#d53880)
* `light-pink` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-light-pink); display: inline-block; vertical-align: middle;">&nbsp;</span> (#f499be)
* `orange` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-orange); display: inline-block; vertical-align: middle;">&nbsp;</span> (#f47738)
* `brown` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-brown); display: inline-block; vertical-align: middle;">&nbsp;</span> (#b58840)
* `light-green` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-light-green); display: inline-block; vertical-align: middle;">&nbsp;</span> (#85994b)
* `turquoise` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-turquoise); display: inline-block; vertical-align: middle;">&nbsp;</span> (#28a197)
* `chart-white` <span style="width: 1.5em; height: 1.5em; background-color: #f9f8f8; display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-colour-mid-grey)">&nbsp;</span> (#f9f8f8)

The `chart-white` colour is not a GOV.UK official palette colour but included in the palette to enable effective visualisation in charts, see `govuk_palette()` documentation below.

### Sass variables

* `govuk-text-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-text-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#0b0c0c)
* `govuk-secondary-text-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-secondary-text-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#505a5f)
* `govuk-link-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-link-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#1d70b8)
* `govuk-link-hover-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-link-hover-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#003078)
* `govuk-link-visited-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-link-visited-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#4c2c92)
* `govuk-link-active-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-link-active-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#0b0c0c)
* `govuk-border-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-border-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#b1b4b6)
* `govuk-input-border-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-input-border-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#0b0c0c)
* `govuk-focus-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-focus-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#ffdd00)
* `govuk-focus-text-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-focus-text-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#0b0c0c)
* `govuk-error-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-error-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#d4351c)
* `govuk-success-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-success-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#00703c)
* `govuk-brand-colour` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-brand-colour); display: inline-block; vertical-align: middle;">&nbsp;</span> (#1d70b8)

## govuk_palette
The `govuk_palette()` function provides an opinionated selection of GOV.UK colours for use in charts (e.g. via `ggplot2::scale_fill_manual()`). It has a single argument, `pal`, which must be one of `categorical`, `blues`, `blrd`, `blrd_dark`, `blyl`, `putq` or one of the names from the `govuk_colours` vector.

### Categorical palette
The `categorical` palette provides a set of colours for displaying discrete categories where a distinction between the categories is valuable. It provides 6 colours:

* `blue` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-blue); display: inline-block; vertical-align: middle;">&nbsp;</span> (#1d70b8)
* `orange` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-orange); display: inline-block; vertical-align: middle;">&nbsp;</span> (#f47738)
* `turquoise` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-turquoise); display: inline-block; vertical-align: middle;">&nbsp;</span> (#28a197)
* `bright-purple` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-bright-purple); display: inline-block; vertical-align: middle;">&nbsp;</span> (#912b88)
* `yellow` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-yellow); display: inline-block; vertical-align: middle;">&nbsp;</span> (#ffdd00)
* `dark-blue` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-dark-blue); display: inline-block; vertical-align: middle;">&nbsp;</span> (#003078)

### Sequential palettes
The `blues` palette provides the three GOV.UK blues in sequential order from dark to light:

* `dark-blue` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-dark-blue); display: inline-block; vertical-align: middle;">&nbsp;</span> (#003078)
* `blue` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-blue); display: inline-block; vertical-align: middle;">&nbsp;</span> (#1d70b8)
* `light-blue` <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-light-blue); display: inline-block; vertical-align: middle;">&nbsp;</span> (#5694ca)

If you wish to use another GOV.UK for a sequential palette, supplying a name from `govuk_colours` as the `pal` argument will return two colours for use as end-points in a sequential palette, the original colour and a version of the colour that is roughly a third lighter. For example:

* `govuk_palette("yellow")` returns <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-yellow); display: inline-block; vertical-align: middle;">&nbsp;</span> (#ffdd00) and <span style="width: 1.5em; height: 1.5em; background-color: #ffeeb7; display: inline-block; vertical-align: middle;">&nbsp;</span> (#ffeeb7)
* `govuk_palette("green")` returns <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-green); display: inline-block; vertical-align: middle;">&nbsp;</span> (#00703c) and <span style="width: 1.5em; height: 1.5em; background-color: #aecab5; display: inline-block; vertical-align: middle;">&nbsp;</span> (#aecab5)

### Divergent palettes
There are four palettes for use in divergent colour scales, using `chart-white` as their mid-point:

* `blrd` which uses GOV.UK blue and red as its end-points: <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-blue); display: inline-block; vertical-align: middle;">&nbsp;</span>&nbsp;<span style="width: 1.5em; height: 1.5em; background-color: #f9f8f8; display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-colour-mid-grey)">&nbsp;</span>&nbsp;<span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-red); display: inline-block; vertical-align: middle;">&nbsp;</span>
* `blrd_dark` which uses GOV.UK dark blue as its blue end-point and a darker red of the same hue as GOV.UK red as its red end-point: <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-dark-blue); display: inline-block; vertical-align: middle;">&nbsp;</span>&nbsp;<span style="width: 1.5em; height: 1.5em; background-color: #f9f8f8; display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-colour-mid-grey)">&nbsp;</span>&nbsp;<span style="width: 1.5em; height: 1.5em; background-color: #a12815; display: inline-block; vertical-align: middle;">&nbsp;</span>
* `blyl` which uses GOV.UK blue and yellow as its end-points: <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-blue); display: inline-block; vertical-align: middle;">&nbsp;</span>&nbsp;<span style="width: 1.5em; height: 1.5em; background-color: #f9f8f8; display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-colour-mid-grey)">&nbsp;</span>&nbsp;<span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-yellow); display: inline-block; vertical-align: middle;">&nbsp;</span>
* `putq` which uses GOV.UK purple and turquoise as its end-points: <span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-purple); display: inline-block; vertical-align: middle;">&nbsp;</span>&nbsp;<span style="width: 1.5em; height: 1.5em; background-color: #f9f8f8; display: inline-block; vertical-align: middle; border: 1px solid var(--govuk-colour-mid-grey)">&nbsp;</span>&nbsp;<span style="width: 1.5em; height: 1.5em; background-color: var(--govuk-colour-turquoise); display: inline-block; vertical-align: middle;">&nbsp;</span>

