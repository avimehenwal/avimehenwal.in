---
title      : "Website Performance"
date       : 2020-04-23T02:24:33Z
publishdate: 2020-04-23T02:24:33Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Frontend
categories:
- analysis
tags:
- web
- performance
---

> Measure, optimize and Monitor our site sspeeds like PROs

## Website Performance Blueprint

> Performance sites are Profitable sites

{{% warning %}}
Performance is **3X** times more important than how site looks like
{{% /warning %}}

1. How are we doing currently?
   1. [Google PageSpeed Insight webApp][pagespeed]
      1. Server side
      2. Same score as lighthouse
      3. weighted performance metrics
      4. Field + Lab Data
   2. Google Chrome devtools **Audits**, **Perfromace** tabs
      1. client side
      2. Audits uses lighthouse
2. Track your Field Data Overtime
   1. Use google Data Studio to collect the data
   2. Chrome User Experience Report [**CrUX** Dashboard][crux]
3. Understanding User Experience
4. Automate performance reporting for production
   1. Tools built over lighthouse engine
5. Compare perfromance with your competitors
   1. Build and share new CrUX recipies
6. Track and compare critical revenue generating pages
7. Solving 3rd party problems
8. Implement Performance Measurements in CI
   1. How every change you make, makes an impact on performance
   2. Lighthouse CI

{{% warning %}}
Firebase performance is different from Google Analytics
{{% /warning %}}

> Medium has such terrible page performance


### Footnotes

[^1]:
[^2]:


### Resources

* https://web.dev/
* https://www.thirdpartyweb.today/
* https://requestmap.webperf.tools/
* https://youtu.be/mLjxXPHuIJo
* https://web.dev/chrome-ux-report-data-studio-dashboard/
* https://developers.google.com/datastudio/connector/
* https://github.com/googledatastudio/community-connectors/tree/master/chrome-ux-report

[pagespeed]: https://developers.google.com/speed/pagespeed/insights/
[crux]: https://developers.google.com/web/tools/chrome-user-experience-report/