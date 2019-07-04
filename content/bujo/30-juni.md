---
categories: []
date: "2019-06-30T11:27:05+02:00"
draft: true
revision: 0
series:
- DailyLogs
slug: ""
tags: []
title: 30 Juni
weight: 5
---

Minify and fingerprint assets
hugo can do it using pipes
assets like HTML,css,js are stored `/assets` directory
Assets will only be published (to /public) if .Permalink or .RelPermalink is used.

hugo can bundle and concatinate resources
```
{{ $plugins := resources.Get "js/plugins.js" }}
{{ $global := resources.Get "js/global.js" }}
{{ $js := slice $plugins $global | resources.Concat "js/bundle.js" }}
```

Use already available js for image gallery [fancyboxy][fancybox]

[fancybox]: http://fancybox.net/

<!-- more -->

```
{{ $style := resources.Get "sass/main.scss" | resources.ToCSS | resources.Minify | resources.Fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">

or

{{ $style := resources.Get "sass/main.scss" | toCSS | minify | fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">
```

### Full text search

a tool for quickly indexing our content;
[hugo-lunr][hugo-lunr]
[hugo-elasticsearch][hugo-elasticsearch]
[elasticlunr-js][elasticlunr-js]
[fuse][fuse]

[hugo-lunr]: https://www.npmjs.com/package/hugo-lunr
[hugo-elasticsearch]: https://www.npmjs.com/package/hugo-elasticsearch
[elasticlunr-js]: http://elasticlunr.com/
[fuse]: https://fusejs.io/

a full-text search API, preferably one that is free;
some JavaScript code to call the API and show the results.

[Algolia][Algolia] | 50K operations 10K records

[Algolia]: https://www.algolia.com/pricing/
[paraio]: https://paraio.com/#pricing

[bibliography]
### Footnotes

[^1]: 
[^2]: 
