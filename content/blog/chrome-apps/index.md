---
title      : "Google Cloud Applications"
date       : 2019-08-16T19:03:51+02:00
publishdate: 2019-08-17T19:03:51+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- myLearning
categories:
- development
tags:
- cloud
- google
---

## Google Sheets

> Sheets are are people, databases are for machines

1. Merge multiple sheets data to one
2. Logical Tests
3. Regular Expressions for data validation/extraction
4. Conditional Formatting, Locking the column `$`
5. Dynamic dependent dropdown Lists
   1. Data validation
   2. `Match()`, `Indirect()`, `Transposr()`
6. Use App Script custom Menu to Add NEW ROW (from a template/previous row)
7. Send emails directly from spread sheet
8. App Script functions to share on social media
9. App Script functions to onboard/unboard from menu or from a action button, move them b/w sheets.
10. [Make interactive Timeline from spreadsheet data](https://youtu.be/elwQTp0aVpk)
11. ArrayFormulas `={1,2,3; 4,5,6; 7,8,9}`
12. [Import HTML tables, lists from web](https://support.google.com/docs/answer/3093339?hl=en)

## How to use google sheets API

* Create Client ID
  * Register your application for Google Sheets API in Google API Console
* Automatic sync
* 2-way Sync
* List all google sheets from google drive
* [read sheets data with nuxt](https://github.com/dev7ch/nuxt-google-sheet/blob/master/components/Sheet.vue)
* https://github.com/amitrahav/vuejs-gapi-sheets-example
* [How to add google signin to vue app](https://forum.vuejs.org/t/how-to-integrate-google-sign-in/3786/4)

## Google Sign IN for webapp

> Federated LogIn - Google SignIn

* SignIn Button
  * User accepts to share information
* First signIn, then **Incrementaal authorization**
  * asking for permissions as they are needed
* Add `client_ID` to `meta` and load google.api in `head` of Html page
* Render BUtton
  * Design a custom button
  * EventListner when button is pressed to run GSignIn
    * returns google object with user info
* [Google Login WOrkflow](https://camo.githubusercontent.com/72ddfc00510fe88794e7373694d25628aa419a65/687474703a2f2f692e696d6775722e636f6d2f425150584b79542e706e67)
* [How OAUTH works with nUXT](https://auth.nuxtjs.org/)
  * Use js `debugger`
  * Use try, catch here
  * Thankyou user for logging in

{{< code numbered="true" >}}
gapi.load('auth2', function () {
  gapi.auth2.init();
})
{{< /code >}}

## What do people do with it? Use cases

> sheets which can do calculations

{{% note %}}
Quick Prototyping
{{% /note %}}

1. Calculator
2. Databases
3. Analysis
4. Modelling
5. List Management
6. Data Visualization
7. Report generation
8. Workflow Application
   1. Email everytime a new entry is added, with new entry and link to sheet
   2. Capture fields from Google Forms
9.  Documentation etc.

{{% warning %}}
Do not use when, it changes from **Mission Critical** to **Mission Impossible**
{{% /warning %}}

> Its like a infant, Do not even know the boundaries of theor own ideas, they scratch theor own head.

* Google Sheets as a JSON Endpoint

## FAQ

* https://stackoverflow.com/questions/55100926/the-request-is-missing-a-valid-api-key

## Features

* Copy paste to get ris of the underlying formula for us
* Import data from multiple sources (shapes, size)
* Can show image thumbnails
* Rows Grouping


### Footnotes

* https://www.youtube.com/watch?v=vnm6ViI06MM
* [Add created and modified time to records as they are created](https://www.youtube.com/watch?v=548dD3iXetg)
* [What do {curly braces} around javascript variable name mean - destructuring statemet](https://stackoverflow.com/questions/25187903/what-do-curly-braces-around-javascript-variable-name-mean)
* https://stackoverflow.com/questions/tagged/google-sheets-api