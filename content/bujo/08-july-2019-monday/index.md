---
title      : "08 July 2019 Monday"
date       : "2019-07-07T22:00:00+00:00"
slug       : ""
draft      : true
series     : [DailyLogs]
categories : []
tags       : []
revision   : 0
---

NetlifyCMS accessable on <site_url/admin>

### Collaspable section in markdown

{{< code numbered="true" >}}
[[[<details>]]]
    [[[<summary>]]]
        Expand to view details
    </summary>
    * lorem
    * ipsum
    *text
</details>
{{< /code >}}

1. details tag
2. summary tag inside details tag

How to filter search using only vanilla js?[^1]

Arrow Functions: Fat and Concise Syntax in JavaScript `=>`
   - They are one-line mini functions which work much like Lambdas in other languages like C# or Python. 
   - By using arrow functions, we avoid having to type the function keyword, return keyword (it’s implicit in arrow functions), and curly brackets.

```js
// (param1, param2, paramN) => expression

// ES5
var multiplyES5 = function(x, y) {
  return x * y;
};

// ES6
const multiplyES6 = (x, y) => { return x * y };
```

VUE.JS tutorial

* Everything is encapsulated
* Babel - compile new js specification for older browser compatibility
* VUEX - website state management system
* npm install -g @vue/cli
* create new project
  * CLI way
    * vue test
  * GUI way
    * vue ui
* Components are embedded just like HTML tags
* `main.ja` is the entrypoint of vue
* browser requests/loads index.html, which has `id='app'` and vue components enter through main.js into the webpage.
* **props** are exported to expose
* there has to be atleast one element inside `<Template>` tag
* `<style scoped>` css would affect only the local elements
* Learn javascript for free[^2]
* There may be data/utilities(axios) you’d like to use in many components - vue instance prototype property

el
: element

vue double moustache syntax
: {{ something }}

v-on
: listen to DOM event and event handling

* vue directives are used to interact with DOM
* difference between *v-if* and *v-show*
  * css property display:none vs not being present in DOM at all
  * So prefer v-show if you need to toggle something very often, and prefer v-if if the condition is unlikely to change at runtime.
* v-bind:/<html attribute/>
  * Dynamically add classes
    * Object syntax
    * js ternary syntax
* a component’s data option must be a function, so that each instance can maintain an independent copy of the returned data object when the component is reused
* Componenet must pe places BEFORE new Vue object is instantiated
* every component must have a single root elemen
* Component lifecycle functions
* inside components only required field to have is template
* vue **computed** properties are halfway between *data* and *methods*
* vueX - state management system
* vue has global store
* use short for project root directory `import cats from '@/data/cats'`
* actions -> mutations -> updates state
* that only kebab-case names are valid directly in the DOM (i.e. non-string templates).
*  

What can you do?
1. quiz application
   1. questions pulled from API
   2. only user action for selection are computed
   3. red / green based on user choice
2. toDo list
3. Drill down Animals data

### Dashboards

* SVG + Front end rendering (VUE)
* data coming from browser, draw SVG, no graphing library required
* SVG rectangle powered by javascript to draw bar graphs
* `<g>` element in SVG is like `div` element in html
* random data generated to draw bar up/down effect
* ANimate things very nicely with vue
* Transitions -> CSS animations -> jS animations
* show and hide things based on conditions
  * style bindings
  * out-in - mostly
  * in-out
* Flip technique - causes least amount of repiants in browser than transitions
  * store and filter data animations
  * sudoku rearranges nummbers
* Reactive programming is programming with asynchronous data streams. stream is ongoing
* `<Watchers>` for reactive programming

{{% codePen WqYGMp %}}

## Footnotes

[^1]: [w3schools, filter search](https://www.w3schools.com/howto/howto_js_filter_lists.asp)
[^2]: [gh, You-Dont-Know-JS](https://github.com/getify/You-Dont-Know-JS)
[^3]: [difference between front end framework and templating language](https://stackoverflow.com/questions/25025317/what-is-the-conceptual-difference-between-angularjs-and-view-template-engines-in)