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

## About page

`govuk-hugo` provides in-built support for an about page that will appear at the bottom of the nav bar. To enable this create the file `about.md` in the content directory. The page title will be used for the text displayed in the nav bar.

## Support pages

`govuk-hugo` provides in-built support for the following types of 'support' pages.

- Help
- Accessbility
- Privacy notice
- Cookies
- Contact information
- Terms and conditions

You should create these as pages within the content directory and then specify the file in the params section of you config.yaml file:

```yml
params:
  govuk: false
  logotext: AAA
  product: Your site
  phase: alpha
  feedbackurl: https://your.site/feedback
  help: help.md
  accessibility: accessbility.md
  privacy: privacy.md
  cookies: cookies.md
  contact: contact.md
  terms: terms_conditions.md
```
