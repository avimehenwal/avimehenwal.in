---
title: 07 Juli
date: "2019-07-07T09:37:58+02:00"
revision: 1
series:
- DailyLogs
categories:
- frontend
tags:
- gridsome
- npm
- vuepress
---

tl;dr
<!-- more -->

## webpage Data Sources

* filesystem - md files, csv files
  * would need a parser as well, like for md files
* json from other websites, apis or services (airtables)
* from CMS?

* how to add plugins to fw? in config files
* components --> layouts --> pages
* static-query | static-query | page-query
* Source fake data into Pages for testing purposes

gridsome.config.js
: site variables
* plugins information with parameters

gridsome.server.js
: load data sources
* create Pages

#### How does the component work?

too hard to understand concepts, debug and lack of documentation and working examples


#### How to create npm package dependecy file?

```
npm init
npm install vuepress --save
```

## Vue press

Why use it? out-of-box advantages

* use vue inside md
* inbuilt search from `h2` `h3` headers

* <mark>export default</mark> a hook function 
* markdowns (compiled)--> vue components (processed)--> webpack :prefer relative
* Components are automatically registered as global async
* The Layout component will be invoked once for every .md file
  * metadata variable `this.$site`, `this.$page`
* README.md gets converted to index.html
* SPA powered with router