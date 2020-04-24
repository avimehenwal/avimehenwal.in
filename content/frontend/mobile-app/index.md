---
title      : "Mobile Development"
date       : 2020-03-23T14:03:15Z
publishdate: 2020-03-23T14:03:15Z
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Frontend
categories:
- programming
- design
- deployment
- development
tags:
- mobile
- android
- ios
- crossplatform
---

markup language
: that uses `tags`

> [Why is Instagram sucha a hit?](https://www.google.com/search?q=why+is+instagram+such+a+hit&oq=why+is+instagram+such+a+hit)

* [x] Authorization and Authentication, Accounting AAA
* [x] Editable profile page
* [x] DM and message passing
* [x] Push Notifications
* [x] Uploading pictures
* [x] Filters
* [x] Image tools - cropping, rotating, translation, tagging
* [x] Geolocation
* [x] Share post on other social media
* [x] Search Options
* [x] Analytics

## How to make a Mobile App? Mobile Developer?

* Use a framework to build app for both iOS and Android
* [Vue Native](https://vue-native.io/)
  * Wrapper which compiles to React Native
  * It is used to develop applications for Android, iOS, Web and UWP (Universal Windows Platform)
* [Nativescript](https://www.nativescript.org/)
* Install android SDK `sudo android update sdk -u`
* Install android studio
* Mobile developers have to worry about additional things like
  * Android back button
  * Up action bar buttons

```sh
apt-get install libatk-adaptor libgail-common

```

## Mobile Development Frameworks

> None of them uses Java (android) or Swift (iOS), crossplatform development.
> Compiles framework code to native Java/Swift code

1. Reactive Native
   1. `react` language
2. [Flutter]
   1. `dart` language
   2. compiled down to ARM C/C++ Library
3. NativeScript
   1. `vanilla js` and `typescript`
4. Ionic
   1. uses `javascrip`
   2. Build normal webApp

{{% note %}}
Write once (codebase) use everywhere (android, iOS)
{{% /note %}}

* Airbnb stopped using react-native
* Alibaba and google are using [Flutter]
*

## Nativescript

> Vue Native is a framework to build cross platform native mobile apps using JavaScript

* Buttersmooth animations
* Nativescript markup will look little different from that of web development
* web app and mobile app

## Nativescript-vue

> NativeScript-Vue is a NativeScript plugin which allows you to use Vue.js to craft your mobile application.

* Code sharing App b/w mobile and web
* Bootstraping the vue instance little differently
* Build app using vue, angular or plain JS code
* Code scaffolding with router and vuex
* 2 main.js file, webpack will pick right one depending on build
  * main.ja for
  * main.native.js
  * due to different strategies, as mobile has no DOM
* 2 templates - template web/native
  * Completely differne experience for ios and android or same
* Standard router is not supported in native vie app
* [Reactnative or vue-native](https://stackoverflow.com/questions/53867122/which-is-better-vue-native-or-nativescript-vue)
* [Cannot use vuetify (DOM based) on native script](https://stackoverflow.com/questions/58962933/can-i-use-vuetify-in-nativescript-vue)
* js upto 2 decimal point `.toFixed()`
* Use pretty filters to format date-time using moment.js

```sh
npm install -g nativescript
nativescript --help
tns help
tnf create --template nativescript-vue-template ns-project-name
tns create HelloWorld --template tns-template-blank
tns create ns-hello-world
# choose from angularJs, VueJs, normal JS
tns run ios / tns preview

```

## Mobile Web vs mobile Apps?

1. Apps can use device capabilities like camera, sound, sensor data etc
2. Apps could generate revenue via [playstore] and [appstore]


## Engaging mobile applications

> Framework for building cross-platform mobile apps

* Built using `javascript` to languages which tranpiles to js like `typescript`
* Can use `npm` packages
* Similar to react-native except we get to code in js instead of react
* Why use vue to build mobile apps?
  * Adoption of virtual DOM enables native mobile rendering
  * its lightweight
  * Nativescript and vue have great **code-sharing** potential
    * can share upto 70% of code
* NS is a custom implementation of vue, there are some differences
  * `import vue from 'nativescript-vue'`
  * Bootstaap differently from a vue web app
  * NS have different markup layout than vuetify
    * templates are different
* `tns` commands
  * will instal ios and andriods packages
  * search for emulators
  * router is a big problems when vuilding for mobiles
* Firebase Authentication, and firebase backend
* How to deploy to AppStore, Playstore, what funny stuff you got to do for this?
  * Grab `apk` compiled by NS, post it to AppScript
  * Sidekick Tooling - build for iOS in cloud then deploy to store
* Should we use NS to build PWA?

{{% note %}}
WebApps --  ResponsiveApps --  PWA -- Mobile Native Apps
{{% /note %}}

## Resources

* https://medium.com/learning-lab/lessons-learned-on-writing-apps-with-nativescript-vuejs-bd6a3066f0cb
* [Android studio EMulator](https://developer.android.com/studio/run/emulator)
* https://github.com/nativescript-vue/nativescript-vue-multi-drawer
* https://github.com/jlooper/mixology-mobile
* https://github.com/jlooper/mandala-me
* https://github.com/EddyVerbruggen/nativescript-plugin-firebase


### Footnotes

[^1]:
[^2]:


[wiki]: https://en.wikipedia.org/wiki/NativeScript
[appstore]: https://www.apple.com/ios/app-store/
[playstore]: https://play.google.com/store
[Flutter]: https://en.wikipedia.org/wiki/Flutter_(software)
