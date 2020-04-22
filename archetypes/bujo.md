---
title      : "{{ replace .TranslationBaseName "-" " " | title }}"
date       : {{ .Date }}
publishdate: {{ ((.Date | time ).AddDate 0 0 1).Format "2006-01-02T15:04:05Z07:00"}}
expirydate : {{ ((.Date | time ).AddDate 0 0 15).Format "2006-01-02T15:04:05Z07:00"}}
comments: true
revision: 0
weight: 5
series:
- DailyLogs
categories:
- frontend
- history
tags:
---




### Footnotes

[^1]:
[^2]:
