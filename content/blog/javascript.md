---
title      : "Javascript"
date       : 2019-07-12T23:16:43+02:00
comments: false
weight     : 5
revision   : 0
series:
- myLearning
categories: 
- programming
tags:
- javascript
- babel
---

ES6
: ECMAScript 6 or JavaScript 6
- most recent incarnation of javascript
- specification standardized by [Ecma International](https://en.wikipedia.org/wiki/Ecma_International)


### Thick arrow or hipster syntax

```js
// ES5
var x = function(x, y) {
    return x * y;
}

// ES6
const x = (x, y) => x * y;
```
<!-- more -->

## New ES6 syntax

We can skip writing liternal name twice if name of variable is same as property name.
ES6 expands it automatically

```js
{
    route: route
}

{
    route
}
```

## How to compiler javascript?

### Babel

* Babel is a JavaScript compiler.
* Babel is a toolchain that is mainly used to convert ECMAScript 2015+
  code into a backwards compatible version of JavaScript in current and
  older browsers or environments.
{{% ticks %}}
  * babel can Transform syntax.
{{% /ticks %}}

### Footnotes

[^1]: [ES6 features](http://es6-features.org/#ExpressionBodies)
[^2]: 
