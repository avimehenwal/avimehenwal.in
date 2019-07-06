---
title      : "Front end rendering - VUE"
date       : 2019-07-06T10:41:30+02:00
slug       : ""
draft      : true
series     :
- myLearning
categories : 
- design
tags       : [vue]
revision   : 0
weight     : 5
---

tl;dr
<!-- more -->

SPA
: single page applications

web application replacing older desktop applications
+ easy to update
+ unbound by device/platform

MPA multi-page application | SPA

SPA
+ loads once in browser and then controlled by js for further use
+ Gmail, Google Maps, Facebook or GitHub.
+ Resourceful
  + resources (HTML, CSS and JS) are loaded once
  + later only DATA (json) is exchanged
+ easier to make Mobile applications as developer can reuse the same backend

- SEO may not know about content which comes via AJAX calls
- Securty concerns
  - more prone to XSS (cross site scripting) attacks

## VUE

* Declerative rendering
* Progressive web framework
  * progressive image loading
  * PWA by adding manifest.json and service worker
* 2-way data binding. Binds data through javascript v-model
  * view later data
  * data in javascript model
* Routing
* Components `.vue`
  * html template
  * GraphQL to fetch data
  * component scoped CSS
  * component scoped JS
  * export default - which would be imported into other components
* components are binded together under `/layouts`
* conditionals and loops v-for, v-if
* Handling inputs v-on:click=""
* all DOM manipulations are handled by Vue
* DOM is a tree
  * component system branches complete page tree to small tree branches
  * Componenet need to be registered with vue
    * componenets properties `prop` are binded with data v-bind 
* Life cycle diagram[^2]
* Vue compiles the templates into Virtual DOM render functions. 
  * Combined with the reactivity system, Vue is able to intelligently figure out the minimal number of components to re-render and apply the minimal amount of DOM manipulations when the app state changes.
* v-once interpolation that do not change
* 

## Gridsome

1. Uses GraphQL layer to get data from different sources in order to dynamically generate pages from it
2. External Data --> GraphQL system --> Queries in application
   1. Plugin: faker to automatically generate data
   2. Grab data from external API
      1. Axios - Promise based HTTP client for the browser and node.js
      2. JSONPlaceholder to get some dummy data
3. Insert your own data into graphQL using Data Source API



[bibliography]
### Footnotes

[^1]: [scrimba, vue tutorial](https://scrimba.com/g/gvuex)
[^2]: [vuejs, lifecycle diagram](https://vuejs.org/v2/guide/instance.html#Lifecycle-Diagram)
