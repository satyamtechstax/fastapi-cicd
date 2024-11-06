from flask import Flask

app=Flask(__name__)

@app.route('/')
def hello_world():
    return {"message":'Hello, World!(From Flask App)'}

app.run(host='0.0.0.0',port=8080)