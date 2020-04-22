---
title      : "Scraping Webpage"
date       : 2019-07-29T22:37:32+02:00
comments   : true
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
tags:
- javascript
---

## Scrape info from webpages using xpaths

Want to scrape all [character names from game of thrones show][got]

```
$x('//*[@id="mw-content-text"]/div/table[2]/tbody/tr/td[2]/a/text()').forEach(function(el){console.log(el)})

$x("//td[@class="first"]/a").map(function(el){return el.text}).join("\n")
```

* Select the information you want using `xpath`
* print output to console
* save output to a file[^1]

[got]: https://en.wikipedia.org/wiki/List_of_Game_of_Thrones_characters

### Footnotes

[^1]: [Rightclick and save chrome dev-tools output to a file](https://support.shortpoint.com/support/solutions/articles/1000222881-save-google-chrome-browser-s-console-file)
[^2]:
