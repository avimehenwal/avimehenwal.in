__author__ = 'avimehenwal'

from flask import Flask

app = Flask(__name__)
print("__name__", __name__)

## ROUTING
@app.route('/')
def hello_world():
    return 'Hi its from flask'

# Paramets could be passed in URLS like int, float and path type
@app.route('/user/<username>')
def show_user_profile(username):
    return 'User %s' % username

# Mention parameter type before where parameter is expected
@app.route('/post/<int:post_id>')
def show_post(post_id):
    return 'Post %d' % post_id


if __name__ == '__main__':
    app.debug = True             # Never use in production
    app.run(host='0.0.0.0')
