---
title      : "Rust Language"
date       : 2019-09-25T21:04:53Z
publishdate: 2019-09-25T21:04:53Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
tags:
- rust
---

101
: what going on here
* the survey course

> Thou shall be constructive
> Thou shall not be a jerk

<!-- more -->

## Rust

* low level **system language**, contrast to `Go`, a language for **sysadmins**
* memory safe, solve memory management problem
  * no `segmenation fault` - date moved by a pointer and then a function calling the dereferenced pointer again
  * Compiler keeps track of all pointers in context
  * basically system has a limited memory and there will be a point when you would have to reuse the memory. You cannot go wrong there as it will produce whole bunch of problems
  * Garbage Collector - pauses the execution for a monent and resorts everything
    * This pause could be noticable in small performance devices
* BORROWING
* Very precise deallocating memory, which you do nt have to do manually
* LLVM supported architectures
* Compare the newer [build result with the older versions](https://github.com/rust-lang-nursery/taskcluster-crater)
* [Play rust](https://play.rust-lang.org/)
* Pay attention to scopes `{ ...{...}}`
  * determines **lifetime** and values at any given point of time
* `fn myfunction (arg: type, arg: type) -> resulttype {...}`
  * saying what your function is goin to do.
* **Macros** shorthand for fucntions that take `n` number of arguments
* Matching on Variables
* `..` range 2 dots - exclusive in the end
* `...` match 3 dots - inclusive in the end
* **Traits** and **Types**
  * trait describes a types ability
* OWNERSHIP
  * every value as exactly 1 one owner at a time
  * can be changed during execution
  * `let first = 42`
  * `let second = first`
* BORROWING
  * We need to acces memory from more than one place at once
  * temporary acces to values
  * cannot outlive owner
  * `&borrw`
* LIFETIMES
  * No borrow can outlive the OWNER
* Package Manager `cargo`
* Libraries `crates`
* Are you building a library or a binary that uses a library
*  

> How far does rust SAFE extends?

* IO conundrum
* canot prove safery outside rust language

> Why is there a crab for rust? , mascot

> How to keep track of security vurnabilities in libraries you are using? To make
> sure your program is secure? 
> I wanted to write a socket, I spent good 30 mins time, where am I not looking?
> Rust for embedded?

* Where system languages shine

> Where rust doesnt run?

* LLVM supported hardwares
* ESP32 board

> Why does the println! function use an exclamation mark in Rust?

https://stackoverflow.com/questions/29611387/why-does-the-println-function-use-an-exclamation-mark-in-rust

Writing shell scripts in Rust

* https://github.com/google/rust-shell
* https://doc.rust-lang.org/std/process/struct.Command.html

### Footnotes

[^1]: https://www.rust-lang.org/
[^2]: https://areweideyet.com/
[^3]: http://edunham.net/
[^4]: http://talks.edunham.net/
[^5]: https://github.com/rust-lang/rustlings/
