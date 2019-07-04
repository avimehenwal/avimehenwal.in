---
categories: []
date: "2019-06-29T12:16:45+02:00"
draft: true
revision: 0
series:
- DailyLogs
tags: []
title: 29 Juni
weight: 5
---

$$ \varphi = \dfrac{1+\sqrt5}{2}= 1.6180339887… $$


The Frech Revolution
17th centuary
Guillotine

The french revolution

King Louis XVI
treid to escape to Austria but was recognised and arrested

{{% blockquote author="King Louis XVI" %}}
I die innocent
I pardon my enemies
and I hope that my blood
will be useful for France.
Thats it will appease Gods anger
{{% /blockquote %}}

Maximilien Robespierre: The Reign of Terror[^1]


Vector Path

* straight path
  * Anchor point
  * path
* curved path
  * Control Handle
* closed path

SVG Scalable Vector Graphics
SVG is a W3C recommendation
SVG images are zoomable
File are XML, edited with any text editor

{{% codePen ewVJjE %}}

Path - most powerful tool[^4]
create lines, curves, arcs and more.
The following commands are available for path data[^4]:

[A online path editor](http://jxnblk.com/paths/)

Path commands | Description
---| -----------
M | moveto | moves cursor to `x` and `y` position 
L | lineto | draws a line from the current position to a new position `(x, y)`
H | horizontal lineto | one argument
V | vertical lineto | one argument
C | curveto
S | smooth curveto
Q | quadratic Bézier curve
T | smooth quadratic Bézier curveto
A | elliptical Arc
Z | closepath

Add animations to SVG to achieve cool graphics
CSS propoertie will work on SVG provided in code and NOT on svg imported from `img` tag

```html
<svg>
    <use href="#exampleSymbol"></use>
</svg> 
``` 

How to embed svg onto html

feature                    |`<img>`	      | `<object>`	      | Inline SVG
---------------------------|:------------:|:-----------------:|:----------
Browser support	           |  Good	      | Good	          |  Good
Alt and title attribute	   | Yes	      | None	          |  Title only
Browser caching	           | Yes	      | Yes	              |  None
GZip compression	       | Yes	      | Yes	              |  None
Interactivity	           | None	      | Yes	              |  Very good
Search engine indexing	   | Yes	      | Through fallback  |	 None
Workflow	               | Streamlined  |	Medium	          |  Convoluted
Loading speed	           | Fast	      | Slower	          |  Very fast

shape to path vs stroke to path
object to path 

{{% youtube JEPd-gCW5m8 %}}

[bibliography]
### Footnotes

[^1]: [Maximilien Robespierre: The Reign of Terror](https://youtu.be/_plscSbrWts)
[^2]: [French Revolution Timeline](http://www.historyhome.co.uk/c-eight/france/frevchro.htm)
[^3]: [svg_path w3tutorials](https://www.w3schools.com/graphics/svg_path.asp)
[^4]: https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths
