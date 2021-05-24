# language: pt

Funcionalidade: Login
  Esquema do Cenário: Realizar login
    Quando fizer POST na rota /login com body params <email> e <password>
    Então deverá receber status <status> e mensagem "<message>"

    Exemplos:
      | email           | password | status | message                                                          |
      | "fulano@qa.com" | "teste"  | 200    | Login realizado com sucesso                                      |
      | "fulanoqa.com"  | "teste"  | 400    | email deve ser um email válido                                   |
      | "fulano@qa.com" | "t"      | 401    | Email e/ou senha inválidos                                       |
      |                 |          | 400    | email é obrigatório password é obrigatório                       |
      | ""              | ""       | 400    | email não pode ficar em branco password não pode ficar em branco |
      | 123             | 123      | 400    | email deve ser uma string password deve ser uma string           |
      | true            | false    | 400    | email deve ser uma string password deve ser uma string           |