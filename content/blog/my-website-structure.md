---
title         : "My Website Structure"
date          : 2019-06-25T14:19:27+02:00
image         : "img/unicode-secret.png"
external_link : ""
weight        : 5
categories    : []
tags          : []
---

# _defaults

## baseof.html

- head
- nav menu
- body
  - *list pages* ByWeignt.Reverse
  - *single pages* main title, tags, date modification
  - *tag page* ByWeight.Reverse
- footer
- AdSense ads

## Partials

1. head
  * update page title
  * SEO meta data and tags updated for each page
  * Add Googel Analytics
2. hero / main-title
3. nav menu
5. tabbed image gallery
6. socialshare - options values from toml file
7. tags, categories, sections
8. revision progress bar
9. scripts - for adding javascrip to pages
10. toc - table of contents with JS to embed section into page
11. comments

## search

## Shortcodes - Frontend framework related

1. asciinema
2. info
3. tip
4. quote
5. warning
6. tooltip - help caption

## Worth mentioning

> Email subscription via google feedburner

```html
<form style="border:1px solid #ccc;padding:3px;text-align:center;"
    action="https://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow"
    onsubmit="window.open('https://feedburner.google.com/fb/a/mailverify?uri=avimehenwal/vExB', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
    <p>Enter your email address:</p><p><input type="text" style="width:140px" name="email"/>
    </p><input type="hidden" value="avimehenwal/vExB" name="uri"/>
    <input type="hidden" name="loc" value="en_US"/>
    <input class="w3-button w3-theme" type="submit" value="Subscribe" />
  </form>
```

> Google form to let visitor contact you

[Favivon Generator][1]

[1]: https://realfavicongenerator.net/ "realfavicongenerator"


## Footnotes

[^1]: 
[^2]: 
[^3]: 
[^4]: 
[^5]: 
