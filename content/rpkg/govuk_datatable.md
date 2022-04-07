---
title: "Interactive tables"
date: 2021-02-18
summary: "Enabling interactive tables in govukhugo"
---

The `{govukhugo}` R package includes the `govuk_datatable()` which provides a wrapper to the [`{DT}`](https://rstudio.github.io/DT/) package's `datatable()` function.

```r
govuk_datatable(
  data,
  title = NULL,
  element_id = NULL,
  col_names = NULL,
  page_length = 10,
  search = TRUE,
  small_text = FALSE,
  buttons = TRUE,
  col_defs = NULL,
  copy_info = NULL,
  export_file = NULL,
  options = NULL
)
```

## Arguments
{{< summarylist noborder >}}
{{< summaryitem "data" >}}A data frame, matrix or crosstalk SharedData object.{{< /summaryitem >}}
{{< summaryitem "title" >}}A title to provide as a table caption.{{< /summaryitem >}}
{{< summaryitem "element_id" >}}A unique reference id for the table.{{< /summaryitem >}}
{{< summaryitem "col_names" >}}Replacement column names.{{< /summaryitem >}}
{{< summaryitem "page_length" >}}The default number of rows to show per page of the table.{{< /summaryitem >}}
{{< summaryitem "search" >}}Whether to include a search box.{{< /summaryitem >}}
{{< summaryitem "small_text" >}}Whether to render the table with smaller font sizes.{{< /summaryitem >}}
{{< summaryitem "buttons" >}}Whether to include buttons for copying and downloading the table.{{< /summaryitem >}}
{{< summaryitem "col_defs" >}}A list of column definitions.{{< /summaryitem >}}
{{< summaryitem "copy_info" >}}Optional information to include when the table is copied.{{< /summaryitem >}}
{{< summaryitem "export_file" >}}The name of the file downloaded to the user's device.{{< /summaryitem >}}
{{< summaryitem "options" >}}A list of DT options.{{< /summaryitem >}}
{{< /summarylist >}}

## govuk_datatable()
The `{DT}` package provides an opinionated implementation of the DataTables jQuery plugin, which does not naturally conform to the GOV.UK Design System. As a result `{govukhugo}` includes `govuk_datatable()` to wrap around DT::datatable(). Note that `govuk_datatable()` only provides access to some aspects of the `datatable()` arguments, and does not support passing of additional arguments via dots (`...`), this is to minimise the potential for disrupting the application of GOV.UK style.

While the `govuk_datatable()` object can be piped to `{DT}` helper functions, it is advised that only the `format*()` are used in conjunction with `govuk_datatable()`. The `col_defs` and `options` arguments allow for significant programmatic control of the output table (the format functions being shortcuts for modifying column definitions), please refer to the [`{DT}`](https://rstudio.github.io/DT/) and [DataTables](https://datatables.net/) reference materials for full details on how to use these arguments.