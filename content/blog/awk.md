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
2. 