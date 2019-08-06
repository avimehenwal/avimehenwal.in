---
title      : "{{ replace .TranslationBaseName "-" " " | title }}"
date       : {{ .Date }}
publishdate: {{ ((.Date | time ).AddDate 0 0 1).Format "2006-01-02T15:04:05Z07:00"}}
expirydate : {{ ((.Date | time ).AddDate 0 0 15).Format "2006-01-02T15:04:05Z07:00"}}
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
- Test
- DailyLogs
categories:
- programming
- design
- deployment
- development
tags:
---

tl;dr
<!-- more -->


### Footnotes

[^1]:
[^2]:
