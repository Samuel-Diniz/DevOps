#!/bin/bash

echo "Iniciando deploy do ambiente DevOps..."

# Atualizar pacotes e instalar dependências essenciais
sudo apt update && sudo apt install -y curl wget git ufw

# Instalar Docker
if ! command -v docker &> /dev/null; then
    echo "Docker não encontrado. Instalando..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
else
    echo "Docker já está instalado."
fi

# Instalar Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose não encontrado. Instalando..."
    sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')" \
         -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo "Docker Compose já está instalado."
fi

# Configuração de Firewall
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw enable

echo "Configuração concluída! Reinicie o terminal para aplicar permissões ao Docker."
