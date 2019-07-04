---
categories:
- design
date: "2019-04-01T13:13:45+02:00"
revision: 0
series:
- edublog
tags:
- css
- preprocessor
- scss
title: Learning Sass Preprocessor
video: ""
---
:icons: font

Sass is an abbreviation for *S*yntactically *a*wesome *s*tyle*s*heets.
It makes css futireproof by adding a layer of programing constructs to css stylesheets.

== Installing
{{<highlight bash "style=friendly">}}
pacman -S ruby-sass
{{</highlight>}}

== Main Features

=== 1. variables
Consistent use of Reusable information in style-sheets.

For example, using main and sub fonts, colour etc.

{{<highlight sass "style=friendly">}}
$font-stack:    Helvetica, sans-serif
$primary-color: #333

body
  font: 100% $font-stack
  color: $primary-color
{{</highlight>}}

=== 2. Nesting
Provides HTML like css for nesting elements.

[WARNING]
====
Should not be overused. Be aware that overly nested rules
will result in over-qualified CSS that could prove
hard to maintain and is generally considered bad practice.
====

{{<highlight sass "style=friendly">}}
nav
  ul
    margin: 0
    padding: 0
    list-style: none

  li
    display: inline-block

  a
    display: block
    padding: 6px 12px
    text-decoration: none
{{</highlight>}}


=== 3. Partials
A partial is simply a Sass file named with a leading underscore.
You might name it something like `_partial.scss`.
The underscore lets Sass know that the file is only a partial file and
that it should not be generated into a CSS file.
Sass partials are used with the `@import` directive.

{{<highlight sass "style=friendly">}}
// _reset.sass partial
html,
body,
ul,
ol
  margin:  0
  padding: 0
{{</highlight>}}

=== 4. imports
 The only drawback is that each time you use @import in CSS it creates another
 HTTP request. Sass builds on top of the current CSS @import but instead of
 requiring an HTTP request, Sass will take the file that you want to import
 and combine it with the file you're importing into so you can serve a single
 CSS file to the web browser.

{{<highlight sass "style=friendly">}}
// base.sass
@import reset
body
  font: 100% Helvetica, sans-serif
  background-color: #efefef
{{</highlight>}}

=== 5. Extend/Inheritance
A `mixin` lets you make groups of CSS declarations that you want to reuse
throughout your site. You can even pass in values to make your mixin more
flexible. A good use of a mixin is for vendor prefixes

Using `@extend` lets you share a set of CSS properties from one selector to another.
It helps keep your Sass very DRY

{{<highlight sass "style=friendly">}}
{{</highlight>}}

=== 6. Operators
Operations in Sass let us do something like take pixel values and convert
them to percentages without much hassle.

{{<highlight sass "style=friendly">}}
.container
  width: 100%

article[role="main"]
  float: left
  width: 600px / 960px * 100%

aside[role="complementary"]
  float: right
  width: 300px / 960px * 100%
{{</highlight>}}

.Practical SaSS Examples
{{<highlight bash "style=friendly">}}
sass input.scss output.css

# watching entire directory
sass --watch app/sass:public/stylesheets
{{</highlight>}}


== Strategies for writing better code with Sass

Components are independent items that can be reused almost anywhere. There can
be small, presentational components, such as a “Button”, “Input” or bigger
“organisms,” such as “Article.” The key point is to make them independent:
you should not create page or content-specific modules.

For a file structure, it’s recommended you create one file per component.
It might look odd at first, but it helps you find what you’re looking for much faster.
Treat it like a class in OOP programming

image::Sass-components.png[sass components]


[bibliography]
== References

. https://sass-lang.com/guide
. https://www.devbridge.com/articles/7-sass-techniques-to-help-you-write-better-code/
. http://thesassway.com/beginner/how-to-structure-a-sass-project
