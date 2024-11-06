from dotenv import load_dotenv
from flask import Flask
import os
load_dotenv()
app=Flask(__name__)

APP_NAME=os.getenv('APP_NAME','Alien APP')
@app.route('/')
def hello_world():
    return {"message":f'Hello, World!(From Flask App) v2 ,APP_NAME:{APP_NAME}'}

app.run(host='0.0.0.0',port=8080)