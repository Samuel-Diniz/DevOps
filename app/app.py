from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Bem-vindo à Salaryfits! Desafio DevOps concluído com sucesso."

@app.route("/health")
def health():
    return "OK", 200  # Resposta de sucesso para indicar que a aplicação está funcionando.

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

