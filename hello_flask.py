__author__ = 'avimehenwal'

from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hi its from flask'


if __name__ == '__main__':
    app.run()
