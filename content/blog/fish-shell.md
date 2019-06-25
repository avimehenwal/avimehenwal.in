---
title         : "Fish Shell"
date          : 2019-06-24T23:00:50+02:00
series     : [myLearning]
categories    : [Programming]
tags          : [shell, fish]
tags       : []

revision   : 0
weight        : 5
---

### How to test if a variable (env) is set or not [^1]

1. `set -q var` (note the missing "$" - this uses the variable name) can be used to check if a variable has been set.
2. `set -q var[1]` can be used to check whether the first element of a variable has been assigned (i.e. whether it is non-empty as a list).
3. use [fish test function](http://fishshell.com/docs/current/commands.html#test)
   1. When using a variable as an argument for a test operator you should almost always enclose it in double-quotes[^2].



## Footnotes

[^1]: https://stackoverflow.com/questions/47743015/fish-shell-how-to-check-if-a-variable-is-set-empty
[^2]: http://fishshell.com/docs/current/commands.html#test
[^3]: 
[^4]: 
[^5]: 
