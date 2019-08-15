---
title      : "Chrome Web Store"
date       : 2019-08-15T19:22:24+02:00
publishdate: 2019-08-16T19:22:24+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
tags:
- chrome
- extension
- webapp
---

Manifest
: clear or obvious to the eye or mind.

## Chrome Extension

Extensions are **event based programs** used to modify or enhance the Chrome browsing experience.

* Extensions monitor these events in their background script, then react with specified instructions.
* Monetize building Chrome Apps
* Can have **permissions**, just like other google products (OAuth)
* Register the App using manifest file.
* Extension can have a *User Interface* or a *Popup*
* Browser has its own **storage** area.

### What can extensions do?

* React to chrome events
* can altering the look and behavior of web pages
* store manage passwords
* display data from external API, service
* Send data to external service

### build an extension that allows the user to change the background color of any page

Everything in google chrome web store starts with a manifest file.
The directory holding the manifest file can be added as an extension in developer mode in its current state.



{{< code numbered="true" >}}
  {
    "name": "Getting Started Example",
    "version": "1.0",
    "description": "Build an Extension!",
    [[["background"]]]: {
      "scripts": [
          "background.js",
          "backgroundContextMenus.js",
          "backgroundOmniBox.js",
        ],
      "persistent": false
    },
    "manifest_version": 2
  }
{{< /code >}}

1. Background scripts monitors events and loads when specific event occurs, then performs its task (like data manipulation or API calls)


### Footnotes

[1]: [Chrome Apps](https://developer.chrome.com/apps/about_apps)
[2]: [Sample Project](https://github.com/avimehenwal/chrome-ext)
