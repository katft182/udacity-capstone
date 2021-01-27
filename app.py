from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World version 3!'
    
@app.route('/goodbye')
def goodbye_world():
    return 'Goodbye, World version 3!'    

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)