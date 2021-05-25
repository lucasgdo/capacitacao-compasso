# language: pt

Funcionalidade: Login
  @login
  Esquema do Cenário: Realizar login
    Quando realizar login com <email> e <password>
    Então deverá ser retornado o schema "post_login" e status <status>

    Exemplos:
      | email           | password | status |
      | "fulano@qa.com" | "teste"  | 200    |
      | "fulanoqa.com"  | "teste"  | 400    |
      | "fulano@qa.com" | "t"      | 401    |
      |                 |          | 400    |
      | ""              | ""       | 400    |
      | 123             | 123      | 400    |
      | true            | false    | 400    |