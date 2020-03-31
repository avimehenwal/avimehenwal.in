---
title      : "Web APIs"
date       : 2019-08-17T15:02:13+02:00
publishdate: 2019-08-18T15:02:13+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
- design
- deployment
- development
tags:
- api
---

> Death is inevitable, might get it over with, be glad there is an outlet close enough to the bathtub.

API is a **communication interface** to enable communication b/w various programs, softwares, computers, web application over variou networks

1. How to quickly **prototype** APIs?
   1. https://apiblueprint.org/
2. How to **design** an API?
3. How to **document** APIs?
4. How to **crawl/walk** over APIs?
   1. scrapy python
5. API Inspirations - steal like an artist
   1. https://developer.github.com/v3/
   2. https://stripe.com/docs/api
   3. https://api.slack.com/
   4. https://developer.twitter.com/en/docs
6. [Public APIs API](https://api.publicapis.org/entries)

## REST constraints

1. uniform interface
2. client -server
3. stateless
4. cachable
5. Layerred system
6. Executable code - optional
   1. C - POST or PUT
   2. R - GET
   3. U - PUT or POST
   4. D - DELETE

Application Programming Interfaces provides means to connect a URL to a available web-resource

* Postman can generate and publish APIs documentation
* [Using AppScript to capture and collecct information in sheets](https://developers.google.com/apps-script/guides/services/external)

## Usages

* Displaying random geeky, math jokes, motivational quotes
* Search iTunes store for music
* [GIPHY Stickers](https://developers.giphy.com/docs/api)
* [Pokemon API](https://pokeapi.co/)
* [Get current ISS location](http://open-notify.org/Open-Notify-API/ISS-Location-Now/)
* [Get Google FIT data to spreadsheet](https://ithoughthecamewithyou.com/post/export-google-fit-daily-steps-to-a-google-sheet)
* [Which technologies a website is using?](https://www.wappalyzer.com/)

> Making promise based API calls from sheets!

[Use `flush()` to apply all pending Spreadsheet changes.](https://developers.google.com/apps-script/reference/spreadsheet/spreadsheet-app#flush)

## Google APIs

* https://developers.google.com/oauthplayground/#step3&apisSelect=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&url=https%3A%2F%2Fwww.googleapis.com%2Fdrive%2Fv3%2Fabout%3Ffields%3D*&content_type=application%2Fjson&http_method=GET&useDefaultOauthCred=unchecked&oauthEndpointSelect=Google&oauthAuthEndpointValue=https%3A%2F%2Faccounts.google.com%2Fo%2Foauth2%2Fv2%2Fauth&oauthTokenEndpointValue=https%3A%2F%2Foauth2.googleapis.com%2Ftoken&includeCredentials=unchecked&accessTokenType=bearer&autoRefreshToken=unchecked&accessType=offline&prompt=consent&response_type=code&wrapLines=on
* https://stackoverflow.com/questions/32076503/using-postman-to-access-oauth-2-0-google-apis

```sh
curl 'https://www.googleapis.com/drive/v3/about?fields=*' -H 'authority: www.googleapis.com' -H 'pragma: no-cache' -H 'cache-control: no-cache' -H 'accept: application/json, text/plain, */*' -H 'origin: http://localhost:3000' -H 'authorization: https://www.googleapis.com/drive/v3/about' -H 'sec-fetch-dest: empty' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36' -H 'sec-fetch-site: cross-site' -H 'sec-fetch-mode: cors' -H 'referer: https://www.googleapis.com/' -H 'accept-language: en-US,en;q=0.9' --compressed
```

### Footnotes

[1]: [Some cool and funny APIs to work with](https://github.com/benlcollins/apps_script_apis)
[^2]:
