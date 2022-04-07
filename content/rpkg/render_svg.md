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
{{< summarylist noborder >}}
{{< summaryitem "plot" >}}A [`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) object.{{< /summaryitem >}}
{{< summaryitem "width" >}}The desired width of the object.{{< /summaryitem >}}
{{< summaryitem "height" >}}The desired height of the object.{{< /summaryitem >}}
{{< summaryitem "units" >}}The units of width and height, the default is pixels (`"px"`).{{< /summaryitem >}}
{{< summaryitem "alt_title" >}}Short alt text (will show as a tool-tip){{< /summaryitem >}}
{{< summaryitem "alt_desc" >}}Longer alt text (for assistive technology){{< /summaryitem >}}
{{< summaryitem "caption" >}}A caption to display to all users, can also be set to `"alt_title"` or `"alt_desc"` to reuse those values.{{< /summaryitem >}}
{{< summaryitem "dpi" >}}Dots per inch, default for 96 for screen resolution, switch to 300 if using physical units (e.g. mm, cm or inches).{{< /summaryitem >}}
{{< /summarylist >}}

## render_svg()
The `render_svg()` function uses svglite to render the ggplot object, it will then insert into the plot the supplied alt text and if specified will also provide a caption for the figure.