---
title: "Crosstalk filters"
date: 2021-02-18
summary: "Supporting interactive filtering controls"
---

The `{govukhugo}` R package includes two functions to support the use of [`{crosstalk}`](https://rstudio.github.io/crosstalk/). Use `clear_filters()` to insert a control that allows users to clear selections within crosstalk filters. The `unstrap()` function removes dependency calls that clash with the `govukhugo` framework. A fuller discussion of support for `{crosstalk}` is provided in the [examples]({{< ref "/tests/crosstalk_rmd.html" >}}).

```r
clear_filters(text = "Clear filters")

unstrap(x)
```

## clear_filters()
The `clear_filters()` function has a single argument which is the desired text for the control, the default being "Clear filters".

## unstrap()
The `unstrap()` function has a single argument which should be a `{crosstalk}` filter control, either `filter_select` or `filter_checkboxes`.