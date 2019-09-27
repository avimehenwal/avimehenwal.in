---
title      : "Robot Framework and MQTT"
date       : 2019-08-23T09:39:24+02:00
publishdate: 2019-08-24T09:39:24+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- myLearning
categories:
- programming
- testing
tags:
---

## Robot Framework

--prerunmodifier
: Programmatic modification of test data
* Select every Xth test
* Exclude tests by name
* Skip setups and teardowns
* Add Global setups and teardowns

`--variablefile`
: can have one or multiple variable file
* either in robot language format or python
* could be a python file with arguments

## MQTT


## UML Diagram

Add UML Diagrams to sphinx documentation[^1]

## Graphviz

- [Graphviz languague to generate crazy vizualizations from code](http://www.graphviz.org/gallery/)
- PyDot python library to write graphviz language[^3]

{{< code numbered="true" >}}
import pydot

graph = pydot.Dot(graph_type='digraph')
node_a = pydot.Node("Node A", style="filled", fillcolor="red")
node_b = pydot.Node("Node B", style="filled", fillcolor="green")
node_c = pydot.Node("Node C", style="filled", fillcolor="#0000ff")
node_d = pydot.Node("Node D", style="filled", fillcolor="#976856")

graph.add_node(node_a)
graph.add_node(node_b)
graph.add_node(node_c)
graph.add_node(node_d)

graph.add_edge(pydot.Edge(node_a, node_b))
graph.add_edge(pydot.Edge(node_b, node_c))
graph.add_edge(pydot.Edge(node_c, node_d))
graph.add_edge(pydot.Edge(node_d, node_a, label="and back we go again", labelfontcolor="#009933", fontsize="10.0", color="blue"))

graph.write_png('example2_graph.png')
{{< /code >}}

## Instagram

* Blocked lot of bots from scraping data after Cambridge Analytica case, user privacy
* [Unofficial Instagram API Endpoints](https://stevesie.com/apps/instagram-api)
* Getting the most recent 25 posts links.
* Get Posts related to a hashtag `https://www.instagram.com/explore/tags/{{italy}}/`
* Selenium, scrapy, API + Beautyful soupe related solutions


### Footnotes

[^1]: [sphinx-pyreverse](https://github.com/alendit/sphinx-pyreverse)
[^2]: [pydot](https://github.com/pydot/pydot)
[^3]: [Graph Description Language](https://en.wikipedia.org/wiki/DOT_(graph_description_language))
[^4]: https://gitlab.com/graphviz/graphviz
