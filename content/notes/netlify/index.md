---
title      : "Serverless Functions"
date       : 2020-04-13T22:47:13Z
publishdate: 2020-04-13T22:47:13Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- myLearning
categories:
- deployment
tags:
- netlify
- serverless
---

{{% note %}}
aka. Lanbda Functions, Cloud Functions
{{% /note %}}

## Serverless Functions

> server-side code without having to run a dedicated server.
> Function as A Servidce - FaaS

* are a lightweight, **event-based**, **asynchronous** compute solution that allows you to create small, single-purpose functions that respond to cloud events without the need to manage a server or a runtime environment
* Function **Triggers**, like HTTP trigger function
  * Work in sync with *PUB/SUB* event pipelines topics
  * Cloud Events
    * Authentication success/failure
    * File uploaded to store
* Providers
  * Google Cloud Functions - needs Billing, not free
    * python, node 6, go, java supported
* use them as a **glue** b/w other fucntions and services
* Why not add entire App? Why only restrict to fucntions?
  * Fucntons as a abstraction, microservices
* No need to worry about server **scaling**

{{% warning %}}
Use `nvm` to switch b/w various versions of node from commandline.
{{% /warning %}}

## Use Cases

> Focus on Business Value

* Disploy Business Logic as a FaaS, emojinizer app
  * upload photo, replace faces with emoji
  * same service for cell phone, web, other devices
* Monitor your serves using serverless, VM going down
* IoT temperature sensors
* Chaining multiple fucntions
* Cloud fucntions for firebase
* Text messages
* Chat bot with dialogues
* Payment with stripes


### Use functions with static sites

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
