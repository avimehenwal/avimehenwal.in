---
title      : "Javascript"
date       : 2019-07-12T23:16:43+02:00
comments: true
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

node.js
: asynchronous ([non-blocking](https://nodejs.org/en/docs/guides/blocking-vs-non-blocking/)) event driven JavaScript runtime
* built against [V8](https://v8.dev/)
* V8 is JavaScript and WebAssembly engine, written in C++
* Doesn't use OS-threads based networking for concurrency
* Uses [callback pattern](https://nodejs.org/en/knowledge/getting-started/control-flow/what-are-callbacks/) almost everywhere
* A callback is a function called at the completion of a given task; this prevents any blocking, and allows other code to be run in the meantime.
* normaljs + additional capabilities on c++ player like `file`, `http` etc
* single thread can handle multiple requests
* nodeis continuously listening to `event queue`
* since its single threaded, bad for CPU intensive apps but good for read/write intensive apps
* Traditional js needs `window` object to operate on. *nodejs* removes that limitation by emulating a browser environment to run js

### Node module system

* In node every file is a module and variables and fucntions defined in that module are scoped to that module.
* explicitly `export` the private variables or functions if want to use them in other files. `module.export.url = url;`
* Why this design? Hide the implementation details. Eg: a DVD player, interface options are important for operations reset everythign is implementation detail
* `const logger = require('./logger');` to avoid accidently overriding `logger` value
* node does not run our fucntion directly, rather wraps it inside other functions.

built-in modules
: os
* fs
* events
* http

```js
// synchronous version
function processData () {
  var data = fetchData ();
  data += 1;
  return data;
}

// asynchronous version with callback pattern
function processData (callback) {
  fetchData(function (err, data) {
    if (err) {
      console.log("An error has occurred. Abort everything!");
      return callback(err);
    }
    data += 1;
    callback(data);
  });
}
```

## New ES6 syntax

### Thick arrow or hipster syntax

> How to filter search using only vanilla js?[^1]

Arrow Functions
: Fat and Concise Syntax in JavaScript `=>`
- They are one-line mini functions which work much like Lambdas in other languages like C# or Python.
- By using arrow functions, we avoid having to type the function keyword, return keyword (it’s implicit in arrow functions), and curly brackets.


```js
// ES5
var x = function(x, y) {
    return x * y;
}

// ES6
const x = (x, y) => x * y;
// or
cont x = (x, y) => { x * y };
```

We can skip writing liternal name twice if name of variable is same as property name.
ES6 expands it automatically

```js
// old
{ route: route }

// new
{ route }
```

using `var` before variable names could be neglected

```js
var foo = 5;
foo = 5;
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

## Practise Environment

1. In browser, use [jupyter notebook](https://jupyter.org/) with **magic command** `%%javascript` to run js inside jupyter notebook.
   1. [Jupyter Lab](https://jupyterlab.readthedocs.io/en/stable/index.html) newer alternative

```
sudo apt install -y jupyter
pip install --user jupyterlab
set --export --global $HOME/.local/bin $PATH
jupyter lab

# add javascript kernel
sudo npm install -g ijavascript
ijsinstall
# refresh jupyter lab
```

2. On terminal, using [nodejs](https://nodejs.org/en/)


### jupyter lab

```
// no variable types
b = 123
a='avi'
c = "mehenwal"
console.log(a,b,c)
```

    avi 123 mehenwal



```
const os = require('os');
```


```
totalMemory = os.totalmem();
freeMemory = os.freemem();
console.log('totalMemory =',totalMemory,'\nfreeMemory =',freeMemory)
```

    totalMemory = 7793405952
    freeMemory = 131977216


### Template String syntax
ES6 or ES2015


```
console.log(`Total Memory: ${totalMemory}`)
console.log(`Free Memory: ${freeMemory}`)
```

    Total Memory: 7793405952
    Free Memory: 131977216


## Filesystem


```
const fs = require('fs');
```


```
const folderPath = '/home/avi/mySoftwares/EXP/jupyter';
```


```
// new syntax
fs.readdir(folderPath, (err, files) => {
  files.forEach(file => {
    console.log(file);
  });
});
```


```
// older syntax
fs.readdir(folderPath, function(err, files) {
    if(err)
        console.log('Error', err);
    else
        console.log('Result', files);
})
```

## events


```
const EventEmitter = require('events')
const emitter = new EventEmitter();
```

    .ipynb_checkpoints
    nodejsBasic.ipynb
    Result [ '.ipynb_checkpoints', 'nodejsBasic.ipynb' ]



```
// register a listner
emitter.on('event', () => {
    console.log('event occoured');
});
```




    EventEmitter {
      domain: null,
      _events: { event: [Function] },
      _eventsCount: 1,
      _maxListeners: undefined }




```
emitter.emit('event')
```

    event occoured





    true


## Questions

1. Difference b/w node and vue js?

> Understand the CONCEPT, why JS is the way they are? What do people who wrote
> JQUERY wrote know that you dont know. Those that learn how things work under the
> hood, solves the problem better.

## Javascript

{{% note %}}
Code is executing code, which is written by other people
{{% /note %}}

```js
// JS Hoisting, still works though a=undefined unlike other languages
b()
console.log(a)

var a = 'Hello World'
function b() {
  console.log('called b')
}

// coercion example
var a = 1 + '2';
console.log(a);    // a = 12

// Callbacks
let x = function () {
  console.log('inside X')
}
let y = function (callback) {
  console.log('Function Y')
  callback()
}
y(x)
```

1. Tools you need - **browser**. Setup env to run js in browser
2. multiple Key-value = Objects
3. language grammer, compiler/interpreter
   1. Syntax Parsers - parsing source code character by character as per defined grammer
4. Javascript Engine creates
   1. Lexical Environment
   2. Global Execution Context - particular/running lexical env
   3. JS file loaded, syntax parser started and execution context was created
      1. `this.`, `window` - global object
      2. these things are automatically created by JS engine, we wrote no code for it
   4. Google chrome `v8 engine`
   5. **Javascript HOISTING**
      1. Execution context is created in 2 phases
         1. Creation phase
            1. Global object
            2. this
            3. outer environment
            4. setup memory space for variables and functions = hoisting
         2. Execution phase - line by line traditional execution
            1.
5. `undefined` is a special value js has inside it.
6. `null` lack of existence
   1. I the programmer, never set this value
7. JS is single threaded, synchronous execution
8. Function Invocation `function()` - function call
9. Veriable environment - namespace, where does the variable live?
10. Scope Chains, lexical linking
11. `let` block scoping. Not allowed to use it until the line of code is run that declares the variable
    1.  inside the block
12. Asynchronous Callbacks
    1.  More than one at a time
    2.  Event Queue
13. Static typing and Dynamic Typing
14. Data types in JS - null, undefind, boolean, string, number, object, symbol, function
15. **Coercion** - Converting a value from one type to another
16. Frameworks
    1. Not seperatring the code in any way, no new execution context
    2. just stacking code
    3. Running all js code as if was inside one file
    4. checking the global namespace so that it doesnt collide
       1. `window.libraryName = window.libraryName || "Lib 2"`
17. Objects and Functions are closely related in JS
    1.  `var Person = {}`
18. Callback Functions - Higher order functions
    1.  First Class Objects - pass other functions as arguments to functions
    2.  Enforce the order of time-consuming operations
        1.  Adding new data to DB then updating the view once updated


### Footnotes

[^1]: [ES6 features](http://es6-features.org/#ExpressionBodies)
[^2]:
