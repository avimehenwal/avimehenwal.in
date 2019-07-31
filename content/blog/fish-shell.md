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

process substitution
: is a form of *inter-process communication* that allows the input or output of a command to appear as a *file*.
* The command is substituted in-line, where a file name would normally occur, by the command shell.

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

## What happen when you start the shell

1. loads configuration
   1. system wide `/etc/fish/config.fish`
   2. user specific `$HOME/.config/config.fish`
2. prepares and makes available all Environment variables. *unlike other shells* no subshells[^3]
3. useful command-line parameters for fish, aka **subshell** in other shells
   1. `--inint-command=USR_CMD`
   2. `--command=USR_CMD`
4. shell function to [fish escape characters](https://fishshell.com/docs/current/index.html#escapes) `bind`
   1. there are special bind functions available
   2. `fish_key_reader` to stdout input received by terminal

```
# sane navigation
echo $dirprev; echo $dirnext;
prevd --list <index>

fish_key_reader --continuous
bind \e prevd
bind \c] nextd

# list of all bind functions
bind --function-names
```

Keybinding | fish escape sequence
:---------:|------------------
<kbd>ALT</kbd> + <kbd>w</kbd> | \ew
<kbd>CTRL</kbd> + <kbd>x</kbd> | \cx

{{% note %}}
    Note that Alt-based key bindings are case sensitive and Control-based
    key bindings are not. This is a constraint of text-based terminals,
    not fish.<br>

    Every program on your computer can be used as a command in fish
{{% /note %}}

### the default keybinding

{{% cmd %}}
   bind '' self-insert
{{% /cmd %}}

> reading user inputs and then check then with switch structure

```
read line1
read --prompt-str='Enter line2 : ' line2
echo $line1 then $line2
```

### Completion and shell suggestions

avoid running dangerous commands
dont have to look at man pages or help again and again,
all at the ease of <kbd>TAB</kbd> key

- [git complition](https://github.com/junchunx/myfish/blob/master/.config/fish/completions/git.fish)
- Look for fish completion search path from `fish_complete_path` variable

{{% note %}}
    fish can autogenerate completion commands from man pages (if provided)
    `$HOME/.local/share/fish/generated_completions`
{{% /note %}}

> How to write personal man page and install it on any linux system?

- [linux-unix-creating-a-manpage](https://www.cyberciti.biz/faq/linux-unix-creating-a-manpage/)
- ToDo - add completion for [bat](https://github.com/sharkdp/bat)

command substitution
: The output of a series of commands can be used as the parameters to another command

piping
: stdout of a program is used as stdin for other

brace expansion
: mv *.{c,h} src/
echo {good,bad}" apples"

process expansion
: echo %self

Command substitutions
Variable expansions
Bracket expansion
Pid expansion
Wildcard expansion

### Variable expansion

however, an important difference in how variables are expanded when quoted and when unquoted. An unquoted variable expansion will result in a variable number of arguments. For example, if the variable $foo has zero elements or is undefined, the argument $foo will expand to zero elements. If the variable $foo is an array of five elements, the argument $foo will expand to five elements. When quoted, like "$foo", a variable expansion will always result in exactly one argument.

## Debugging

- `breakpoint`
-

set -l foo
begin
    set -l foo
end
will create a second version of $foo inside that block, and return to the other once the block ends.

So, what you need to do is to define it outside of the block and then just change it inside:

## How to upgrade fish shell

```
sudo apt-get install --only-upgrade fish
```

### Update fish completions from MAN pages

```
fish_update_completions
```

## Footnotes

[^1]: https://stackoverflow.com/questions/47743015/fish-shell-how-to-check-if-a-variable-is-set-empty
[^2]: http://fishshell.com/docs/current/commands.html#test
[^3]: [wiki, friendly interactive shell](https://en.wikipedia.org/wiki/Friendly_interactive_shell)