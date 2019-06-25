---
title       : "How to configure Netlify for hugo projects using asciidoctor as external format parser"
date        : 2019-03-31T18:22:26+02:00
video       : ""
categories  : [deployment]
series      : [edublog]
tags        : ["netlify", "hugo", "asciidoctor"]
revision    : 0
---
:icons: font

== What is the difference between asciidoctor and asciidoc?

.Asciidoc and asciidoctor comparision
|===
|Comparision |Asciidoc |Asciidoctor
|human-readable document format. aka. *markup-format*. Specification using plain text conventions. | |
|Implementation |written in python. |written in Ruby
|Released time | 16 years | 6 years
|===

== Why use such a tool in the first place.
Articles, notes, blogs, books, man-pages and documentation could be written in asciidoc format.
Once written the content could easily be converted to formats including HTML, PDF, EPUB, DocBook and man page.
Hence supports portability of available formats.

== How to use asciidoc or asciidoctor as content parser instead of blackfriday?
Hugo automatically chooses the content parser based on file extension. For example,
<filename>.md -> blackfriday and for <filename>.adoc -> asciidoctor.

== How is it different from existing markdown syntax?
https://asciidoctor.org/docs/asciidoc-vs-markdown/

TIP: for external content parsers like asciidoc or asciidoctor for .adoc files, corresponding tool be
pre installed on build system.

[NOTE]
====
How to install asciidoctor on netlify buildbot system?::
asciidoctor could be installed on netlify buildbot using *bundler*.
----
[build]
  publish = "public"
  command = "bundle && hugo"
----

.Contents of gem file
----
# frozen_string_literal: true
source "https://rubygems.org"

# gem "rails"
gem 'asciidoctor'
----

https://github.com/salesagility/SuiteDocs/blob/master/netlify.toml[Sample file ]

What is bundler?::
its a ruby packaging and building tool to install dependencies from gem.files
How to specify which ruby version to use for bundler?::
specify in netlify.toml file

====

== How to continuously deploy with new settings on Netlify?
Add following files to your project

[WARNING]
====
Gemfile:: install asciidoctor as external document parser

.ruby-version:: to specify which ruby version to use build from Gemfile

netlify.toml:: specify build config like *build directory*, *build command* and
*HUGO_VERSION* to use for the current project deployment .
====

.Common content formats
. https://en.wikipedia.org/wiki/DocBook[DocBook]
. https://en.wikipedia.org/wiki/XML[XML]

[bibliography]
== References

. https://en.wikipedia.org/wiki/AsciiDoc
. https://www.netlify.com/docs/continuous-deployment/?_ga=2.233419166.1217213378.1554047272-1742537450.1553854673#common-configuration-directives
. https://www.netlify.com/docs/continuous-deployment/#set-node-ruby-or-python-version
. https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/
