---
title      : "Nuxt JS"
date       : 2020-03-28T13:54:38Z
publishdate: 2020-03-28T13:54:38Z
draft      : false
comments   : false
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

## Thing you should know

1. Add router links and dynamic links
2. SEO meta tags to SPA
3. Page navigation transitions
4. i18n localization and globalization
5. Code splitting

## Which problems does nuxt solves?

1. SEO optimization for SPA
2. Auto route creation as of new files addition under `/pages`
3. project structure management
4. can generate both static and dynamic websites with nuxt
5. static `generator`

```sh
npm i npx
npx create-nuxt-app <project-name>
npm install --save nuxt
yarn server --open
npm install --save-dev babel-eslint eslint eslint-config-prettier eslint-loader eslint-plugin-vue eslint-plugin-prettier prettier


```

{{< code numbered="true" >}}
axios.get([[[`http://someurl.com/${this.$route.params.id}`]]], config)
{{< /code >}}

1. Use backticks if you want to use variables in template

## How is it different from vuejs?

### Footnotes

* https://github.com/nuxt-community/awesome-nuxt
* https://github.com/search?q=nuxt+vuetify
* https://github.com/bradtraversy/nuxt_dadjokes
