# Desafio OxeAnBits - Ruby on Rails

Bem-vindo ao projeto Desafio OxeAnBits em Ruby on Rails! Este README fornece informações sobre como executar o sistema localmente e explica algumas rotas importantes.

## Clonando o Projeto

Para obter uma cópia do projeto, execute o seguinte comando no terminal:

```bash
git clone https://github.com/DevThiagoSoares/desafio-oxeanbits-ruby.git
```

## Executando o Projeto Ruby on Rails

1. Certifique-se de ter Ruby e Rails instalados em seu sistema.
2. Navegue até o diretório do projeto:

    ```bash
    cd desafio-oxeanbits-ruby
    ```

3. Instale as dependências:

    ```bash
    bundle install
    ```

4. Execute as migrações do banco de dados:

    ```bash
    rails db:migrate
    ```

5. Inicie o servidor Rails:

    ```bash
    rails server
    ```

Acesse o sistema em [http://localhost:3000](http://localhost:3000).

## Rotas Importantes

- **Login ou Página Inicial:** `/` ou `/login`
  - Email: admin@rotten
  - Senha: admin

- **Tela de Filmes:** `/movies`
  - **Adicionar Novo Filme:** `/movies/new`
    - Parâmetros necessários: `title` e `director`
  
  - **Adicionar Múltiplos Filmes:** `/movies/add_multiple`
    - Envie um JSON com o seguinte formato:
      ```json
      {
        "movies": [
          { "title": "Movie 1", "director": "Director 1" },
          { "title": "Movie 2", "director": "Director 2" }
        ]
      }
      ```
  
  - **Atualizar Scores:** `/movie_scores/update_scores`
    - Envie um JSON com o seguinte formato:
      ```json
      [
        { "movie_id": 1, "score": 4 },
        { "movie_id": 2, "score": 4 }
      ]
      ```

  - **Atualizar Score Individual:** Acesse a tela de filmes em `/movies` e atualize o campo `rate`.
