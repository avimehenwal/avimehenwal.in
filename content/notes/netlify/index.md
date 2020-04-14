---
title      : "Netlify"
date       : 2020-04-13T22:47:13Z
publishdate: 2020-04-13T22:47:13Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- deployment
tags:
- netlify
- functions
---

## Lambda Serverless Functions

> server-side code without having to run a dedicated server

* Netlify lets you deploy serverless Lambda functions[^1] **without an AWS account**, and with function management handled directly within Netlify.
* Currently, you can deploy serverless functions[^1] built with **JavaScript** and **Go**
* **trigger** serverless function calls when certain Netlify events happen
  * deploy-succeeded
  * [ ] submission-created
  * identity-login

### How to use?

* Place all functions in a directory
* Let netlify bot know where to look for functions either via netlify.toml or through UI
* create a JavaScript file which **exports** a `handler` method.

## Use Cases

* [Write to Google Sheets](https://github.com/grod220/CCS-B.B.Warfield/blob/master/lambda/googleSheets.js)

### Footnotes

[^1]: [Netlify functions examples](https://functions.netlify.com/examples/)
[^2]:
