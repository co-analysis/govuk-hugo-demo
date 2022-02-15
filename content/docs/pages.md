---
title: "Pages"
date: 2021-01-22
type: post
weight: 100
summary: "How to create pages using govukhugo"
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

The `title` parameter is used to provide the lead heading on a page, the page's label in site navigation and the title used by the user's web browser (e.g. to name a window/tab). You can provide a different lead heading by setting the `custom_title` parameter, the title will still be used for site navigation and by web browsers.

Optionally you can add a `weight` parameter to the YAML header to adjust the page's ordering within their section. The default page weight is 0, it is recommended however that pages have a default weight of 100. Pages with the same weight will be ordered alphabetically by `title`.

## About page

`govukhugo` provides in-built support for an about page that will appear at the bottom of the nav bar. To enable this create the file `about.md` in the content directory. The page title will be used for the text displayed in the nav bar.

## Support pages

`govukhugo` provides in-built support for the following types of 'support' pages.

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
