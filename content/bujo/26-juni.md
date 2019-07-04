---
categories:
- design
date: "2019-06-26T15:01:23+02:00"
revision: 0
series:
- myLearning
tags:
- http
title: 26 Juni
weight: 5
---

Hugo + PWA + Netlify = Awesomeness[^1]

## Definitions

HTTP2
: multiplex http requests

etags
: validation token for content. Provided by server/CDN

cache-control
: how long should the content live

SPA
: single page application

##  Some explaineation

developer experience

A single page app that uses <mark>isomorphic rendering</mark> to build views on the server at runtime.

pesudo class
: `a:hover`

pseudo element
: `p::before {} p::after {}`

* should have a `content` property else wont work.
* Add some cool things without needing any extra markup
  * Adding quotation marks
  * Create add icons
  * add tool-tip
  * custome counters
  * add external link icons after a tags which atart with http
    ```
    a[href^="http"]::after { content: \f35d; font-family: 'Font Awesome 5 free'}
    ```

## A codepen

{{% codePen gNGmJm %}}

JAM stack
javascript, APIs, Markup
* Entire project lives on CDN
* Everythign lives in Git
* Instant Cache Invalidation on rollbacks or updates
  > Can this be cached, and if so by whom?  (HTTP header: cache-control — private vs public)
How long can it be cached for? (HTTP header: cache-control — max-age)
How can I tell if it’s been changed?  (HTTP header: etag in combination with above)


Assume that 120 seconds have passed since the initial fetch
the browser could dispatch a new request and fetch the new full response. However, that’s inefficient because if the resource hasn't changed, then there's no reason to download the same information that's already in cache!

Twitter cards[^4]

Email Subscription Service [buttondown](https://buttondown.email/)






[bibliography]
### Footnotes

[^1]: https://www.netlify.com/blog/2017/02/23/better-living-through-caching/
[^2]: https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/http-caching
[^3]: https://gohugohq.com/howto/go-offline-with-service-worker/
[^4]: https://gohugohq.com/partials/twitter-cards-partials-for-hugo/
