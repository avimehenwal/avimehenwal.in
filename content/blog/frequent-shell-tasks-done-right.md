---
title      : "Frequent Shell Tasks Done Right"
date       : 2019-07-13T10:06:04+02:00
comments: false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- deployment
tags:
- linux
- tar
---

## tar use-case

> Extract packages directly to `/.local/bin` and stop polluting `$PATH` environment
> variable everytime you install something new

### Installing go

```
tar -C /usr/local -xzf go1.12.7.linux-amd64.tar.gz
```

{{% note %}}
Following tar command will not affect the other files (if already present in directory).
New file like inside `bin` would be places alongside existing files.
{{% /note %}}

### Installing node + npm

{{< code numbered="true" >}}
tar \
    --interactive \
    [[[--verbose]]]
    [[[--extract]]] \
    [[[--directory=/home/avi/.local/]]] \
    [[[--strip-components=1]]] \
    [[[--file=node-v10.16.0-linux-x64.tar.xz]]]
    --list
{{< /code >}}

1. print output, avoid this if you like quiet mode
2. extract `tar.xz` archive bundle
3. `cd` to this directory before extracting archive file
4. Avoid creating top-level directory with the same name as archive ball
5. location of *file* to extract

### Footnotes

[^1]:
[^2]:
