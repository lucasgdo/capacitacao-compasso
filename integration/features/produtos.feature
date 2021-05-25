# language: pt

Funcionalidade: Produtos
  Contexto:
    Dado que possui um bearer token de login admin

  Esquema do Cenário: Listar produtos
    Quando listar produtos com query params <_id>, <nome>, <preco>, <descricao> e <quantidade>
    Então deverá ser retornado o schema "get_produtos" e status 200

    Exemplos:
      | _id              | nome                 | preco | descricao | quantidade |
      |                  |                      |       |           |            |
      | BeeJh5lz3k6kSIzA |                      |       |           |            |
      |                  | Samsung 60 polegadas |       |           |            |
      |                  |                      | 470   |           |            |
      |                  |                      |       | TV        |            |
      |                  |                      |       |           | 381        |

  Esquema do Cenário: Cadastrar produto
    Quando cadastrar produto com body params <nome>, <preco>, <descricao> e <quantidade>
    Então deverá ser retornado o schema "post_produtos" e status <status>

    Exemplos:
      | nome            | preco | descricao | quantidade | status |
      | "Produto teste" | 500   | "teste"   | 200        | 201    |
      |                 |       |           |            | 400    |
      | "Produto teste" | 500   | "teste"   | 200        | 400    |
      | ""              | ""    | ""        | ""         | 400    |
      | 123             | 123   | 123       | 123        | 400    |
      | true            | false | true      | false      | 400    |

  Esquema do Cenário: Buscar produto por ID
    Quando buscar produto por id <id>
    Então deverá ser retornado o schema "get_produtos_id" e status <status>

    Exemplos:
      | id          | status |
      | existente   | 200    |
      | inexistente | 400    |

  Esquema do Cenário: Excluir produto
    Quando excluir um produto <produto>
    Então deverá ser retornado o schema "delete_produtos" e status <status>

    Exemplos:
      | produto      | status |
      | existente    | 200    |
      | inexistente  | 200    |
      | com carrinho | 400    |

  Esquema do Cenário: Editar produto
    Quando editar produto <id> com body params <nome>, <preco>, <descricao> e <quantidade>
    Então deverá ser retornado o schema "put_produtos" e status <status>

    Exemplos:
      | id          | nome                     | preco | descricao | quantidade | status |
      | existente   | "Logitech MX Vertical 2" | 470   | "Mouse"   | 381        | 200    |
      | inexistente | "Logitech MX Vertical 2" | 470   | "Mouse"   | 381        | 201    |
      | existente   |                          |       |           |            | 400    |
      | existente   | "Produto teste"          | 470   | "Mouse"   | 381        | 400    |
      | existente   | ""                       | ""    | ""        | ""         | 400    |
      | existente   | 123                      | 123   | 123       | 123        | 400    |
      | existente   | true                     | false | true      | false      | 400    |