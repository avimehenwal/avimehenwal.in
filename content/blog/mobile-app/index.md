---
title      : "Mobile Development"
date       : 2020-03-23T14:03:15Z
publishdate: 2020-03-23T14:03:15Z
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
- mobile
- android
- ios
---

markup language
: that uses `tags`

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

> Vue Native is a framework to build cross platform native mobile apps using JavaScript

## Nativescript

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
2.

## Resources

* https://medium.com/learning-lab/lessons-learned-on-writing-apps-with-nativescript-vuejs-bd6a3066f0cb
* [Android studio EMulator](https://developer.android.com/studio/run/emulator)
* https://github.com/nativescript-vue/nativescript-vue-multi-drawer
* https://github.com/jlooper/mixology-mobile
* https://github.com/jlooper/mandala-me


### Footnotes

[^1]:
[^2]:
