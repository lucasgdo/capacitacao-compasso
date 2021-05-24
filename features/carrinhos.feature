# language: pt

Funcionalidade: Produtos
  Esquema do Cenário: Listar carrinhos
    Quando fizer GET na rota /carrinhos com query params <_id>, <precoTotal>, <quantidadeTotal> e <idUsuario>
    Então deverá receber status <status> e quantidade <quantidadeResposta>

    Exemplos:
      | _id                | precoTotal             | quantidadeTotal | idUsuario | status | quantidadeResposta |
      |                    |                        |                 |           | 200    | 2                  |
      | "BeeJh5lz3k6kSIzA" |                        |                 |           | 200    | 1                  |
      |                    | "Samsung 60 polegadas" |                 |           | 200    | 1                  |
      |                    |                        | 470             |           | 200    | 1                  |
      |                    |                        |                 | "TV"      | 200    | 1                  |
      |                    |                        |                 |           | 200    | 1                  |

  Esquema do Cenário: Cadastrar carrinhos
    Quando fizer POST na rota /carrinhos com body params <produtos>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | Authorization         | produtos                                                                   | status | message                                                                         |
      | "Bearer eyJhbGciO..." | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1}]                        | 201    | Cadastro realizado com sucesso                                                  |
      | "Bearer eyJhbGciO..." |                                                                            | 400    | produtos é obrigatório                                                          |
      | "Bearer eyJhbGciO..." | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1}]                        | 400    | Não é permitido ter mais de 1 carrinho                                          |
      | "Bearer eyJhbGciO..." | ""                                                                         | 400    | produtos deve ser um array                                                      |
      | "Bearer eyJhbGciO..." | 123                                                                        | 400    | produtos deve ser um array                                                      |
      | "Bearer eyJhbGciO..." | true                                                                       | 400    | produtos deve ser um array                                                      |
      | "Bearer eyJhbGciO..." | [""]                                                                       | 400    | produtos[0] deve ser um objeto produtos não contém 1 valor obrigatório          |
      | "Bearer eyJhbGciO..." | [123]                                                                      | 400    | produtos[0] deve ser um objeto produtos não contém 1 valor obrigatório          |
      | "Bearer eyJhbGciO..." | [true]                                                                     | 400    | produtos[0] deve ser um objeto produtos não contém 1 valor obrigatório          |
      | "Bearer eyJhbGciO..." | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1,"campoExtra" : "teste"}] | 400    | produtos[0].campoExtra não é permitido produtos não contém 1 valor obrigatório  |
      |                       | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1}]                        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "teste"               | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1}]                        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "Bearer eyJhbGciO..." | [{"idProduto": "BeeJh5lz3k6kSIzA","quantidade": 1}]                        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |


  Esquema do Cenário: Buscar carrinho por ID
    Quando fizer GET na rota /carrinhos/<id>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | id               | status | message                 |
      | 7rkD8B6bAFRWQy5o | 200    | 7rkD8B6bAFRWQy5o        |
      | 7rkD8B6bAFRWQy5  | 400    | Carrinho não encontrado |

  Esquema do Cenário: Excluir carrinho
    Quando fizer DELETE na rota /carrinhos/concluir-compra/ com header param <Authorization>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | Authorization         | status | message                                                                         |
      | "Bearer eyJhbGciO..." | 200    | Registro excluído com sucesso                                                   |
      | "Bearer eyJhbGciO..." | 200    | Não foi encontrado carrinho para esse usuário                                   |
      |                       | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "teste"               | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "Bearer eyJhbGciO..." | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |

  Esquema do Cenário: Excluir carrinho e retornar produtos para estoque
    Quando fizer DELETE na rota /carrinhos/cancelar-compra com header param <Authorization>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | Authorization         | status | message                                                                         |
      | "Bearer eyJhbGciO..." | 200    | Registro excluído com sucesso. Estoque dos produtos reabastecido                |
      | "Bearer eyJhbGciO..." | 200    | Não foi encontrado carrinho para esse usuário                                   |
      |                       | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "teste"               | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "Bearer eyJhbGciO..." | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |