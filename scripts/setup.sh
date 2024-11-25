#!/bin/bash

echo "Configurando a aplicação web..."

# Instalar dependências da aplicação
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "Arquivo requirements.txt não encontrado!"
fi

echo "Configuração concluída!"
