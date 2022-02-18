---
title: "Image tools"
date: 2021-02-18
summary: "Improving the accessibility of ggplot charts"
---

The `{govukhugo}` R package includes the `render_svg()` function to provide improved accessibility of ggplot charts. A fuller description of this function is provided in the [main documentation]({{< ref "/docs/render_svg.html" >}}). This function expects that the [`{svglite}`](https://svglite.r-lib.org/) package is also installed.

```r
render_svg <- function(
  plot,
  width,
  height,
  units = "px",
  alt_title = NULL,
  alt_desc = NULL,
  caption = NULL,
  dpi = 96
)
```

## Arguments
<dl class="govuk-summary-list govuk-summary-list--no-border">
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      plot
    </dt>
    <dd class="govuk-summary-list__value">
      A [`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) object.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      width
    </dt>
    <dd class="govuk-summary-list__value">
      The desired width of the object.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      height
    </dt>
    <dd class="govuk-summary-list__value">
      The desired height of the object.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      units
    </dt>
    <dd class="govuk-summary-list__value">
      The units of width and height, the default is pixels (`"px"`).
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      alt_title
    </dt>
    <dd class="govuk-summary-list__value">
      Short alt text (will show as a tool-tip)
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      alt_desc
    </dt>
    <dd class="govuk-summary-list__value">
      Longer alt text (for assistive technology)
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      caption
    </dt>
    <dd class="govuk-summary-list__value">
      A caption to display to all users, can also be set to `"alt_title"` or `"alt_desc"` to reuse those values.
    </dd>
  </div>
  <div class="govuk-summary-list__row">
    <dt class="govuk-summary-list__key">
      dpi
    </dt>
    <dd class="govuk-summary-list__value">
      Dots per inch, default for 96 for screen resolution, switch to 300 if using physical units (e.g. mm, cm or inches).
    </dd>
  </div>
</dl>

## render_svg()
The `render_svg()` function uses svglite to render the ggplot object, it will then insert into the plot the supplied alt text and if specified will also provide a caption for the figure.