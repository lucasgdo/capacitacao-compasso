# language: pt

Funcionalidade: Produtos
  Esquema do Cenário: Listar carrinhos
    Dado que possui um bearer token de login admin
    Quando listar carrinhos com query params <_id>, <precoTotal>, <quantidadeTotal> e <idUsuario>
    Então deverá ser retornado o schema "get_carrinhos" e status 200

    Exemplos:
      | _id              | precoTotal | quantidadeTotal | idUsuario        |
      |                  |            |                 |                  |
      | 7rkD8B6bAFRWQy5o |            |                 |                  |
      |                  | 6180       |                 |                  |
      |                  |            | 1               |                  |
      |                  |            |                 | oUb7aGkMtSEPf6BZ |
      |                  |            |                 |                  |

  Esquema do Cenário: Cadastrar carrinhos
    Dado que possui um bearer token de login admin
    Quando cadastrar carrinho com body param <produtos>
    Então deverá ser retornado o schema "post_carrinhos" e status <status>

    Exemplos:
      | produtos                                                                   | status |
      | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1}]                        | 201    |
      |                                                                            | 400    |
      | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1}]                        | 400    |
      | ""                                                                         | 400    |
      | 123                                                                        | 400    |
      | true                                                                       | 400    |
      | [""]                                                                       | 400    |
      | [123]                                                                      | 400    |
      | [true]                                                                     | 400    |
      | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1,"campoExtra" : "teste"}] | 400    |


  Esquema do Cenário: Buscar carrinho por ID
    Dado que possui um bearer token de login admin
    Quando buscar carrinho "<carrinho>"
    Então deverá ser retornado o schema "get_carrinhos_id" e status <status>

    Exemplos:
      | id          | status |
      | existente   | 200    |
      | inexistente | 400    |

  Esquema do Cenário: Excluir carrinho
    Dado que possui um bearer token de login "<token>"
    Quando excluir carrinho
    Então deverá ser retornado o schema "delete_carrinhos" e status 200

    Exemplos:
      | token        | status |
      | com carrinho | 200    |
      | sem carrinho | 200    |

  Esquema do Cenário: Excluir carrinho e retornar produtos para estoque
    Dado que possui um bearer token de login "<token>"
    Quando excluir carrinho e retornar produtos para estoque
    Então deverá ser retornado o schema "delete_retorna_carrinhos" e status 200

    Exemplos:
      | token        |
      | com carrinho |
      | sem carrinho |