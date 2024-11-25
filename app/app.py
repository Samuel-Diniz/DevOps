from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Bem-vindo à Salaryfits! Desafio DevOps concluído com sucesso."

@app.route("/health")
def health():
    return "Status Helth Check com sucesso", 200 

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)



