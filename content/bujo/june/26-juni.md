---
title: 26 Juni
categories:
- design
date: "2019-06-26T15:01:23+02:00"
revision: 1
series:
- myLearning
tags:
- http
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

API - Application programming interface
: methods and functions (functionality) we can import in our code once we import the library

What can significantly improve developer experience?

A single page app that uses <mark>isomorphic rendering</mark> to build views on the server at runtime.

pesudo class
: `a:hover`

## pseudo element

`p::before {} p::after {}`

Add some cool things without needing any extra markup like

* Adding quotation marks
* Create add icons
* add tool-tip
* custome counters
* add external link icons after a tags which atart with http
  ```
  a[href^="http"]::after { content: \f35d; font-family: 'Font Awesome 5 free'}
  ```

{{% warning %}}
    Pseudo element definition should have a <tt>content</tt> property else it won't work.
{{% /warning %}}

May sound similar to pesudo class but is different

pesudo class
: `a:hover`

### Pseuso elements codepen demo

{{% codePen gNGmJm %}}

## JAM stack and cach invalidation

Abbreviation for javascript, APIs, Markup is a net pattern to make static websites look cool again.

* Entire project lives on CDN
* Everythign lives in Git
* Instant <mark>Cache Invalidation</mark> on rollbacks or updates
  * Can this be cached, and if so by whom?  (HTTP header: cache-control — private vs public)
  * How long can it be cached for? (HTTP header: cache-control — max-age)
  * How can I tell if it’s been changed?  (HTTP header: etag in combination with above)


Assume that 120 seconds have passed since the initial fetch
the browser could dispatch a new request and fetch the new full response. However, that’s inefficient because if the resource hasn't changed, then there's no reason to download the same information that's already in cache![^1][^2]

Twitter cards[^4]

Email Subscription Service [buttondown](https://buttondown.email/)

[PWA service worker](https://gohugohq.com/howto/go-offline-with-service-worker/)

## HTTP/2

* [Faster content delivery](https://youtu.be/cznVISavm-k)
* Whats critical resource for your webpage?
  * 3 Most critial network calls
  * Is it gonna be fonts?
  * tracking scripts?
  * jquery from CDN?
  * Hero images?
  * CSS for current route?
* Performance is a UX (user exxperience) problem
* Fonts are not discovered until CSS files are parsed - add `preload` headers
* Enable your server (IIS, nginx, apachey) to use HTTP2 to enable network **PUSH**
* Server PUsh benefits
  * 1 round trip saving
  * Useful for long server think time
  * Useful for long RTT times
* **Async Push**
* [HTTP Push implementations vary widely](https://jakearchibald.com/2017/h2-push-tougher-than-i-thought/)

### Footnotes

[^1]: [netlify on caching](https://www.netlify.com/blog/2017/02/23/better-living-through-caching/)
[^2]: [optimizing content efficiency using caching](https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/http-caching)
[^4]: [twitter cards for hugo](https://gohugohq.com/partials/twitter-cards-partials-for-hugo/)
