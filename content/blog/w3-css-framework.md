---
title       : "w3-css Framework in 2 minutes or less"
date        : 2019-02-14T21:08:15+01:00
video       : ""
categories  : [design]
series      : [edublog]
tags        : ["frontend", "css"]
revision    : 1
---

* **The w3-container** good for all HTML container elements like `<div>, <article>, <section>, <header>, <footer>, <form>, and more.` adds 16px left and right padding to any HTML element.
* **The w3-panel class** adds a 16px top and bottom margin and a 16px left and right padding to any HTML element. Good for displaying notes, alerts, quotes, blockquotes, notification of changes etc
* **w3-border** can add that extra touch of color for attention and detail.
* **w3-display----** implements HTML Box model with easy placements.
* responsive directives
* "Hero image" is a term used for a specific type of web banner. The purpose of an hero image is to present the web site's most important content.
* Follow HTML5 semantic recommendations. please do!


## Columns with different width
{{< highlight html >}}
<div class="w3-row-padding">
  <div class="w3-quarter">
    <p>Lorem ipsum</p>
  </div>
  <div class="w3-half">        
    <p><strong>central content</strong></p>
  </div>
  <div class="w3-quarter">        
    <p>Lorem ipsum</p>
  </div>
</div>
{{< / highlight >}}


## using tooltip as text
{{< highlight html >}}
<p class="w3-tooltip">London
  <span class="w3-text w3-tag">
    <b>9 million inhabitants</b>
  </span> is the capital of England.
</p>
{{< / highlight >}}

## Dropdown menu bars (horizontal/vertical) without using any css

{{< highlight html >}}
<div class="w3-bar w3-light-grey">
   <a href="#" class="w3-bar-item w3-button w3-right">Home</a>
   <a href="#" class="w3-bar-item w3-button">Link 1</a>
   <div class="w3-dropdown-hover">
     <button class="w3-button w3-hover-green">Dropdown</button>
     <div class="w3-dropdown-content w3-bar-block w3-card-4">
       <a href="#" class="w3-bar-item w3-button">Link 1</a>
       <a href="#" class="w3-bar-item w3-button">Link 2</a>
       <a href="#" class="w3-bar-item w3-button">Link 3</a>
     </div>
   </div>
 </div>
{{< / highlight >}}


## cell-view
Good for applications like

- definitions
- word-meanings
- demystifying etc.

{{< highlight html >}}
// https://www.w3schools.com/w3css/
<div class="w3-cell-row w3-card-2">
<div class="w3-cell w3-cell-middle w3-hide-small w3-green
  w3-center w3-xxlarge" style="padding:16px;width:150px">
  W3<br>CSS
</div>
<div class="w3-cell w3-container w3-light-gray
 w3-border-left w3-cell-top"
 style="padding:0px 16px 8px 16px;">
  <h2>Some heading </h2>
  <p>Equality for all browsers: Chrome.
  Firefox Edge. IE. Safari. Opera.</p>
  <p>Equality for all devices: Desktop.
  Laptop. Tablet. Mobile.</p>
  <p>Standard CSS only (No jQuery or JavaScript library).
  </p>
</div>
{{< / highlight >}}

### use bars to make it more appealing

{{< highlight html >}}
<div class="w3-container w3-pale-green
 w3-bottombar w3-border-green w3-border">
 <p>some text</p>
</div>
<class="w3-leftbar w3-rightbar">
{{< / highlight >}}



## Quotes

{{< highlight html >}}
<div class="w3-container w3-sand w3-leftbar">
  <p>
   <span class="w3-serif w3-large">
    <i>"Some quote here"</i>
   </span><br>
    Albert Einstein
  </p>
</div>
{{< / highlight >}}


### code blocks
{{< highlight html >}}
<div class="w3-code cssHigh">
.. CSS code here
w3-code cssHigh
w3-code jsHigh
w3-code htmlHigh
</div>
{{< / highlight >}}
