---
categories:
- frontend
date: "2019-06-30T11:27:05+02:00"
revision: 1
series:
- DailyLogs
slug: ""
tags:
- hugo
- search
title: 30 Juni
weight: 5
---

* Minify and fingerprint assets
* hugo can do it using **hugo pipes**
* assets like HTML,css,js are stored `/assets` directory
  * Assets will only be published (to /public) if .Permalink or .RelPermalink is used.
* hugo can bundle and concatinate resources

```
{{ $plugins := resources.Get "js/plugins.js" }}
{{ $global := resources.Get "js/global.js" }}
{{ $js := slice $plugins $global | resources.Concat "js/bundle.js" }}
```

Use already available js for image gallery [fancyboxy][fancybox]

[fancybox]: http://fancybox.net/

<!-- more -->

#### HOw to compile css, minify and fingerprint assets with hugo? 

```
{{ $style := resources.Get "sass/main.scss" | resources.ToCSS | resources.Minify | resources.Fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">

or

{{ $style := resources.Get "sass/main.scss" | toCSS | minify | fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">
```

#### How to add Full text search functionality on static site?

a tool for quickly indexing our content;

* [hugo-lunr][hugo-lunr]
* [hugo-elasticsearch][hugo-elasticsearch]
* [elasticlunr-js][elasticlunr-js]
* [fuse][fuse]

[hugo-lunr]: https://www.npmjs.com/package/hugo-lunr
[hugo-elasticsearch]: https://www.npmjs.com/package/hugo-elasticsearch
[elasticlunr-js]: http://elasticlunr.com/
[fuse]: https://fusejs.io/

a full-text search API, preferably one that is free;
some JavaScript code to call the API and show the results.

* [Algolia][Algolia] | 50K operations 10K records
* [paraio](https://paraio.com/#pricing)

[Algolia]: https://www.algolia.com/pricing/