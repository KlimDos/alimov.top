from flask import Flask, render_template

import logging
import os
from dotenv import load_dotenv

from logging.config import dictConfig

#load_dotenv()

logging.info(os.environ.get('ARTEFACT_VERSION'))
build = os.environ.get('ARTEFACT_VERSION')
app = Flask(__name__)

file_index = 1
file_indexes_str = []
data_json = []
for x in range(1, 51):
    file_indexes_str = str(x).zfill(3)

    file_name = f"src/static/png/result/3_{file_indexes_str}-ascii-art.txt"
    with open(file_name, "r") as file:
        data_json.append(file.read())


@app.route("/")
def home():

    global file_index
    file_index += 1
    return render_template('index.html', build=build)

@app.route('/json')
def r():
    return data_json

@app.errorhandler(500)
def server_error(e):
    logging.exception('An error occurred during a request.')
    return """
    An internal error occurred: <pre>{}</pre>
    See logs for full stacktrace.
    """.format(e), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0")
