---
title      : "Python Webservers"
date       : 2019-07-31T18:15:25+02:00
publishdate: 2019-08-01T18:15:25+02:00
comments   : true
weight     : 5
revision   : 0
series:
- Programming
categories:
- python
- serverside
tags:
- webserver
- http
- cgi
- python
- nginx
---

> external program outputs HTML instead of plain text, the browser-shell detects it and renders it as a web page.
> Webserver invokes external programs

A browser is an **HTTP client** because it sends requests to an **HTTP server** (Web server),
which then sends responses back to the client. The standard (and default) port for HTTP
servers to listen on is **80**, though they can use any port.

* Apache creates *processes* and *threads* to handle additional connections. While Nginx is said to be event-driven, asynchronous, and non-blocking.
* Nginx includes advanced **load balancing** and **caching abilities**.
* Nginx is a lot lighter than Apache

+ Python webframeworks provide simple to use `Request-Response` structure for HTTP calls
+ search the codebase `grep -i wsgi`

WSGI - Web Server Gateway Interface
: standardise interface b/w webserver and python applications/frameworks
* [PEP 333(3)](https://www.python.org/dev/peps/pep-3333/)
* Makes it easy to switch webserver like `nginx` or `apache` is they speak the WSGI language

## What happens when you click on a URL?

1. Browser contacts the HTTP web server for demanding the URL
2. Parsing the URL
3. Look for the filename
4. If it finds that file, a request is sent back
5. Web browser takes a response from the web server
6. As the server response, it either shows the received file or an error message.

## CGI - Common Gateway Interface

Standard how client can communicate with HTTP server. In `/usr/lib/cgi-bin` directory

Execute programs that execute like command-line-interface programs[^1].

{{% note %}}
Any program or compiled code that could run on your computer could be installed
as a CGI script. Eg, compile a C file and place the compiled output inside cgi-bin
{{% /note %}}

It is possible to set up the HTTP server so that whenever a file in a certain directory is requested that file is not sent back; instead it is executed as a program, and whatever that program outputs is sent back for your browser to display. This function is called the Common Gateway Interface or CGI and the programs are called CGI scripts. These CGI programs can be a Python Script, PERL Script, Shell Script, C or C++ program, etc.

* **Static webserver** serves boring static HTML files.
  * Session Management not possible
  * No dynamic views
* Invoke a `SCRIPT` instead of a `FILE`. Scripts are saved on server. UNIX like philosohpy, request inputs are set in `environment variables`. Can use `stdout` as output
* `gunicorn` talks `WSGI` language and feeds the framework with requests and responses paameters

## Making a python web-server from scratch

Use python `sockets`

```
Client Request ----> Nginx (Reverse-Proxy)
                        |
                       /|\
                      | | `-> App. Server I.   127.0.0.1:8081
                      |  `--> App. Server II.  127.0.0.1:8082
                       `----> App. Server III. 127.0.0.1:8083
```

## CGI programming with Python

Generally CGi scripts are installed in `cgi-bin` folder, for security reasons[^2].

{{% warning %}}
There’s one important rule: if you invoke an external program (via the os.system() or os.popen() functions. or others with similar functionality), make very sure you don’t pass arbitrary strings received from the client to the shell. This is a well-known security hole whereby clever hackers anywhere on the Web can exploit a gullible CGI script to invoke arbitrary shell commands. Even parts of the URL or field names cannot be trusted, since the request doesn’t have to come from your form!

To be on the safe side, if you must pass a string gotten from a form to a shell command, you should make sure the string contains only alphanumeric characters, dashes, underscores, and periods.
{{% /warning %}}


{{< code numbered="true" >}}
[[[#!/usr/bin/env python]]]

import cgi
import [[[cgitb]]]; cgitb.enable()  # for troubleshooting

print "Content-type: text/html"
print
print """
  <html>
  <head><title>Sample CGI Script</title></head>
  <body>
    <h3> Sample CGI Script </h3>
"""

form = cgi.FieldStorage()
message = form.getvalue("message", "(no message)")
print """
    <p>Previous message: %s</p>
    <p>form
    <form method="post" action="index.cgi">
      <p>message: <input type="text" name="message"/></p>
    </form>
  </body>
  </html>
""" % cgi.escape(message)
{{< /code >}}

1. Shebang header to invoke python interpreter
2. Enable *traceback* from CGI scripts

```
apt install -y nginx ufw

sudo ufw app list
sudo ufw allow 'Nginx Full'
sudo ufw status

sudo cp -v /path/project/. /var/www/

/etc/nginx
sites-enabled
sites-available

python3 -m http.server --cgi 8000
python -m webbrowser http://localhost:8000/cgi-bin/hello.py
```

[Sample nginx configuration](https://gist.github.com/szarapka/05ba804dfd1c10ad47bf)

Security is very important, the user you used to run CGI server will be used to run
all the CGi scripts, some of them could be dangerous.

{{% note %}}
If the location of CGI scripts is `/tmp/share/cgi-bin` then use localtion `/tmp/share`
to run python server.
{{% /note %}}

## vue + nginx

[How to use vue.js with Nginx?](https://stackoverflow.com/questions/47655869/how-to-use-vue-js-with-nginx)

[vue.js with docker](https://jonathanmh.com/deploying-a-vue-js-single-page-app-including-router-with-docker/)

try npm run build and then there file be a dist folder. copy the contents of the folder to the server.

#### [Link to project on github](https://github.com/avimehenwal/python-cgi)

### Footnotes

[^1]: [wiki, CGI](https://en.wikipedia.org/wiki/Common_Gateway_Interface)
[^2]: [HOw to use python in web](https://docs.python.org/3.4/howto/webservers.html?highlight=cgi)
[Vue app on nginx on docker](https://cli.vuejs.org/guide/deployment.html#docker-nginx)
[^3]: [Controlling webbrowser with python](https://docs.python.org/3.6/library/webbrowser.html)
