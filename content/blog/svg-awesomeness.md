---
title      : "Svg Awesomeness"
date       : 2019-07-10T10:50:45+02:00
comments: false
weight     : 5
revision   : 0
series:
- myLearning
categories: 
- design
- frontend
tags:
- svg
- inkscape
---

{{<quote>}}
Make web look crisp and nice at all resolutions
{{</quote>}}

## WHY SVG?

1. Scalable Vector Graphics (SVG) Version 2.
2. SVG is a language based on XML for describing two-dimensional vector and mixed vector/raster graphics
3. SVG content is stylable, scalable to different display resolutions, and can be viewed stand-alone, mixed with HTML content, or embedded using XML namespaces within other XML languages  
4. Look crisp and nice on all resolutions
5. Official W3C Specification[^4]
6. SVG Filters[^3]

## Using Guidelines

1. The SVG `<use>` element can reuse an SVG shape from elsewhere in the SVG document, including `<g>` elements and `<symbol>` elements. The reused shape can be defined inside the `<defs>` element (which makes the shape invisible until used) or outside.
2. The `<symbol>` element is used to define graphical template objects which can be instantiated by a `<use>` element.
3. svg is an **inline element**. inline elements leave white-space.

{{< code numbered="true" >}}
<svg>
   <use xlink:href="#myDot" x="65" y="5" style="opacity:0.2" />
   <use href="#shape-icon-2" />
</svg>


<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  
  <symbol id="beaker" viewBox="214.7 0 182.6 792">
    <!-- <path>s and whatever other shapes in here -->  
  </symbol>
  
  <symbol id="shape-icon-2" viewBox="0 26 100 48">
    <!-- <path>s and whatever other shapes in here -->  
  </symbol>
  
</svg>

{{< /code >}}

1.  viewbox arguments `"x, y, width, height"`

## SVG web backgrounds

* size could be a problem along with browser compatibility
  * simple svg sizes are nearly **5KB**
* Use `inline` CSS to import SVG, so that SVG's properties could be manupulated by CSS
  * Using SVG from `<img>` tag adds a new HTTP request
* Animate, **morph**, add filters to SVGs via javascript code and programming[^5]
  * Program your animations
* https://getwaves.io/
* 

### Additional Use Cases

1. Use SVG crisp looking graphs, piecharts, bargraphs etc.
2. interactive elements


{{< code numbered="true" >}}
<svg [[[width="100%" height="100%"]]]>
   <rect width="100%" height="100%" fill="red" />
   <circle cx="100%" cy="100%" r="150" fill="blue" stroke="black" />
   <polygon points="120,0 240,225 0,225" fill="green"/>
   <[[[text]]] x="50" y="100" font-family="Verdana" font-size="55"
       fill="white" stroke="black" stroke-width="2">
         Hello!
   </text>
[[[</svg>]]]
{{< /code >}}

1. Add interactivity using `CSS` or `JS`
2. Supports even text
3. TIP: Minimize and encode before use

## Free SVG Resources

* [dribbble.com](https://dribbble.com/shots/3892241-FREE-Workspaces)
* [svgbackgrounds](https://www.svgbackgrounds.com/#protruding-squares)

## Animate SVG

1. [X] SVG animation using SMIL
2. [ ] SVG animation using CSS
3. [ ] SVG animation using ECMAScript

What does a transform do?

{{% fileTree %}}
* `transform` can
  * translate
  * scale
  * rotate
  * skewX
  * skewY
{{% /fileTree %}}

## Inkscape

* written in c++
* Inkscape uses SVG as its native document format, and has the goal of becoming the most fully compliant drawing program for SVG files available in the Open Source community.

The ultimate power tool of Inkscape is the XML editor <kbd><kbd>Shift</kbd><kbd>Ctrl</kbd>+<kbd>X</kbd></kbd>. It displays the entire XML tree of the document, always reflecting its current state. You can edit your drawing and watch the corresponding changes in the XML tree. Moreover, you can edit any text, element, or attribute nodes in the XML editor and see the result on your canvas. This is the best tool imaginable for learning SVG interactively, and it allows you to do tricks that would be impossible with regular editing tools.[^1]

- elements of design[^2]

### Footnotes

[^1]: [inkscape, tutorial advanced](https://inkscape.org/en/doc/tutorials/advanced/tutorial-advanced.html)
[^2]: [elements of design](https://inkscape.org/en/doc/tutorials/elements/tutorial-elements.html)
[^3]: [SVG Filter effects](https://en.wikipedia.org/wiki/SVG_filter_effects)
[^4]: [Official W3C SVG reference](https://www.w3.org/TR/SVG/Overview.html)
[^5]: https://blog.prototypr.io/how-to-add-svg-waves-to-your-next-web-project-b720efe1c692
[^6]: [SVG Wave generator](https://smooth.ie/blogs/news/svg-wavey-transitions-between-sections)
[^7]: [SVG animation basics](http://xahlee.info/js/svg_animate.html)

