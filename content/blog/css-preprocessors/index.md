---
title       : "Css preprocessors"
date        : 2019-04-01T12:01:06+02:00
video       : ""
categories  : [design]
series      : [edublog]
tags        : ["css", "preprocessor"]
revision    : 0
---
:icons: font


CSS Preprocessors are programs which lets you generate CSS from its own syntax (could be css styles
curly braces or indented or both).
They provide programming constructs and some features that don't exist
in pure CSS, such as mixin, variables, conditional and repetitive blocks, functions, nesting selector, inheritance selector, and so on.

""
Your CSS is a mess
""

Why use them in first place?::
- to make css code readable and
- maintainable for future using programmable constructs and re-usability DRY principle.
Brings raw CSS close to programming Css

""
DRY KISS - keep it simple silly and straightforward
""

What can css preprocessors do? Their main Features::

. *imports* collect multiple _links_ into one css files. saves browser collecting
resources from multiple sources. Once loaded, its caches in browser.
. *nesting* to make code more modular
. Functions and mixins
. Variables
. Partials and css code modularity
. Scss lint

.Popular preprocessors
- Saas
- LeSS
- Stylus

|===
| Saas | Less
| mature and 12 years old |
| completely compatible with all versions of CSS. |
| Ruby | Javascript |
|===

== How does SaSS integrate with hugo SSG?
Hugo will take care of bundling, minifying, fingerprinting our assets and even
compiling our sass files! All of this without any external build tools.

`Fingerprint` will update your resource’s .Permalink with a sha256 hash (or md5 or sha512 if passed as argument).

{{<highlight html "style=friendly">}}
{{ $style := resources.Get "sass/main.scss" | toCSS | postCSS | minify | fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}" emotion="🤩">
{{</highlight>}}

Hugo Asset Management using hugo Pipes.
https://gohugo.io/hugo-pipes/scss-sass/#readout

=== Hugo pipes
One of the most powerful components of Go Templates is the ability to stack actions one after another. This is done by using pipes. Borrowed from Unix pipes, the concept is simple: each pipeline’s output becomes the input of the following pipe.

Because of the very simple syntax of Go Templates, the pipe is essential to being able to chain together function calls. One limitation of the pipes is that they can only work with a single value and that value becomes the last parameter of the next pipeline.

A few simple examples should help convey how to use the pipe.

.Hugo Pipes
----
{{ $style := resources.Get "sass/main.scss" | resources.ToCSS | resources.Minify | resources.Fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">
----

.Resource Minify
----
{{ $css := resources.Get "css/main.css" }}
{{ $style := $css | resources.Minify }}
----

[bibliography]
== References

. https://csspre.com/compare/
. https://gohugo.io/hugo-pipes/introduction/
. https://regisphilibert.com/blog/2018/07/hugo-pipes-and-asset-processing-pipeline/
. https://github.com/regisphilibert/rp_hugo_theme
