---
title: "Shortcodes"
date: 2021-01-01
type: post
weight: 100
summary: "Custom shortcodes"
---

In addition to the default [Hugo shortcodes](https://gohugo.io/content-management/shortcodes/), `govuk-hugo` includes the following custom shortcodes, most of which are intended to make it easier to add GOV.UK Design System [components](https://design-system.service.gov.uk/components/).

## In-page table of contents
An in-page table of contents, suitable for long-form articles can be included by using the shortcode `{{</* TOC */>}}` within your document. Preferably, you should include this after the first section of text but before the first secondary heading.

<aside id="page_toc" class="govuk-body toc govuk-body-s">
  <span class="toc-header">Table of contents</span>
  <nav id="TableOfContents">
  <ul class="toc-list">
    <li><a href="#" class="toc-link">Section</a></li>
    <li><a href="#" class="toc-link">Section</a>
      <ul class="toc-list">
        <li><a href="#" class="toc-link">Sub-section</a></li>
        <li><a href="#" class="toc-link">Sub-section</a></li>
      </ul>
    </li>
    <li><a href="#" class="toc-link">Section</a></li>
  </ul>
</nav>
</aside>

## Details
You can add the [details](https://design-system.service.gov.uk/components/details/) component using the `{{</* details */>}}` shortcode. In the opening shortcode you specify the summary text, while between that and a closing `{{</* /details */>}}` shortcode you include the content that you wish to be revealed when the user chooses to expand the details section.

```txt
{{</* details "More information" */>}}
The details component allows you to hide more detailed information 
that might be relevant to only some users.
{{</* /details */>}}
```

{{< details "More information" >}}
The details component allows you to hide more detailed information that might be relevant to only some users.
{{< /details >}}

## Warning text
You can add the [warning text](https://design-system.service.gov.uk/components/warning-text/) component using the `{{</* warning */>}}` shortcode.

```txt
{{</* warning "This is experimental and still under development" */>}}
```

{{< warning "This is experimental and still under development" >}}


## Notification banners
You can add the neutral [notification banner](https://design-system.service.gov.uk/components/notification-banner/) component using the `{{</* notification */}}` shortcode. In the opening shortcode specify the banner heading, while between that and a closing `{{</* /notification */>}}` banner you include the content of the notification message.

```txt
{{</* notification "Important" */>}}
Here is an important notice
{{</* /notification */>}}
```

{{< notification "Important" >}}
Here is an important notice
{{< /notification >}}

You can add the success notification banner using the `{{</* success */>}}` shortcode.

```txt
{{</* success "Success" */>}}
You have succeeded
{{</* /success */>}}
```

{{< success "Success" >}}
You have succeeded
{{< /success >}}

If you need to include further information then include you should provide the title and message as named arguments to the shortcode and include the further information within the opening and closing shortcodes. Note you will need to use raw HTML tags for inner content rather than markdown.

```txt
{{</* success title="Success" message="You have succeeded" */>}}
Please visit <a href="https://www.gov.uk">GOV.UK</a> for further details.
{{</* /success */>}}
```

{{< success title="Success" message="You have succeeded" >}}
Please visit <a href="https://www.gov.uk">GOV.UK</a> for further details.
{{< /success >}}
