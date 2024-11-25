#!/bin/bash

echo "Iniciando deploy do ambiente..."
echo
echo

if ! command -v docker &> /dev/null; then
    echo "Docker não encontrado!"
    echo "Necessario realizar a instalação do [Docker] para deploy do ambiente!"
else
    echo "Docker Ok!"
fi

echo
echo

if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose não encontrado!"
    echo "Necessario realizar a instalação do [Docker Compose] para deploy do ambiente!"
else
    echo "Docker Compose Ok!"
fi

echo
echo

echo "Executando docker-compose!"
docker-compose up -d 

echo
echo
docker-compose ps
sleep 5
echo
echo
echo "Validando estado da aplicação..."

url="http://localhost/health"
status_code=$(curl -o /dev/null -s -w "%{http_code}" $url)

if [ "$status_code" -eq 200 ]; then
    echo "Health check bem-sucedido! Aplicacao rodando normalmente!"
else
    echo "Falha no health check! Status: $status_code"
fi
