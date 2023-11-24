# ODS Project

Projeto para a matéria de Microserviços que possui como objetivo valorizar a ODS3.

### Integrantes

- Gabriel Ribeiro Itagyba RM87098
- Isabella de Souza Campos RM89244
- Isabelle Raslosnek Ziteli Panico RM87608

## Pré-requisitos:

- [Node](https://nodejs.org/en);
- [Docker desktop](https://docs.docker.com/desktop/install/windows-install/);
- IDE de sua preferência, eu optei pelo VSCODE;

## Instruções de instalação e execução

1. **Clone o repositório**

   Para iniciar, clone o repositório usando o comando:

   ```
   git clone https://github.com/isaasc/projeto-ods.git
   ```

2. **Vá até a pasta docker do projeto**

   Use o comando para entrar na pasta docker no projeto:

   ```
   cd .\projeto-ods/backend/docker
   ```

3. **Construa e inicie os containers docker**

   Estando na pasta do projeto, execute o seguinte comando:

   ```
   docker-compose up --build
   ```

4. **Acessando a Aplicação**

   Com os containers em execução, a API estará disponível em `http://localhost:3000`. Você pode acessar as rotas definidas no backend através dessa URL.

5. **Caso queira parar a Aplicação**

   Use o o comando abaixo estando na pasta do projeto:

   ```
   docker-compose down
   ```

## Modelagem de Dados

![Modelagem do banco de dados](/img/modelagem-dados-ods.png)

## Endpoints da API

### [GET] /indicador/{id}

- **Descrição**: Este endpoint retorna os detalhes de um indicador específico com base no `id` fornecido.
- **Uso**: Para usar este endpoint, faça uma requisição do tipo GET para `http://localhost:3000/indicador/{id}`, substituindo `{id}` pelo identificador do indicador que você deseja consultar.

### [GET] /objetivos

- **Descrição**: Este endpoint retorna uma lista de todos os Objetivos de Desenvolvimento Sustentável (ODS).
- **Uso**: Para acessar este endpoint, faça uma requisição do tipo GET para `http://localhost:3000/objetivos`.
