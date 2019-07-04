---
categories:
- deployment
date: "2019-02-15T00:37:02+01:00"
revision: 0
series:
- edublog
tags:
- dns
- godaddy
title: How to set up DNS for Netlify on Godaddy
video: ""
---

Easy way to setup and configure DNS on godaddy to be used by netlify for custome domain
setting.

1. Once your website is deployed and ready on netlify, copy the name netlify server name
(url where it is hosted by netlify). It should be something like `youthful-villani-10bc56.netlify.com`
2. Log in and open godaddy console -> Manage DNS for your selection and then add the following **A** and
**CNAME** records

```
Type	Name	Value
A       @      104.198.14.52
CNAME	www    youthful-villani-10bc56.netlify.com
```
3. Go back to netlify console -> Domain Setting, and then add you domain name to *custome domain*

Save everything and wait for changes to reflect. You are done!

Enjoy your new website
