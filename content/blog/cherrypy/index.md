---
title      : "CherryPy"
date       : 2019-08-12T16:49:22+02:00
publishdate: 2019-08-13T16:49:22+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Python
categories:
- development
tags:
- cherrypy
---

Dispatching
: is the art of locating the appropriate page handler for a given request
* Usually, dispatching is based on the request’s URL, the query-string and, sometimes, the request’s method (GET, POST, etc.)

hook
: A hook point is a point during the request/response processing
“on_start_resource” - The earliest hook; the Request-Line and request headers have been processed and a dispatcher has set request.handler and request.config.
* before_request_body
* before_handler
* before_finalize
* on_end_resource
* before_error_response
* after_error_response
* on_end_request

Plugins
: Plugins, simply put, are entities that play with the bus, either by publishing or subscribing to channels, usually both at the same time.
* create your own plugins
* enable/disable a plugin


## CherryPy

- Micro web frameworks, `bottle`, `flask`, `web2py`
- Minimal framework for creating APIs
- Very fast, netflix uses it to route traffic b/w datacentres, disney, splunk
- came in 2002, relatively old
- Class name is usually the `route` of application
- Bulitin HTTP server `cherrypy.quickstart` has handlers for `uWSGI`, development server, tornado application, tie into Django
- HTTP server mounts the class which has index method in it.
- `cherrypy.tools` are like Django middleware. Can manupulate response before or after you are done with it.
- tools to upload/download file
- Configs
  - Application level, mostly routing, specifying static folder location, manually changing header
  - what HTTP server do we use? which port?
- Make your won cherry tools using `@cherrypy.tools.register('before_habdler')`
  - 8 hooks provided by cherrypy to insert handler
- Route `grafting` can have multiple SPA running on same URL
- minimalistic server is 6 lines of code
- Support `FCGI` and `lighthttpd` server mode
- Multiple apps could be mounted at different routes
- Process monitoring with `supervisord`
- A HTTP/1.1-compliant, WSGI thread-pooled webserver.[4] Typically, CherryPy itself takes only 1–2 ms per page.
- [CherryPy 3 has fastest WSGI server yet 12/23/06](https://web.archive.org/web/20160311021047/http://www.aminus.org/blogs/index.php/2006/12/23/cherrypy_3_has_fastest_wsgi_server_yet?blog=2)
- CherryPy uses a tree-based mapper which does not accommodate well with segments that have no physical reality as a Python object

## Logging

most arcane standard library module

- Most ingolorious programmers start with print statements unless it hits them in face
- By default would show only the warning, why worry about things which are going good.
- logging module assumes a lot of things
- Handler to make HTTP POST calls of standard logging events

{{< code numbered="true" >}}
FORMAT = '[%(asctime)s] - [%(levelname)s] - %(message)s'

logging.basicConfig(
    [[[level]]]=logging.INFO,
    [[[format]]]=FORMAT
)
{{< /code >}}

1. Everything info level and above, default is warning level and above.
2. Give us more infomration that we did not put in


## Use cases

1. Send JSON / HTML response
2. Accept JSON input request

### Footnotes

[^1]: [cherrypy production users](https://docs.cherrypy.org/en/latest/intro.html#success-stories)