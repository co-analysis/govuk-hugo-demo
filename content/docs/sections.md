---
title: "Sections"
date: 2021-01-22
type: post
weight: 100
summary: "How to structure content in govukhugo"
---

Hugo sites are structured into sections, each section is a separate directory under the `content` directory in the base Hugo directory.

While Hugo will auto-generate an index page for each section, it is strongly recommended that you write an `_index.md` page to provide content for the page itself. You should write these in the same way as you write regular [pages]({{< ref "/docs/pages.md" >}}).

```txt
---
title: "Sections"
date: 2021-01-22
weight: 100
---

Section index pages are also created by writing a markdown (.md) file with a YAML header.

```

You can add to a section index an auto-generated list of pages within the section, this is done by setting the parameter `listpages: true` in the YAML header information. If doing this you should include a `summary` parameter in the individual pages, for example `summary: "This is page about creating sections"`.

## Site navigation
The `govukhugo` scaffold generates a navigation menu in a left-hand sidebar. At the home page level the sidebar will show the site sections, and if present a link to the site's about page. Once inside a section the sidebar will show the pages within that section.

The ordering of sections in the site navigation is similar to that of pages, sections are ordered by the `weight` set in their `_index.md` page and then alphabetically by the `title`.

Note that responsive web design settings within the site's CSS collapses the navigation to a "breadcrumbs" style navigation on small screens, therefore it is recommended that the site and section index pages include links to their child content (either manually written or auto-generated).

The default settings of `govukhugo` assume that below the content directory there is a single layer of directories - further levels can exist but they will not be included in site navigation. Other structures will require writing a custom navigation Hugo template.
