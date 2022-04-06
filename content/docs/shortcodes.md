---
title: "Shortcodes"
date: 2021-01-01
type: post
weight: 200
summary: "Custom shortcodes"
---

In addition to the default [Hugo shortcodes](https://gohugo.io/content-management/shortcodes/), `govuk-hugo` includes the following custom shortcodes, most of which are intended to make it easier to add GOV.UK Design System [components](https://design-system.service.gov.uk/components/).

{{< TOC >}}

{{< break type="xl" >}}

## In-page table of contents
An in-page table of contents, suitable for long-form articles can be included by using the shortcode `{{</* TOC */>}}` within your document. Preferably, you should include this after the first section of text but before the first secondary heading.

<aside id="page_toc" class="govuk-body toc govuk-body-s">
  <span class="toc-header govuk-caption-l">Contents</span>
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

{{< break type="xl" >}}

## Paragraph styling

You can use the lead and small [paragraph typography](https://design-system.service.gov.uk/styles/typography/#paragraphs) through the `{{</* lead */>}}` and `{{</* small */>}}` shortcodes. These shortcodes do not take arguments, simply use an opening and then closing shortcode to apply the styling.

```txt
{{</* lead */>}}A lead paragraph{{</* /lead */>}}
```

{{< lead >}}A lead paragraph{{< /lead >}}

```txt
{{</* small */>}}A lead paragraph{{</* /small */>}}
```

{{< small >}}A small paragraph{{< /small >}}

{{< break type="xl" >}}

## Section breaks

By default `govukhugo` renders section breaks into invisible breaks using the GOV.UK design system's large section break. The `break` shortcode allows you to set custom sizes (`xl`, `l` or `m`), you can make a break visible by setting that argument to `true`.

```txt
A section followed by an invisible `xl` break.
{{</* break type="xl" */>}}
A section followed by a visible `xl` break.
{{</* break type="xl" visible=true */>}}
A section followed by a visible `l` break.
{{</* break type="l" visible=true */>}}
A section followed by a visible `m` break.
{{</* break type="m" visible=true */>}}
```

A section followed by an invisible `xl` break.

{{< break type="xl" >}}

A section followed a visible `xl` break.

{{< break type="xl" visible=true >}}

A section followed a visible `l` break.

{{< break type="l" visible=true >}}

A section followed a visible `m` break.

{{< break type="m" visible=true >}}

{{< break type="xl" >}}

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

{{< break type="xl" >}}

## Warning text
You can add the [warning text](https://design-system.service.gov.uk/components/warning-text/) component using the `{{</* warning */>}}` shortcode.

```txt
{{</* warning "This is experimental and still under development" */>}}
```

{{< warning "This is experimental and still under development" >}}

{{< break type="xl" >}}

## Links as buttons

You can add the [button](https://design-system.service.gov.uk/components/button/) component to style links as buttons using the `{{</* link_button */>}}` shortcode. You must name the arguments `link` (the link to visit) and `text` (the text for the button). These links will always open in a new tab/window.

```txt
{{</* link_button link="https://www.gov.uk" text="Go to GOV.UK" */>}}
```

<p>
{{< link_button link="https://www.gov.uk" text="Go to GOV.UK" >}}
</p>

Optionally you can add a `type` argument to set the button as one of the alternative styles (a secondary button or a warning button).

```txt
{{</* link_button link="https://www.gov.uk" text="Go to GOV.UK" type="secondary" */>}}
{{</* link_button link="https://www.gov.uk" text="Go to GOV.UK" type="warning" */>}}
```

<p>
{{< link_button link="https://www.gov.uk" text="Go to GOV.UK" type="secondary">}}
{{< link_button link="https://www.gov.uk" text="Go to GOV.UK" type="warning">}}
</p>

{{< break type="xl" >}}

## File download links

You can add a [file download](https://govspeak-preview.herokuapp.com/guide#download-links) component to style links as downloads using the `{{</* download_file */>}}` shortcode. As with button links must name the arguments `link` (the link to visit) and `text` (the text for the button), you must also specify the file `type` (e.g. "PDF", "ODS", "CSV") and the file `size` (e.g. "42KB", "1.4MB").

```txt
{{</* download_file link="my_file.ods" text="Download the spreadsheet" 
     type="ODS" size="1.4MB" */>}}
```

{{< download_file link="" text="Download the spreadsheet" type="ODS" size="1.4MB" >}}

{{< break type="xl" >}}

## Notification banners
You can add the neutral [notification banner](https://design-system.service.gov.uk/components/notification-banner/) component using the `{{</* notification */>}}` shortcode. In the opening shortcode specify the banner heading, while between that and a closing `{{</* /notification */>}}` banner you include the content of the notification message.

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

If you need to include further information then include you should provide the `title` and `message` as named arguments to the shortcode and include the further information within the opening and closing shortcodes. Note you will need to use raw HTML tags for inner content rather than markdown.

```txt
{{</* success title="Success" message="You have succeeded" */>}}
Please visit <a href="https://www.gov.uk">GOV.UK</a> for further details.
{{</* /success */>}}
```

{{< success title="Success" message="You have succeeded" >}}
Please visit <a href="https://www.gov.uk">GOV.UK</a> for further details.
{{< /success >}}

{{< break type="xl" >}}

## Tag

You can add the [tag](https://design-system.service.gov.uk/components/tag/) component using the `{{</* tag */>}}` shortcode.

```txt
{{</* tag "Tag" */>}}
```

<p>
{{< tag "Tag" >}}
</p>


Optionally you can define a colour (one of `grey`, `green`, `turquoise`, `blue`, `purple`, `pink`, `red`, `orange` or `yellow`), in this case you will need to provide the tag label as the argument `title`. When using alongside the standard tag, the convention is to use grey.

<table class="govuk-table">
  <thead class="govuk-table__head">
    <tr class="govuk-table__row">
      <th class="govuk-table__header" scope="col" width="50%"> Shortcode </th>
      <th class="govuk-table__header" scope="col" width="50%"> Tag </th>
    </tr>
  </thead>
  <tbody class="govuk-table__body">
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag "Tag" */>}}</code>
      </td>
      <td class="govuk-table__cell">
        {{< tag "Tag" >}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Grey tag" colour="grey" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Grey tag" colour="grey">}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Green tag" colour="green" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Green tag" colour="green">}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Turquoise tag" colour="turquoise" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Turquoise tag" colour="turquoise">}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Blue tag" colour="blue" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Blue tag" colour="blue">}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Purple tag" colour="purple" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Purple tag" colour="purple">}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Pink tag" colour="pink" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Pink tag" colour="pink">}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Red tag" colour="red" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Red tag" colour="red">}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Orange tag" colour="orange" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Orange tag" colour="orange">}}
      </td>
    </tr>
    <tr class="govuk-table__row">
      <td class="govuk-table__cell">
        <code>{{</* tag title="Yellow tag" colour="yellow" */>}}</code>
      <td class="govuk-table__cell">
        {{< tag title="Yellow tag" colour="yellow">}}
      </td>
    </tr>
  </tbody>
</table>

{{< break type="xl" >}}

## Tabs

The [tabs](https://design-system.service.gov.uk/components/tabs/) component is supported using the `{{</* tabset */>}}` and `{{</* tab */>}}` shortcodes. Please note this is considered an experimental component, see the design system [article](https://design-system.service.gov.uk/components/tabs/) for more details.

```txt
{{</* tabset  */>}}
{{</* tab title="First Tab" >}}My first tab{{< /tab  */>}}
{{</* tab title="Tab 2" >}}My second tab{{< /tab  */>}}
{{</* tab title="Third" >}}My third tab{{< /tab  */>}}
{{</* /tabset */>}}
```

{{< tabset >}}
{{< tab title="First Tab" >}}My first tab{{< /tab >}}
{{< tab title="Tab 2" >}}My second tab{{< /tab >}}
{{< tab title="Third" >}}My third tab{{< /tab >}}
{{< /tabset>}}

{{< break type="xl" >}}

## Accordion
The [accordion](https://design-system.service.gov.uk/components/accordion/) component is supported using the `{{</* accordionset */>}}` and `{{</* accordion */>}}` shortcodes. Please note this is considered an experimental component, see the design system [article](https://design-system.service.gov.uk/components/accordion/) for more details.


```txt
{{</* accordionset */>}}
{{</* accordion title="First Accordion" >}}My first accordion{{< /accordion */>}}
{{</* accordion title="Accordion 2" >}}My second accordion{{< /accordion */>}}
{{</* accordion title="Third" summary="Only use a summary if essential" >}}My third accordion{{< /accordion */>}}
{{</* /accordionset */>}}
```

{{< accordionset >}}
{{< accordion title="First Accordion" >}}My first accordion{{< /accordion >}}
{{< accordion title="Accordion 2" >}}My second accordion{{< /accordion >}}
{{< accordion title="Third" summary="Only use a summary if essential" >}}My third accordion{{< /accordion >}}
{{< /accordionset >}}