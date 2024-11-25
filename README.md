# Desafio DevOps Junior


Estrutura do Projeto

Dockerfile: Define a configuração do container da aplicação.
docker-compose.yml: Configura os serviços necessários para executar a aplicação (web e Nginx).
scripts: Contém scripts Bash para automação do ambiente.
README.md: Instruções detalhadas para configurar, rodar e testar a aplicação.
Requisitos
Ferramentas Utilizadas
Docker: Para containerizar a aplicação e seus serviços.
docker-compose: Para orquestrar os containers de forma fácil e eficiente.
Nginx: Servidor web utilizado para servir a aplicação.
Flask (Python): Framework utilizado para a criação da aplicação web.
Pré-requisitos
Docker e docker-compose instalados no ambiente.
Git para versionamento de código e clonar o repositório

### Configurando o ambiente

Clone este repositório para sua máquina local utilizando o comando:

bash
Copiar código
git clone https://github.com/Samuel-Diniz/desafio-devops-junior.git
2. Navegar até o Diretório do Projeto
Acesse o diretório onde o repositório foi clonado:

bash
Copiar código
cd desafio-devops-junior
3. Configuração do Ambiente
A aplicação utiliza Docker para garantir que todas as dependências sejam configuradas de maneira isolada. Verifique se o arquivo docker-compose.yml está presente no diretório.

Execução
A seguir, execute o ambiente utilizando o docker-compose.

1. Construir as Imagens
O comando abaixo vai construir as imagens do Docker conforme os arquivos Dockerfile e docker-compose.yml:

bash
Copiar código
docker-compose up --build -d
Isso irá iniciar os containers em segundo plano. O parâmetro --build garante que as imagens sejam construídas, caso algo tenha sido alterado nos arquivos do projeto.

2. Acessando a Aplicação
Após a execução do comando acima, a aplicação estará disponível nas seguintes portas:

Aplicação Web: http://localhost:5000
Nginx (Reverse Proxy): http://localhost:80
Verificação de Saúde
A aplicação possui uma verificação de saúde para garantir que o ambiente esteja funcionando corretamente.

1. Verificando a Saúde da Aplicação
Você pode verificar a saúde da aplicação verificando o status do container web:

bash
Copiar código
docker ps
Se o container desafio-devops-junior-web-1 estiver em execução, isso significa que a aplicação está ativa e rodando.

2. Verificando Logs
Se houver qualquer problema, é possível acessar os logs da aplicação para mais informações:

bash
Copiar código
docker logs desafio-devops-junior-web-1
3. Verificando a Conexão de Rede
Caso esteja enfrentando problemas de rede ou conexão, verifique se o Docker está com as configurações corretas. Se necessário, reinicie o serviço Docker:

bash
Copiar código
sudo systemctl restart docker
Testes
Para testar a aplicação, basta acessar o endereço http://localhost:5000 no navegador. A aplicação estará rodando, e você pode verificar se o Nginx está corretamente encaminhando as requisições para o backend Flask.

1. Teste de Conectividade
Você pode testar a conectividade entre os containers do Docker com o seguinte comando:

bash
Copiar código
docker exec -it desafio-devops-junior-web-1 ping -c 4 google.com
Isso ajudará a garantir que a conectividade de rede esteja funcionando dentro do container.

2. Teste de Saúde
Acesse o endpoint /health para verificar se a aplicação está funcionando como esperado:

bash
Copiar código
curl http://localhost:5000/health
O retorno esperado é um código de status HTTP 200 e uma mensagem indicando que a aplicação está funcionando.

Solução de Problemas
Abaixo estão algumas mensagens de erro comuns que você pode encontrar ao tentar rodar o projeto, juntamente com as soluções.

Erro: "Temporary failure in name resolution" ao tentar instalar pacotes no Docker
Isso pode ocorrer se o container não tiver acesso à Internet. Verifique sua conexão de rede e as configurações de DNS no Docker. Para resolver:

Verifique se o Docker tem acesso à internet.
Reinicie o serviço Docker:
bash
Copiar código
sudo systemctl restart docker

Teste feito:

Verificando Containers em Execução
Após iniciar os containers com o docker-compose up, você pode verificar se os containers estão em execução corretamente utilizando o seguinte comando:

docker ps #Este comando exibirá uma lista de containers ativos e suas informações, como IDs, imagens, comandos, portas mapeadas e status. A saída deve ser semelhante a:

CONTAINER ID   IMAGE                       COMMAND                  CREATED              STATUS              PORTS                                       NAMES
0ae747f21376   nginx:alpine                "/docker-entrypoint.…"   9 minutes ago        Up 9 minutes        0.0.0.0:80->80/tcp, :::80->80/tcp           desafio-devops-junior-nginx-1
855483b338aa   desafio-devops-junior-web   "python app.py"          9 minutes ago        Up 9 minutes        0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   desafio-devops-junior-web-1

Explicação dos Campos
CONTAINER ID: ID único atribuído ao container em execução.
IMAGE: Imagem Docker usada para criar o container.
COMMAND: Comando que o container está executando.
CREATED: Tempo desde que o container foi criado.
STATUS: O status atual do container (por exemplo, "Up" indica que o container está rodando).
PORTS: Mapeamento de portas entre o host e o container (por exemplo, a porta 5000 do container está mapeada para a porta 5000 do host).
NAMES: Nome atribuído ao container, útil para interações com o Docker.


#Observações


Este desafio foi implementado utilizando Docker para garantir um ambiente isolado, com Flask rodando como aplicação web e Nginx como servidor reverso.
Todos os passos necessários para rodar a aplicação estão descritos neste README, mas fique à vontade para modificar conforme suas necessidades.
A solução pode ser expandida com novas funcionalidades, como autenticação, persistência de dados, ou integração com outros serviços.
