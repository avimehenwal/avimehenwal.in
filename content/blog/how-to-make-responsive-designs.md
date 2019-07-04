---
categories:
- design
date: "2019-02-15T19:04:56+01:00"
revision: 0
series:
- edublog
tags:
- css
- responsive
title: How to Make Responsive Designs
video: ""
---

## Why care about responsive and mobile first design at all?

Designing for best experience for all users

## Responsive window
The viewport is the user's visible area of a web page.

{{< highlight html "style=friendly" >}}
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
{{< /highlight >}}

## Responsive Images

Use percentages % instead of pixel values. Use calculatable ranges instead of harcoded values.

Use **width** and **max-width** css property with images to decide span.

{{< highlight html "style=friendly" >}}
  <img src="img_girl.jpg" style="width:100%;">
  <img src="img_girl.jpg" style="max-width:100%;height:auto;">
{{< /highlight >}}

Use special *picture* HTML Tag to manipulate image based on display resolution size.

{{< highlight html "style=friendly" >}}
  <picture>
    <source srcset="img_smallflower.jpg" media="(max-width: 600px)">
    <source srcset="img_flowers.jpg" media="(max-width: 1500px)">
    <source srcset="flowers.jpg">
    <img src="img_flowers.jpg" alt="Flowers" style="width:auto;">
  </picture>
{{< /highlight >}}

## Responsive Text

Use **vw** viewport width
Viewport is the browser window size. 1vw = 1% of viewport width. If the viewport is 50cm wide, 1vw is 0.5cm.

{{< highlight html "style=friendly" >}}
  <h1 style="font-size:10vw">Hello World</h1>
{{< /highlight >}}

## Media Queries

With media queries you can define completely different styles for different browser sizes.

{{<highlight css "style=friendly" >}}
  /* Use a media query to add a breakpoint at 800px: */
  @media screen and (max-width: 800px) {
    .left, .main, .right {
      width: 100%; /* The width is 100%, when the viewport is 800px or smaller */
    }
  }
{{< /highlight >}}

### References
>  https://www.w3schools.com/css/css_rwd_viewport.asp
