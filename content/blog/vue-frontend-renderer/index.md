---
title: Front end rendering - VUE
date: "2019-07-06T10:41:30+02:00"
revision: 0
weight: 5
series:
- myLearning
categories:
- design
slug: ""
tags:
- vue
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

class binding
object binding
we can bind array of classes too
computed properties vs data property
componenet accepts a name and an object ~ Vue object
component template is in backticks

logic to code premium customer - newer options like free shipping for premium customers
change product image on mouseover colours
diable BUY button and in-stock if a product is out of stock
Make a componet scope global - add it to main Vue object, like cart
HTML can call components using props, how about when component need to update html DOM?
  * component can $emit event and we attach a event handler as html attribute
  * when event is captured DOM can trigger a method
* v-bind - one way data binding
* v-model - 2 way data binding
* Nested components
* reset- values after we submit the form
* save submitted form data into review object and send it to server only on checkout
* Form validations
* mounted is a lifecycle hook
* vue bus to transport objects from one part to another
*   

1. Vue Instance
2. Attribute binding
3. Conditional rendering
4. List rendering
5. Event handling
6. class and style binding
7. computed properties
8. Components
9. Communication events
10. Forms
11. Tabs

ESlint - change single quotes to double quotes, remove/add simicolons

Managing states in a mullti componenet applicaion could be difficult

Vuex
: State management pattern + Library

states
: data on whichi data depends

Wihout vuex pattern - communicating *events* up and *props* down to share data
vuex uses *reactive approach* when one component updates the state,
other components using the data are notified.


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
