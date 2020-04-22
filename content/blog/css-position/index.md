---
title      : "CSS Positioning"
date       : 2019-08-01T12:30:48+02:00
publishdate: 2019-08-02T12:30:48+02:00
comments   : true
weight     : 5
revision   : 0
series:
- Design
categories:
- frontend
- css
tags:
- position
- z-index
---

The position property specifies the type of positioning method to be used
by renderer (browser) for an element[^1].

There are five different position values:

1. static
2. relative
3. fixed
4. absolute
5. sticky
<!-- more -->

## static

* `static` is the default position style that all HTML elements will have when they are added onto page.
* are not affected by the `top`, `bottom`, `left`, and `right` properties.

## relative

* Are positioned relative to their normal position
* `relative` allows to use `top`, `bottom`, `left`, and `right` css properties relative to its normal position.

## fixed

* is positioned relative to the viewport, which means it always stays in the same place
* `fixed` has nothing to do with parent. Moves with the page.
  * DOM removes the element from the page
  * Then builds the rest of the page
  * Then put this element on the top
  * Hence it overlays other elements

## absolute

*  is positioned relative to the nearest positioned ancestor (instead of positioned relative to the viewport, like fixed).
* `absolute` completely remove element from document flow and treats it as if its not a part of document at all
* `relative` and `absolute` plays nicely

## sticky

* A sticky element toggles between relative and fixed, depending on the scroll position. It is positioned relative until a given offset position is met in the viewport - then it "sticks" in place (like position:fixed).
* `sticky` combination of `fixed` and `relative` position.
  * Needs a `position` to work

```css
position: sticky;
top: 0.25rem;
```

## z-index

The z-index property specifies the stack order of an element (which element should be placed in front of, or behind, the others).

```css
z-index: -1;  /* behind */
```
---

To centre divs horizontally use

```css
#container {
    width: 800px;
    margin-left: auto;
    margin-right: auto;
}
```
This doesn't work vertically


{{< code numbered="true" >}}
[[[@media]]] ([[[min-width: 600px]]]) {
    p {
        font-size: 1.25rem;
    }
}
#footer {
    [[[clear: both;]]]
}
{{< /code >}}

1. Media query block
2. breakpoint, could be `max-width` as well.
3. Clear all floating styles before we display

{{% codePen obEVqM %}}

Mobile-first approach - think about how your site will look right from the start

### Footnotes

- [Link to github project](https://github.com/avimehenwal/css-positioning)
[^1]: [w3schools, css_positioning](https://www.w3schools.com/css/css_positioning.asp)
