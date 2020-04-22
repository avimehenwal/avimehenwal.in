---
title: Website Features
categories:
- design
date: "2019-07-06T21:08:11+02:00"
revision: 0
series:
- myLearning
tags:
- website
weight: 5
---

HTML Forms
: Pass data from client (browser) to server (API/backend)
* submission method can be `GET` or `POST`
* multipart/form-data


- [ ] Blog with markdown content for posts
- [ ] Search posts with Fuse.js and vue-fuse
- [ ] Theme Switcher with Dark Mode
- [ ] Tags for posts
- [ ] Basic pagination
- [ ] Syntax highlighting with Shiki (using this gridsome plugin)
- [ ] 404 Page
- [ ] RSS Feed
- [ ] Sitemap in XML
- [ ] Tailwind CSS v1.0 (with PurgeCSS)
- [ ] Scroll to sections using vue-scrollto
- [ ] Clean and minimal design
- [ ] Form: Disable SUBMIT button is form is not valid using a computed property
- [ ] Form: Image URL preview

<!-- more -->
## Features

* How to post forms from fronend to google shhet backend?
* How to read data from google sheet backend?

## Netlify | Forestry

* publish posts from any browser to your static sites
* NetlifyCMS accessable on `https://site_url/admin`

## Collaspable section in markdown

{{< code numbered="true" >}}
[[[<details>]]]
    [[[<summary>]]]
        Expand to view details
    </summary>
    * lorem
    * ipsum
    *text
</details>
{{< /code >}}

1. Begin a collapsable block element
2. Text inside this tag will be visible, rest everything would be hidden

{{% note %}}
  **or use shortcode expandable labels**
{{% /note %}}

## Backends

> Why seperate data from view? Code decoupling, seperation of concerns

* JSON APIs are pretty much standard
  * might be expensive to host
* Google Sheets as API
  * [How to post data from frontend?](https://trevorfox.com/2015/06/dynamically-pre-fill-google-forms-with-mailchimp-merge-tags/)
* Free cloud Hosted JSON, txt, csv files as backends


[bibliography]
### Footnotes

[^1]:
[^2]:
