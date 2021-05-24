# language: pt

Funcionalidade: Produtos
  Esquema do Cenário: Listar produtos
    Quando fizer GET na rota /produtos com query params <_id>, <nome>, <preco>, <descricao> e <quantidade>
    Então deverá receber status <status> e quantidade <quantidadeResposta>

    Exemplos:
      | _id                | nome                   | preco | descricao | quantidade | status | quantidadeResposta |
      |                    |                        |       |           |            | 200    | 2                  |
      | "BeeJh5lz3k6kSIzA" |                        |       |           |            | 200    | 1                  |
      |                    | "Samsung 60 polegadas" |       |           |            | 200    | 1                  |
      |                    |                        | 470   |           |            | 200    | 1                  |
      |                    |                        |       | "TV"      |            | 200    | 1                  |
      |                    |                        |       |           | 381        | 200    | 1                  |

  Esquema do Cenário: Cadastrar produto
    Quando fizer POST na rota /produtos com body params <nome>, <preco>, <descricao> e <quantidade> e header param <Authorization>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | Authorization         | nome            | preco | descricao | quantidade | status | message                                                                                                                 |
      | "Bearer eyJhbGciO..." | "Produto teste" | 500   | "teste"   | 200        | 201    | Cadastro realizado com sucesso                                                                                          |
      | "Bearer eyJhbGciO..." |                 |       |           |            | 400    | nome é obrigatório preco é obrigatório descricao é obrigatório quantidade é obrigatório                                 |
      | "Bearer eyJhbGciO..." | "Produto teste" | 500   | "teste"   | 200        | 400    | Já existe produto com esse nome                                                                                         |
      | "Bearer eyJhbGciO..." | ""              | ""    | ""        | ""         | 400    | nome não pode ficar em branco preco deve ser um número descricao não pode ficar em branco quantidade deve ser um número |
      | "Bearer eyJhbGciO..." | 123             | 123   | 123       | 123        | 400    | nome deve ser uma string descricao deve ser uma string                                                                  |
      | "Bearer eyJhbGciO..." | true            | false | true      | false      | 400    | nome não pode ficar em branco preco deve ser um número descricao não pode ficar em branco quantidade deve ser um número |
      |                       | "Produto teste" | 500   | "teste"   | 200        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais                                         |
      | "teste"               | "Produto teste" | 500   | "teste"   | 200        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais                                         |
      | "Bearer eyJhbGciO..." | "Produto teste" | 500   | "teste"   | 200        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais                                         |
      | "Bearer eyJhbGciO..." | "Produto teste" | 500   | "teste"   | 200        | 403    | Rota exclusiva para administradores                                                                                     |


  Esquema do Cenário: Buscar produto por ID
    Quando fizer GET na rota /produtos/<id>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | id               | status | message                |
      | 0uxuPY0cbmQhpEz1 | 200    | Logitech MX Vertical   |
      | 0uxuPY0cbmQhpEz  | 400    | Produto não encontrado |

  Esquema do Cenário: Excluir produto
    Quando fizer DELETE na rota /usuarios/<id> com header param <Authorization>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | Authorization         | id               | status | message                                                                         |
      | "Bearer eyJhbGciO..." | 0uxuPY0cbmQhpEz1 | 200    | Registro excluído com sucesso                                                   |
      | "Bearer eyJhbGciO..." | 0uxuPY0cbmQhpEz  | 200    | Nenhum registro excluído                                                        |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA | 400    | Não é permitido excluir produto que faz parte de carrinho                       |
      |                       | x0G62nDRoNj6g9ic | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "teste"               | x0G62nDRoNj6g9ic | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "Bearer eyJhbGciO..." | x0G62nDRoNj6g9ic | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais |
      | "Bearer eyJhbGciO..." | x0G62nDRoNj6g9ic | 403    | Rota exclusiva para administradores                                             |

  Esquema do Cenário: Editar produto
    Quando fizer PUT na rota /usuarios/<id> com body params <nome>, <email>, <password> e <administrador>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | Authorization         | id               | nome                     | preco | descricao | quantidade | status | message                                                                                                                 |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA | "Logitech MX Vertical 2" | 470   | "Mouse"   | 381        | 200    | Registro alterado com sucesso                                                                                           |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIz  | "Logitech MX Vertical 2" | 470   | "Mouse"   | 381        | 201    | Cadastro realizado com sucesso                                                                                          |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA |                          |       |           |            | 400    | nome é obrigatório preco é obrigatório descricao é obrigatório quantidade é obrigatório                                 |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA | "Produto teste"          | 470   | "Mouse"   | 381        | 400    | Já existe produto com esse nome                                                                                         |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA | ""                       | ""    | ""        | ""         | 400    | nome não pode ficar em branco preco deve ser um número descricao não pode ficar em branco quantidade deve ser um número |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA | 123                      | 123   | 123       | 123        | 400    | nome deve ser uma string descricao deve ser uma string                                                                  |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA | true                     | false | true      | false      | 400    | nome não pode ficar em branco preco deve ser um número descricao não pode ficar em branco quantidade deve ser um número |
      |                       | BeeJh5lz3k6kSIzA | "Produto teste"          | 500   | "teste"   | 200        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais                                         |
      | "teste"               | BeeJh5lz3k6kSIzA | "Produto teste"          | 500   | "teste"   | 200        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais                                         |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA | "Produto teste"          | 500   | "teste"   | 200        | 401    | Token de acesso ausente, inválido, expirado ou usuário do token não existe mais                                         |
      | "Bearer eyJhbGciO..." | BeeJh5lz3k6kSIzA | "Produto teste"          | 500   | "teste"   | 200        | 403    | Rota exclusiva para administradores                                                                                     |