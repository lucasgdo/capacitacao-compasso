# language: pt

Funcionalidade: Usuários
  Esquema do Cenário: Listar usuários
    Quando fizer GET na rota /usuarios com query params <_id>, <nome>, <email>, <password> e <administrador>
    Então deverá receber status <status> e quantidade <quantidade>

    Exemplos:
      | _id                | nome        | email                       | password | administrador | status | quantidade |
      |                    |             |                             |          |               | 200    | 16         |
      | "0uxuPY0cbmQhpEz1" |             |                             |          |               | 200    | 1          |
      |                    | "Celestino" |                             |          |               | 200    | 1          |
      |                    |             | "Myrna_Johnson@hotmail.com" |          |               | 200    | 1          |
      |                    |             |                             | "teste"  |               | 200    | 4          |
      |                    |             |                             |          | "true"        | 200    | 19         |

  Esquema do Cenário: Cadastrar usuário
    Quando fizer POST na rota /usuarios com body params <nome>, <email>, <password> e <administrador>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | nome              | email              | password | administrador | status | message                                                                                                                                 |
      | "Fulano da Silva" | "teste@qa.com.br"  | "teste"  | "true"        | 201    | Cadastro realizado com sucesso                                                                                                          |
      |                   |                    |          |               | 400    | nome é obrigatório email é obrigatório password é obrigatório administrador é obrigatório                                               |
      | "Fulano da Silva" | "teste@qa.com.br"  | "teste"  | "true"        | 400    | Este email já está sendo usado                                                                                                          |
      | "Teste"           | "thatisnotanemail" | "teste"  | "true"        | 400    | email deve ser um email válido                                                                                                          |
      | ""                | ""                 | ""       | ""            | 400    | nome não pode ficar em branco email não pode ficar em branco password não pode ficar em branco administrador deve ser 'true' ou 'false' |
      | 123               | 123                | 123      | 123           | 400    | nome deve ser uma string email deve ser uma string password deve ser uma string administrador deve ser 'true' ou 'false'                |
      | true              | false              | true     | false         | 400    | nome deve ser uma string email deve ser uma string password deve ser uma string administrador deve ser 'true' ou 'false'                |

  Esquema do Cenário: Buscar usuário por ID
    Quando fizer GET na rota /usuarios/<id>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | id               | status | message                |
      | 0uxuPY0cbmQhpEz1 | 200    | Fulano da Silva        |
      | 0uxuPY0cbmQhpEz  | 400    | Usuário não encontrado |

  Esquema do Cenário: Excluir usuário
    Quando fizer DELETE na rota /usuarios/<id>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | id               | status | message                                                 |
      | 0uxuPY0cbmQhpEz1 | 200    | Registro excluído com sucesso                           |
      | 0uxuPY0cbmQhpEz  | 200    | Nenhum registro excluído                                |
      | 4NaszuF4cn1gS7l8 | 400    | Não é permitido excluir usuário com carrinho cadastrado |

  Esquema do Cenário: Editar usuário
    Quando fizer PUT na rota /usuarios/<id> com body params <nome>, <email>, <password> e <administrador>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | id               | nome              | email                 | password | administrador | status | message                                                                                                                                 |
      | 4NaszuF4cn1gS7l8 | "Fulano da Silva" | "testeeeee@qa.com.br" | "teste"  | "true"        | 200    | Registro alterado com sucesso                                                                                                           |
      | abc              | "Fulano da Silva" | "testeqa@qa.com.br"   | "teste"  | "true"        | 201    | Cadastro realizado com sucesso                                                                                                          |
      | 4NaszuF4cn1gS7l8 |                   |                       |          |               | 400    | nome é obrigatório email é obrigatório password é obrigatório administrador é obrigatório                                               |
      | 4NaszuF4cn1gS7l8 | "Fulano da Silva" | "testeqa@qa.com.br"   | "teste"  | "true"        | 400    | Este email já está sendo usado                                                                                                          |
      | 4NaszuF4cn1gS7l8 | "Fulano da Silva" | "thatisnotanemail"    | "teste"  | "true"        | 400    | email deve ser um email válido                                                                                                          |
      | 4NaszuF4cn1gS7l8 | ""                | ""                    | ""       | ""            | 400    | nome não pode ficar em branco email não pode ficar em branco password não pode ficar em branco administrador deve ser 'true' ou 'false' |
      | 4NaszuF4cn1gS7l8 | 123               | 123                   | 123      | 123           | 400    | nome deve ser uma string email deve ser uma string password deve ser uma string administrador deve ser 'true' ou 'false'                |
      | 4NaszuF4cn1gS7l8 | true              | false                 | true     | false         | 400    | nome deve ser uma string email deve ser uma string password deve ser uma string administrador deve ser 'true' ou 'false'                |