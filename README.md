# Desafio-Devops
Desafio Devops

# Requisitos

- Docker (https://docs.docker.com/engine/install/)
- Docker Compose (https://docs.docker.com/compose/install/standalone/)

# Descrição

O desafio consiste em criar um ambiente básico de deploy automatizado para uma aplicação web simples, utilizando ferramentas essenciais de DevOps, como Docker, Bash e Git.

Inicialmente deve ser clonado o repositorio conforma comando abaixo:
```bash
git clone https://github.com/Samuel-Diniz/DevOps
```

Depois acesse o projeto de acordo comando abaixo:
```bash
cd DevOps/
```   

Apos este execute o script conforme comando abaixo:
```bash
bash scripts/start_application.sh 
```            

Apos execucao do script com retorno "Health check bem-sucedido!" basta acessar a URL abaixo via browser.
```bash
http://localhost/
```

Apos execucao dos teste no site e concluir as validacoes, basta executar o script abaixo para interromper a aplicacao localmente.
```bash
bash scripts/stop_application.sh
```



