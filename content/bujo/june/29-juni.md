---
categories:
- history
- frontend
date: "2019-06-29T12:16:45+02:00"
revision: 1
series:
- DailyLogs
tags:
- svg
title: 29 Juni
weight: 5
---

## The Frech Revolution

[French Revolution Timeline](http://www.historyhome.co.uk/c-eight/france/frevchro.htm)
17th centuary
Guillotine

King Louis XVI
tried to escape to Austria but was recognised and arrested and later executed by his own people.

{{% blockquote author="King Louis XVI" %}}
I die innocent
I pardon my enemies
and I hope that my blood
will be useful for France.
Thats it will appease Gods anger
{{% /blockquote %}}

Maximilien Robespierre: The Reign of Terror[^1]


## Vector Path

* straight path
  * Anchor point
  * path
* curved path
  * Control Handle
* closed path

## SVG - Scalable Vector Graphics

[svg_path w3tutorials](https://www.w3schools.com/graphics/svg_path.asp)

* File are XML, edited with any text editor
* SVG images are zoomable
* SVG is a W3C recommendation


{{% codePen ewVJjE %}}


Path - most powerful tool[^4]
create lines, curves, arcs and more.
The following commands are available for path data[^4]:

[A online path editor](http://jxnblk.com/paths/)

> Add animations to SVG to achieve cool graphics. Checkout [css, codrops](https://github.com/codrops) for inspiration


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

{{% note %}}
    CSS properties will work on SVG provided in code and NOT
    on svg imported from `img` tag
{{% /note %}}


```html
<svg>
    <use href="#exampleSymbol"></use>
</svg> 
``` 

#### How to embed svg onto html?

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

#### Difference between shape to path vs stroke to path? What is object to path? 

{{% youtube JEPd-gCW5m8 %}}

### Footnotes

[^1]: [Maximilien Robespierre: The Reign of Terror](https://youtu.be/_plscSbrWts)
[^4]: https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths
