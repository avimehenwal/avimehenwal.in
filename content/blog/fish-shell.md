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
* `echo (cat README.md | psub)`

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

So there are three options:

```
Command Substitution: $(...)
Process Substitution: <(...)
zsh-Flavored Process Substitution: =(...)
```

* [File Descriptor in fish](https://github.com/fish-shell/fish-shell/issues/1586) 

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

<pre><span style="background-color:#3465A4"><font color="#2E3436"> ~/D/P/avimehenwal.in </font></span><span style="background-color:#C4A000"><font color="#3465A4"> </font></span><span style="background-color:#C4A000"><font color="#2E3436"> master ± </font></span><font color="#C4A000"> </font><font color="#4E9A06">echo</font> <font color="#FCE94F">%</font><font color="#06989A">chrome</font>                                                                                                                                         <font color="#3465A4"></font><span style="background-color:#3465A4"><font color="#2E3436"> I </font></span>
1424 2579 2607 24354 24363 24374 24404 24409 24631 24738 24791 25016 25067 25076 25093 25105 25120 25520 25610 25652 25908 26961 29077 29097 29109 29126 29154 29173 29186 29210 29227 29250 29280 29296 29313 29333 29349 29365 29387 29402 29421 29438 29455 29477 29489 29503 29517 29541 29559 29584 29598 29612 29775 29787 29799 29813 29842 29857 29879 29901 29918 29931 29949 29971 29991 30003 30020 30040 30065 30077 30092 31487 31509 31562
<span style="background-color:#3465A4"><font color="#2E3436"> ~/D/P/avimehenwal.in </font></span><span style="background-color:#C4A000"><font color="#3465A4"> </font></span><span style="background-color:#C4A000"><font color="#2E3436"> master ± </font></span><font color="#C4A000"> </font><font color="#4E9A06">echo</font> <font color="#FCE94F">%</font><font color="#06989A">python3</font>                                                                                                                                        <font color="#3465A4"></font><span style="background-color:#3465A4"><font color="#2E3436"> I </font></span>
754 23757
<span style="background-color:#3465A4"><font color="#2E3436"> ~/D/P/avimehenwal.in </font></span><span style="background-color:#C4A000"><font color="#3465A4"> </font></span><span style="background-color:#C4A000"><font color="#2E3436"> master ± </font></span><font color="#C4A000"> </font><font color="#4E9A06">echo</font> <font color="#FCE94F">%</font><font color="#06989A">python</font>                                                                                                                                         <font color="#3465A4"></font><span style="background-color:#3465A4"><font color="#2E3436"> I </font></span>
754 23757
<span style="background-color:#3465A4"><font color="#2E3436"> ~/D/P/avimehenwal.in </font></span><span style="background-color:#C4A000"><font color="#3465A4"> </font></span><span style="background-color:#C4A000"><font color="#2E3436"> master ± </font></span><font color="#C4A000"> </font><font color="#4E9A06">echo</font> <font color="#FCE94F">%</font><font color="#06989A">code</font>                                                                                                                                           <font color="#3465A4"></font><span style="background-color:#3465A4"><font color="#2E3436"> I </font></span>
28079 28082 28110 28123 28285 28286 28316 28402 28595 28621 28622 28652 28831
<span style="background-color:#3465A4"><font color="#2E3436"> ~/D/P/avimehenwal.in </font></span><span style="background-color:#C4A000"><font color="#3465A4"> </font></span><span style="background-color:#C4A000"><font color="#2E3436"> master ± </font></span><font color="#C4A000"> </font>                                                                                                                                                     <font color="#3465A4"></font><span style="background-color:#3465A4"><font color="#2E3436"> I </font></span></pre>

* Command substitutions
* Variable expansions
* Process Expansion
* Bracket expansion
* Pid expansion
* Wildcard expansion

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

#### How to test files and directories in fish shell?

use fish `test` operator

```
if test -e /path/filename
    echo "File exists"
end

if test -d /directory/
    echo "Directory exists"
end

```

#### how to set environment variables in fish shell?

```
set --[global|local|universal] --export/x <variable_name>
```
$LINES
: number of lines (or rows) in the current terminal

## Fonts and Typography

* [Nerd Fonts 4.1GB](https://github.com/haasosaurus/nerd-fonts/tree/regen-mono-font-fix)
* font with powerline glyphs and zsh/bash/fish theme
* [Fonts](https://en.wikipedia.org/wiki/Font)
* `fc-cache -vf ~/.local/share/fonts/`
* `sudo apt install -y fontforge fontforge-doc/rolling fontforge-extras/rolling python-fontforge/rolling`
* [UTF-chars File](https://www.cl.cam.ac.uk/~mgk25/ucs/examples/)

```
fc-list | grep -i Hack
sudo apt install -y fonts-hack-ttf
echo $TERM $LANG
echo -e '\xe2\x82\xac'  # print euro sign
locale charmap          # ISO-8859-1

wget https://www.cl.cam.ac.uk/~mgk25/ucs/examples/TeX.txt; and cat

```

## Footnotes

[^1]: https://stackoverflow.com/questions/47743015/fish-shell-how-to-check-if-a-variable-is-set-empty
[^2]: http://fishshell.com/docs/current/commands.html#test
[^3]: [wiki, friendly interactive shell](https://en.wikipedia.org/wiki/Friendly_interactive_shell)