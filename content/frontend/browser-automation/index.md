---
title      : "Browser Automation"
date       : 2020-04-18T16:52:18Z
publishdate: 2020-04-18T16:52:18Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Frontend
categories:
- programming
- design
tags:
- browser
- automation
---

HAR File Format
: The HTTP Archive format, or [HAR], is a JSON-formatted archive file format for logging of a web browser's interaction with a site.
* The common extension for these files is `.har`.

# Browser Automation

* [Awesome Browser Automation List on Github][awesome]
* PhantomJS
  * First headless browser in history
  * Lets you run HTML, CSS code directly from CLI
* In 2017, version 59 had **Headless Mode**
* [CDP] - Chrome Devtools Protocol
  * One browser talking to another
* Simulate/Alter screen resolutions and Network Throttling settings

{{< code numbered="true" >}}

# Windows/mac
chrome --headless --screenshot=sc1.png http://website.com
chrome [[[--remote-debugging-port=9222]]]
DevTools listening on ws://127.0.0.1:9222/devtools/browser/9d98bd43-a475-4b0d-a3ad-8e32f05b7ab4

# Linux
google-chrome-stable --headless --screenshot=sc1.png http://avimehenwal.in
{{< /code >}}

1. Enable remote debugging in chrome

## Pupptier

> Browser automation solution built on nodejs

* [Pupptier Documentaion][doc]
* Puppeteer allows access to the measurement of loading and rendering times provided by the **Chrome Performance Analysis tool**
* Puppeteer affords more control over Chrome's browsers than Selenium WebDriver offers (likely due to Google’s support and sophisticated knowledge of Chrome).
* Puppeteer is set as default to run in headless mode, and it can also be changed to watch the execution live in non-headless mode.
* Eliminates biggest problem - installs the browser with npm package
* Puppetier for Firefox - WIP
* Runs on docker, online CI, localhost, cloud providers etc
1. Been in market since 2017
   1. Who uses it?
      1. Google, Facebook, Netflix
2. Uses Official Chrome API
* Who maintains Puppeteer?
  * The Chrome DevTools team maintains the library, but we'd love your help and expertise on the project! See Contributing.
* Use process.env [env] to read account username and passwords
  * protect identities

## API Functions

page.evaluate(pageFunction[, ...args])
: run and JS function

page.$$(selector)
:  runs `document.querySelectorAll` within the page

page.focus
: Focuses on element before performing any action

page.content()
: Gets the full HTML contents of the page, including the doctype.

page.click(selector[, options])
: fetches an element with selector, scrolls it into view if needed

page.type(selector, text[, options])
: Enter text to input HTML form data

Puppeteer wait page load after form submit
: `await page.waitForNavigation();`

* [Scroll into view and wait for ajax call to finish](https://stackoverflow.com/questions/54063272/puppeteer-problem-queryselectorall-returning-only-one-element/54064122#54064122)

## Selenium vs Puppetier

{{% note %}}
Turn anywebsite into an API
{{% /note %}}

#### Puppetier

1. Faster than selenium
2. Only nodejs language supported, selenium supports java, python etc

## Common Problems

2. Why are Browser Based Tests slow?
  * new browser window for each test case
  * **Browser Context** - based on Incognito mode, 100x faster
3. Tests are flaky
   1. Why? Page content loads asynchronously, react, vuejs
      1. general soulution add wait
   2. Reactive APIs
      1. waitForSelector
      2. waitForResponse

## Modern Web - SPA

1. Mobile first responsive test
2. Offline mode
   1. setOfflineMode(true)
3. Attack to service Worker and use service worker testing
4. Geolocations
5. Network Monitoring
   1. golden standar --> google chrome devtools waterfall
6. Network Modifications
   1. Mock and API if endpoint (like payment) fails
7. Dispatch API Handler, real mouse and keyboard events, which change the CSS, HTML in DOM
8. Its not enough just to test if webiste is working properly, Make sure it works as BEST AS POSSIBLE
9. Performance Testing
   1. `page.metrics` --> JS heap size
   2. Chrome Tracking
   3. Chrome Tracking
10. Code coverage in devtools, puppetier
11. Acccessiability testing

## Headless Automation

> Frontend for your webapp frontend

* Tap into debugging port programatically using `--remote-debugging-port`
* Pre-render dynamic pages JS applications
  * empty div is populateed by JS -> vuejs
  * page.content()
* Dont wait for entire page to load, intercent and kill unnecassary requests
  * kill unnecessary, images load, media etc if not useful
  * We only care about the markup
    * video tags and css do not build the DOM
* Code Coverage API
* A/B Testing
  * linked stylesheets vs inline stylesheets
  * live change the page on fly
  * `page.$$eval('css selector')`
    * callback is injected into the page
* COnstruct a PDF on the fly, maybe for updated downloadable documentation
  * Use tool on your system to generate PDF, your browser
  * No need to install additional PDF library
* Make your browser Talk
  * browser - web speech syntehsis API
  * inject text from node
  * AUdio is NOT supported by headless chrome, need a window
  * Chromium does not have accents
* Test Chrome Extensions
  * Only in full version of chrome
  * Pass extension directory path
* Crawl a SPA
  * visualize your app
  * create a site-map on the fly
  * Discover all links on page
    * `page.$$eval('a', links => {`
    * check if they have the same origin
    * createa a D3 visualization
* Verify service worker is actually caching
* Browser as a webservice, **SAAS**


### Resources

* https://youtu.be/QgZ7qv4Cd0Y
* https://github.com/avimehenwal/rpa-web-core


[awesome]: https://github.com/angrykoala/awesome-browser-automation
[HAR]: https://en.wikipedia.org/wiki/HAR_(file_format)
[async]: https://javascript.info/async-await
[CDP]: https://chromedevtools.github.io/devtools-protocol/
[doc]: https://devdocs.io/puppeteer/index#pageevaluatepagefunction-args
[source]: https://github.com/puppeteer/puppeteer
[example]: https://github.com/puppeteer/examples
[awesome]: https://github.com/transitive-bullshit/awesome-puppeteer
[env]: https://nodejs.org/api/process.html#process_process_env


### Footnotes

* https://youtu.be/lhZOFUY1weo
* https://ericbidelman.com/posts/2019/02/pptrstagingserver
* https://stackoverflow.com/questions/tagged/puppeteer
* https://stackoverflow.com/questions/61176809/puppeteer-await-page-classname-but-i-get-only-the-first-11-element-with/61176935#61176935
* https://socialmanager.tools/
* https://github.com/social-manager-tools


git remote add --track nightly upstream git@github.com:social-manager-tools/socialmanagertools-igbot.git