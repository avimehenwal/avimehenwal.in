---
title      : "CMake build tool"
date       : 2020-01-21T08:58:16Z
publishdate: 2020-01-21T08:58:16Z
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
- development
- deployment
tags:
- C
- build
---

## CMake

* cross platform build environment[^1]
* software build process using **compiler independent** methods
* It is used in conjunction with native build environments such as 
  * `Make`, `Qt Creator`, `Ninja`, `Apple's Xcode`, and `Microsoft Visual Studio`
* Depends on `C++ compiler`
* The ability to build a directory tree outside the source tree is a key feature
* can handle in-place and out-of-place builds
* The build process with CMake takes place in two stages
  * First, standard build files are created from configuration files.
  * Then the platform's native build tools are used for the actual building
* `CMakeLists.txt`[^2]

{{% note %}}
cmake QT applications
{{% /note %}}

## CMake Language

* Variables - decleraing, initialization, printing values
* Conditionals
* Loops
* fucntions and macros
* Include other scripts
* Properties to <TARGETS>
* 

## CPack

* PAckaging sysyem for system distribution
* package to `rpm`, deb, gzip for both binary and source code

## Debugging CMake


### Footnotes

[^1]: https://gitlab.kitware.com/cmake/cmake
[^2]: https://gitlab.kitware.com/cmake/community/-/wikis/FAQ#general-information-and-availability
