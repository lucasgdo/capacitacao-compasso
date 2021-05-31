#language: pt

Funcionalidade: Cadastro
  Como um usuário não cadastrado no site das Farmácias Panvel
  O usuário quer realizar o Cadastro
  Para possuir uma conta no site

  Contexto:
    Dado que esteja na página de Cadastro

  Esquema do Cenário: Cadastro
    Quando realizar o cadastro com nome "<nome>", e-mail "<e-mail>" e cpf "<cpf>"
    Então deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | nome          | e-mail        | cpf           | mensagem                                                         |
      | não utilizado | não utilizado | não utilizado | CONFIRME SEU E-MAIL                                              |
      | não utilizado | já utilizado  | não utilizado | Este email já possui cadastro.                                   |
      | não utilizado | não utilizado | já utilizado  | Este cpf já possui cadastro, caso necessário redefina sua senha! |
      | não utilizado | inválido      | não utilizado | Email não é válido.                                              |
      | não utilizado | não utilizado | inválido      | Cpf é inválido.                                                  |
      |               | não utilizado | não utilizado | AVISO                                                            |
      | não utilizado |               | não utilizado | Campo obrigatório.                                               |
      | não utilizado | não utilizado |               | AVISO                                                            |