---
title: Fish Shell
date: "2019-06-24T23:00:50+02:00"
weight: 5
revision: 0
series:
- myLearning
categories:
- Programming
tags:
- fish
- eval
---

### How to test if a variable (env) is set or not [^1]

1. `set -q var` (note the missing "$" - this uses the variable name) can be used to check if a variable has been set.
2. `set -q var[1]` can be used to check whether the first element of a variable has been assigned (i.e. whether it is non-empty as a list).
3. use [fish test function](http://fishshell.com/docs/current/commands.html#test)
   1. When using a variable as an argument for a test operator you should almost always enclose it in double-quotes[^2].

## Input/Output (IO) redirection 

FD
: file descriptors

The reason for providing for two output file descriptors is to allow separation of errors and warnings from regular program output.

IO stream | Symbol
:--------:|:------:
stdinput | <0
stdout | 1>
stderr | 2>

To not overwrite <mark>clobber</mark> an existing file, write `>?DESTINATION` or
`2>?DESTINATION`

{{% note %}}
    Any file descriptor can be directed to a different output than its default through a simple mechanism called a redirection.
{{% /note %}}

{{< code numbered="true" >}}
    # >&2 redirection shortcut for [[[1>&2]]].
    date [[[1>]]][[[&2]]]
{{< /code >}}

1. redirect stdout (1) to referenced file descriptor (&) stderr (2)
2. stdout redirection
3. stderr redirection to referenced file descriptor

### How to set terminal text color?

[set_color](https://fishshell.com/docs/current/commands.html#set_color)

[fish shell webUI](https://mvolkmann.github.io/fish-article/#ConfigurationViaWebUi)

## How to run a string

use `eval`

## Fish scripting patterns

* variables scopes `set` vs `set -l` and accessibility
* How to use colors in terminal text
* conditional if a variable is set
* conditional test `-gt`
* Append to an array
* previous command `echo $status` code
* tee /dev/tty
* `and` and `or` operator in if conditions using `begin-end` syntax

## Footnotes

[^1]: https://stackoverflow.com/questions/47743015/fish-shell-how-to-check-if-a-variable-is-set-empty
[^2]: http://fishshell.com/docs/current/commands.html#test
[^4]: 
[^5]: 
