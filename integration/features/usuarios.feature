# language: pt

Funcionalidade: Usuários
  Esquema do Cenário: Listar usuários
    Quando listar usuários com query params <_id>, <nome>, <email>, <password> e <administrador>
    Então deverá ser retornado o schema "get_usuarios" e status 200

    Exemplos:
      | _id                | nome        | email                       | password | administrador | status |
      |                    |             |                             |          |               | 200    |
      | "0uxuPY0cbmQhpEz1" |             |                             |          |               | 200    |
      |                    | "Celestino" |                             |          |               | 200    |
      |                    |             | "Myrna_Johnson@hotmail.com" |          |               | 200    |
      |                    |             |                             | "teste"  |               | 200    |
      |                    |             |                             |          | "true"        | 200    |

  Esquema do Cenário: Cadastrar usuário
    Quando cadastrar usuário com body params <nome>, <email>, <password> e <administrador>
    Então deverá ser retornado o schema "post_usuarios" e status <status>

    Exemplos:
      | nome              | email              | password | administrador | status |
      | "Fulano da Silva" | "teste@qa.com.br"  | "teste"  | "true"        | 201    |
      |                   |                    |          |               | 400    |
      | "Fulano da Silva" | "teste@qa.com.br"  | "teste"  | "true"        | 400    |
      | "Teste"           | "thatisnotanemail" | "teste"  | "true"        | 400    |
      | ""                | ""                 | ""       | ""            | 400    |
      | 123               | 123                | 123      | 123           | 400    |
      | true              | false              | true     | false         | 400    |

  Esquema do Cenário: Buscar usuário por ID
    Quando buscar produto por id <id>
    Então deverá ser retornado o schema "get_usuarios_id" e status <status>

    Exemplos:
      | id          | status |
      | existente   | 200    |
      | inexistente | 400    |

  Esquema do Cenário: Excluir usuário
    Quando excluir usuário "<usuario>"
    Então deverá ser retornado o schema "delete_usuarios" e status <status>
    Exemplos:
      | usuario      | status |
      | existente    | 200    |
      | inexistente  | 200    |
      | com carrinho | 400    |

  Esquema do Cenário: Editar usuário
    Quando editar usuário "<usuario>" com body params <nome>, <email>, <password> e <administrador>
    Então deverá ser retornado o schema "put_usuarios" e status <status>

    Exemplos:
      | usuario     | nome              | email                 | password | administrador | status |
      | existente   | "Fulano da Silva" | "testeeeee@qa.com.br" | "teste"  | "true"        | 200    |
      | inexistente | "Fulano da Silva" | "testeqa@qa.com.br"   | "teste"  | "true"        | 201    |
      | existente   |                   |                       |          |               | 400    |
      | existente   | "Fulano da Silva" | "testeqa@qa.com.br"   | "teste"  | "true"        | 400    |
      | existente   | "Fulano da Silva" | "thatisnotanemail"    | "teste"  | "true"        | 400    |
      | existente   | ""                | ""                    | ""       | ""            | 400    |
      | existente   | 123               | 123                   | 123      | 123           | 400    |
      | existente   | true              | false                 | true     | false         | 400    |