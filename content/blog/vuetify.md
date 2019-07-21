---
title      : "Vuetify"
date       : 2019-07-21T16:57:19+02:00
comments: false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- design
tags:
- vue
- vuetify
---

## What is vuetify

* Component framework
* based on Google Material Design Specifications
* Full SSR support
* customizations from `vue ui`
* Accessibility support
* lost of inbuilt components which comes with library starts with `v-`

Follow [this sample project's logs for development][1]

* Each component has its own set ot `props`
* components are translated to normal HTML elements at rendering
* usually things are placed inside `<v-content>` component
* A `layout` represents a row of contents
* ES6 Template string
  * can create normal string
  * but also output dynamic variables in the string

breakpoints
: width of display devices in pixels

## CSS Flex System

Let us assume that our screen is divided into 12 columns.

Abbr | meaning
-----:|:-------
xs | extra small
sm | small
md | medium
lg | large

* The structure of your layout will be as follows, `v-container` > `v-layout` > `v-flex.`
* `v-card-title`, `v-card-text` and `v-card-actions`

### Whats Next?

* [How to build a real-time editable data table in Vue.js](https://www.freecodecamp.org/news/how-to-build-a-real-time-editable-data-table-in-vue-js-46b7f0b11684/)
* [Checkout templates at github](https://github.com/vuejs-templates)
* [Make a real dashboard](https://github.com/iamshaunjp/vuetify-playlist)

### Footnotes

[1]: https://github.com/avimehenwal/v-demo/commits/master
[^2]:
