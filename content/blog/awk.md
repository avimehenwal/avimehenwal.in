---
categories:
- development
date: "2019-06-23T17:18:11+02:00"
revision: 0
series:
- edublog
tags:
- shell
title: Awk
video: ""
---

* in 1970's
* Scripting languague to do quick and dirty tasks like counting and reporting from files.
* `awk` is superset of `grep`
  * shorter and better than writing python script
* Interpreted Language

Timeline | History of `awk` development
:========|==============================================================
1969 | ED (editor) Ken Thompson, sucessor of **QED**
1973 | Pipe `|` command, Thompson liberated `grep` from ED regex library
1973 | `YACC` spurs the tradition of creating new little languages
1974 | created `sed`
1975 | LEX
1977 | Using LEX and YACC, wrote grammer for awk
1985 | New AWK with user defined functions. Maintained by [Brian Kernighan](https://en.wikipedia.org/wiki/Brian_Kernighan)
1991 | POSIX was standardised

* Generate body of `html` pages (image gallery) from `awk`
* Regex match, filter on column values
* PERL is heavily influenced by awk

> "MS-DOS was a pretty pathetic operating system"
> Microsoft has left the chat

* A lovestory

> AWK is a domain-specific language designed for text processing and typically used as a **data extraction** and **reporting tool**

1. Variable which defines values which can be changed such as field separator and record separator.
2. Variable which can be used for processing and reports such as Number of records, number of fields.
3. pattern scanning and processing language


awk variable | Description
--- | ---
FS  | Field seperator
OFS | Output field seperator
RS  | Record Seperator
ORS | Output Record Seperator
NR  | Number of Records
NF  | Number of Fields
FILENAME    | current filename

```
awk 'BEGIN{RS="\n";FS=","; \
        print"@ Additions,Deletions"} { \
        if($2=="")print$1" 0,0,0"; \
        else if($3=="")print$0",0"; \
        else print$0}'
```

## Structure

```
BEGINE {}
CONDITIONS {ACTION1}
           {ACTION2}
END {}
```

## Tasks we can accomplish with awk scripting

1. Report only on required info like IP addr from `ip a` output
2. Print output in tabular format

{{< code numbered="true" >}}
mount | awk '{[[[printf]]] "[[[%-20s]]]%-30s[[[|]]]%20s[[[\n]]]",$1,$3,$5}'
{{< /code >}}

1. `printf` instead of `print`
2. left alignment
3. column seperator (optional)
4. Next line - important

<iframe width="560" height="315" src="https://www.youtube.com/embed/IfhMUed9RSE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
