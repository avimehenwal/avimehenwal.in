# Flask Basics

1. Harcoaded URLs with **@app.route()** decorator
2. URLs with parameters/querystring and validation with datatype *@app.route('/post/<int:post_id>')*
3. Generate urls via **url_for()**
4. Static File serving via **/static** directory **url_for('static', filename='style.css')**
5. Rendering Templates **render_template('hello.html', name=name)** from **/templates** dir
6. Unittesting app with **test_request_context()** and **request_context(environ)** and for response **make_response()**
7. File Uploads. Set **enctype="multipart/form-data"** in browser **request.files['the_file']**
8. Cookies **request.cookies.get('username')** or **resp.set_cookie('username', 'the username')**
9. Redirects and errors **redirect() abort(401)** @app.errorhandler(404)
10. Sessions **app.secret_key**
11. Message flashing
12. Logging app.logger.error('An error occurred')
13. Deploying to web server




Inside templates you also have access to the request, session and flask.g objects as well as the get_flashed_messages() function.
Templates are especially useful if inheritance is used.

Certain objects in Flask are global objects, but not of the usual kind. These objects are actually proxies to
objects that are local to a specific context. While unittesting flask manually create request object via
test_request_context() context manager