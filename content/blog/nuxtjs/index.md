---
title      : "Nuxt JS"
date       : 2020-03-28T13:54:38Z
publishdate: 2020-03-28T13:54:38Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- myLearning
categories:
- frontend
- development
tags:
---

> progressive framework based on Vue.js to create modern web applications. It is based on Vue.js official libraries (vue, vue-router and vuex) and powerful development tools (webpack, Babel and PostCSS).

{{% note %}}
Framework for framework ... wierd right?
{{% /note %}}

## What is NUXT?

* server side rendering SSR framework
* Understand directory structure
* Middleware -> access vuestore, fn before rendering a pages
* Pages -> router
* assets -> SASS
* `fetch` is replaced with [Anonymous middleware](https://nuxtjs.org/api/pages-middleware#anonymous-middleware)

{{% fileTree %}}
* Frontend Application
  * Server side Renderign SSR vs Client side Rendering CSR
  * asyncData (SSR) vs data (CSR)
  * Use proxy URLs to fix CORS errors
{{% /fileTree %}}

## Thing you should know

1. Add router links and dynamic links
2. SEO meta tags to SPA
3. Page navigation transitions
4. i18n localization and globalization
5. Code splitting
6. `universal` Vue based websites, meaning you can build a fully static, SEO-ready, websites using all the features of Vue.js in terms of modern user experience.
7. `asyncData` is called every time before loading the page component.
   1. It will be called server-side once (on the first request to the Nuxt app) and client-side when navigating to further routes.
   2. This method receives the context as the first argument
8. [Nuxt axios integration](https://axios.nuxtjs.org/setup.html#install)
9. [ ] Able to modify head [title and SEO tags per page, external links and scripts](https://nuxtjs.org/faq/)
10. [ ] [How OAUTH works with nUXT](https://auth.nuxtjs.org/)
    1.  [ ] Restrict page access based on user login/logout state and scope
    2.  [ ] Navigation Guards
11. [ ] How to read/write a cookie value
12. [ ] Add access_token from cookie to axios request as bearer
13. [ ] [Add Bearer token to axios](https://axios.nuxtjs.org/helpers.html#settoken)
14. [ ] [Querystring with axios](https://github.com/nuxt-community/axios-module/issues/97)
15. [ ] [Accessing getters from modules](https://forum.vuejs.org/t/vuex-namespace-getters-accessing-across-modules/25474/12)
16. [ ] [Difference between Asyncdata vs Fetch](https://stackoverflow.com/questions/49251437/difference-between-asyncdata-vs-fetch)
17. [ ] Load data from API before page is rendered
18. [ ] Nuxt Modules - globally available
19. [ ] [Getters with Arguments?](https://stackoverflow.com/questions/41503527/vuexjs-getter-with-argument)
20. [ ] Google Analytics
21. [ ] [Other useful Modules](https://www.telerik.com/blogs/20-nuxt-modules-with-tips-to-increase-productivity-build-web-apps-faster)

## Which problems does nuxt solves?

1. SEO optimization for SPA, SEO friendly
2. Auto route creation as of new files addition under `/pages`
3. standard project structure management
4. can generate both static and dynamic websites with nuxt
   1. static `generator`
5. Optimization for speed


```sh
npm i npx
npx create-nuxt-app <project-name>
npm install --save nuxt
yarn server --open
npm install --save-dev babel-eslint eslint eslint-config-prettier eslint-loader eslint-plugin-vue eslint-plugin-prettier prettier

npm run build
npm run generate
```

{{< code numbered="true" >}}
axios.get([[[`http://someurl.com/${this.$route.params.id}`]]], config)
{{< /code >}}

1. Use backticks if you want to use variables in template

## How is it different from vuejs?

## NUXT Framework

* SEO Advantages - custom `heads`, prebuild standard directory structure
  * `hid: description` to avoid duplicated `meta` tags
  * [vue-meta](https://vue-meta.nuxtjs.org/api/#plugin-properties) for supported SEO properties
* Less work managing routes
* Universal Mode
  * Load the page after disabling javascript from browser
  * On each route, app loades route specific JS, CSS and component (HTML) files
* Prefetching
  * prefetch `js` before clicked
* vuex store
  * return an anonymous function

### Footnotes

* https://github.com/nuxt-community/awesome-nuxt
* https://github.com/search?q=nuxt+vuetify
* https://github.com/bradtraversy/nuxt_dadjokes
* https://fabiofranchino.com/blog/how-to-create-a-nuxt-based-blog-markdown-driven-from-scratch/
* https://github.com/topics/nuxt-template
* [SVG Footer in vue blog](https://github.com/Gomah/bluise)
* https://akunyi.com/category
* https://marinaaisa.com/
