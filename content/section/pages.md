---
title: "Pages"
date: 2021-01-22
type: post
weight: 100
summary: "How to create pages using govuk-hugo"
---

Pages are created by writing a markdown (.md) files with a YAML header.

```txt
---
title: "Pages"
date: 2021-01-22
type: post
weight: 100
---

Pages are created by writing a markdown (.md) files with a YAML header.

```

Optionally you can add a weight to the YAML header to adjust the page's ordering within their section. The default page weight is 0, it is recommended however that pages have a default weight of 100. Pages with the same weight will be ordered alphabetically by title.

If using the `listpages: true` parameter in a section `_index.md` file to generate a list of the pages within the section then it is recommended that you add a summary parameter to the YAML header: `summary: "This is post about pages"`.
