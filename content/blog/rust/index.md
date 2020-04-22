---
title      : "Rust Language"
date       : 2019-09-25T21:04:53Z
publishdate: 2019-09-25T21:04:53Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
tags:
- rust
---

> What do you want to make the computer do?

101
: what going on here
* the survey course

> Thou shall be constructive
> Thou shall not be a jerk

<!-- more -->

## Rust

> A language empowering everyone to build reliable and efficient software.
> Write code for perpetuity

* low level **system language**[^8], contrast to `Go`, a language for **sysadmins**
* Rust is a **statically compiled**
  * The process of verifying and enforcing the constraints of types . Type Checking may occur either at compile-time (a static check) or at run-time (dynamic check).
* memory safe, solve memory management problem
  * no `segmenation fault` - date moved by a pointer and then a function calling the dereferenced pointer again
  * Compiler keeps track of all pointers in context
  * basically system has a limited memory and there will be a point when you would have to reuse the memory. You cannot go wrong there as it will produce whole bunch of problems
  * Garbage Collector - pauses the execution for a monent and resorts everything
    * This pause could be noticable in small performance devices
* BORROWING
* For web, **web assembly**
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
  * [Rust implements traits on types (structs)](https://www.youtube.com/watch?v=0sI-GzVSYic)
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
* Variables in Rust are immutable by default, and require the `mut` keyword to be made mutable.
* By default, the items in a module have **private** visibility, but this can be overridden with the `pub` modifier
* `let` Bind variables to values in a scope

## Data types

* Two types of Strings
  * Primitive string - immutables
  * Growable, heap allocated data structure
    * `String::from("Hello");`
* Tuples - group of values of various types
  * MAx 12 elements
* Vectors - Resizable Arrays
  * `let mut number: Vec<i32> = vec![1, 2, 3, 4]`
* Pointers, References
* Structs - are kin do classes, custome data types
  * `impl` has functions, methods and `struct` has properties

> C is like playing with knives, C++ is juggling flaming chain saws

## Anatomy

* Software Package
  * Binary
    * Libraries / Dependencies
      * Source code Files
        * Functions, classes and methods
          * Blocks - scopes - lifetimes
            * Statements
              * Expressions


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
* CALLSTACK - stack- fixed and heap - variable
  * PAper stack analogy
* Copying
  * a value to variable - individual copy
  * a pointer - not okey - 2 owners
    * `MOVE` ownership
* Even function arguments takes ownership
  * variable ownership is moved to argument
*

> Why does the println! function use an exclamation mark in Rust?

https://stackoverflow.com/questions/29611387/why-does-the-println-function-use-an-exclamation-mark-in-rust

> How to expand macros in rust?

```
rustc src/main.rs --pretty=expanded -Z unstable-options
```

Writing shell scripts in Rust

* https://github.com/google/rust-shell
* https://doc.rust-lang.org/std/process/struct.Command.html

> Using shell scripts is fine when you're using their strengths

## LLVM

The [LLVM compiler infrastructure](https://en.wikipedia.org/wiki/LLVM) project is a set of compiler and toolchain technologies,[3] which can be used to develop a front end for any programming language and a back end for any instruction set architecture. LLVM is designed around a language-independent intermediate representation that serves as a portable, high-level assembly language that can be optimized with a variety of transformations over multiple passes.

* it has debuggers, optimiser
* Java, haskell, swift, rust all are written using LLVM
* [LLVM Hello world program](https://github.com/dfellis/llvm-hello-world)
* **LLVM IR** RISC-like instruction set, strongly typed language

[how a code gets converted to machine code](https://www.youtube.com/watch?v=yOyaJXpAYZQ&t=2s)

```
sudo apt install -y llvm-8 \
llvm-8-doc llvm-8-examples \
llvm-8-runtime llvm-8-tools
```

* llvm-as
* `lli` - llvm interpreter
* `llc` - static compiler
* `opt` - optimiser
* Static code Analysis

llvm-ir
: Can write programs in IR
* Strongly types
* `%` Temporary Register
* `Backend` generate Assembly for target architecture from `IR`
* `Bitcode` `.bc` representaion



## Macros

* [Metaprogramming](https://en.wikipedia.org/wiki/Metaprogramming)
  * Metaprogramming is a programming technique in which computer programs have the ability to treat other programs as their data
* macros are expanded into source code that gets compiled with the rest of the program as abstract syntax trees
*[ write DSL Domain specific language like LISP](https://medium.com/@phoomparin/a-beginners-guide-to-rust-macros-5c75594498f1)
* comes in 3 forms
  * Function like `println!`
  * `#derive(Serialize)`
  * Attribute macro `#[wasm_bindgen]`
* **TokenStream** lexical foundation for all rust syntax

extern keyword
: The extern keyword is used in two places in Rust. One is in conjunction with the crate keyword to make your Rust code aware of other Rust crates in your project, i.e., extern crate lazy_static;. The other use is in foreign function interfaces (FFI).

## Questions

1. [how do you run a rust binary on other systems?](https://rust-lang-nursery.github.io/cli-wg/tutorial/packaging.html)
2. [Can I built a OS using rust?](https://www.redox-os.org/)

> Strive to write software that can survive in perpetuity


## Time to rewrite OS

> What is a Software? Can axel arounf your definition of s/w

* T-10 minutes away from exestiantial crisis
* And you realise that you know nothing that as if ancient SUmerians were running softwares!
* OS defines the livelyness of a machine, without it, no program can run
  * Asnchronous, interrupt driven program
* Includes
  * Kernel
  * Libraries
  * Compilers
  * Drivers
  * commands
  * deamons
  * facilities
* Second system Syndrome
* UNIX was originally written in Assembly language and later ported to `B` and `C`
* Why not write OS in ruby, python etc?
  * It it age appropriate
* Sophesticated garbage collection `GC`
  * Why are you writing garbage? GC hates you
  * Stop creating crap
  * in `JS` its easy to have an object graph (very connected), a `slosure` having a reference to this object graph, now none of this can go away
* Amazing time, when all the s/w is being written
* Once s/w runs it practically runs forever, as it solves a mathematical problem, it will outlive us
* Rust
  * Who owns what and when
  *  Give the superpower of GC collected lang, with the performance of manual memory management lang
     *  Wrong size b zeros
     *  mem copies that have wrong size on them
     *  Memory leaks and corruptions
  *  Compiler doesnt like to get Belligerent with you
* I am controlling heaven and earth on my software
* Rust allows you to Compose
  * you can write a memory leak free C, I can write a code in C, But interfacing both s/w could be problem
* C uses `AVL` trees, rust uses `B` trees, from databases
* Hygenic macros
* Characterstics of OS
  * It it fast and correct?
* Well, there is no memoery to run this program
  * well, then GO AND CREATE SOME, you are the OS
* Its humanity vs Firmware[^7], everybody have to pick a side
  * open Firmware written in rust would be a huge huge favor to humanity
  * we can use it deep in the stack
* Hybrid based approach, allowing C execution
* This is the formation of ancient Greek, rust is going to be forever, prediction

> I want to build permanent s/w that outlives me,
> not beacuse I lan to walk in the traffic tonight

* [How does a prograsaming languague works?](https://www.youtube.com/watch?v=QXjU9qTsYCc)
* CPU architecture matters for machine code, ISA
* CPUs also have bugs, why trust them? Intel CPU has bugs just as s/w do

## HIstory of Rust

* time divided into epochs
* Originally rust compiler was written in OCAML[^9], now its in rust itself
* Typesystem expoerts
* Instead of 1 person incharge to loosely 20,30 people in charge
* cargo build has debig flags, cargo release doesnt, but you can change it
* cargo figures out dependencies on dependencies and compilers the common ones (if exists)
* Use `x86` assembly functions as rust functions
* RFC federation management process, inspired from python PEP
* Game development, OS dev, web dev
  * `crates.io` is built into rust itself and uses 30 MB in memory
    * 25MB for ruby process then 200-200 MB for rails
* 6 week release period - very aggressive
* Always backward compatible unless, low level typesystem need to be modified

> We can change the world with code

## Errors

```
error: expected item, found keyword `let`
```
* let can only be used in a function


### Resources

* [Official Documentation](https://users.rust-lang.org/)


### Footnotes

[^1]: https://www.rust-lang.org/
[^2]: https://areweideyet.com/
[^3]: http://edunham.net/
[^4]: http://talks.edunham.net/
[^5]: https://github.com/rust-lang/rustlings/
[^6]: https://www.youtube.com/watch?v=HgtRAbE1nBM
[^7]: https://en.wikipedia.org/wiki/OpenBMC
[^8]: https://en.wikipedia.org/wiki/Systems_programming
[^9]: https://en.wikipedia.org/wiki/OCaml
[^10]: https://github.com/steveklabnik
[^11]: [Learn assembly instructions](https://godbolt.org/)
[^12]: [Assembly LLVM-IR for rust source code](https://github.com/gnzlbg/cargo-asm)
[^13]: https://www.youtube.com/watch?v=8M0QfLUDaaA
