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
<dl class="govuk-summary-list govuk-summary-list--no-border">
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      data
    </dt>
    <dd class="govuk-summary-list__value">
      A data frame, matrix or crosstalk SharedData object.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      title
    </dt>
    <dd class="govuk-summary-list__value">
      A title to provide as a table caption.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      element_id
    </dt>
    <dd class="govuk-summary-list__value">
      A unique reference id for the table.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      col_names
    </dt>
    <dd class="govuk-summary-list__value">
      Replacement column names.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      page_length
    </dt>
    <dd class="govuk-summary-list__value">
      The default number of rows to show per page of the table.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      search
    </dt>
    <dd class="govuk-summary-list__value">
      Whether to include a search box.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      small_text
    </dt>
    <dd class="govuk-summary-list__value">
      Whether to render the table with smaller font sizes.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      buttons
    </dt>
    <dd class="govuk-summary-list__value">
      Whether to include buttons for copying and downloading the table.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      col_defs
    </dt>
    <dd class="govuk-summary-list__value">
      A list of column definitions.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      copy_info
    </dt>
    <dd class="govuk-summary-list__value">
      Optional information to include when the table is copied.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      export_file
    </dt>
    <dd class="govuk-summary-list__value">
      The name of the file downloaded to the user's device.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      options
    </dt>
    <dd class="govuk-summary-list__value">
      A list of DT options.
    </dd>
  </div>
</dl>

## govuk_datatable()
The `{DT}` package provides an opinionated implementation of the DataTables jQuery plugin, which does not naturally conform to the GOV.UK Design System. As a result `{govukhugo}` includes `govuk_datatable()` to wrap around DT::datatable(). Note that `govuk_datatable()` only provides access to some aspects of the `datatable()` arguments, and does not support passing of additional arguments via dots (`...`), this is to minimise the potential for disrupting the application of GOV.UK style.

While the `govuk_datatable()` object can be piped to `{DT}` helper functions, it is advised that only the `format*()` are used in conjunction with `govuk_datatable()`. The `col_defs` and `options` arguments allow for significant programmatic control of the output table (the format functions being shortcuts for modifying column definitions), please refer to the [`{DT}`](https://rstudio.github.io/DT/) and [DataTables](https://datatables.net/) reference materials for full details on how to use these arguments.