#encoding: UTF-8
#language: pt

Funcionalidade: Cadastro
  Como um usuário não cadastrado no site das Farmácias Panvel
  O usuário quer realizar o Cadastro
  Para possuir uma conta no site

  Contexto:
    Dado que esteja na página de Cadastro

  Esquema do Cenário: Cadastro
    Quando realizar o cadastro com nome "<nome>", e-mail "<e-mail>" e cpf "<cpf>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | nome  | e-mail        | cpf           | pagina     | mensagem                                                         |
      | Teste | não utilizado | não utilizado | criarSenha | CONFIRME SEU E-MAIL                                              |
      | Teste | já utilizado  | não utilizado | cadastro   | Este email já possui cadastro.                                   |
      | Teste | não utilizado | já utilizado  | cadastro   | Este cpf já possui cadastro, caso necessário redefina sua senha! |
      | Teste | inválido      | não utilizado | cadastro   | Email não é válido.                                              |
      | Teste | não utilizado | inválido      | cadastro   | Cpf é inválido.                                                  |
      |       | não utilizado | inválido      | cadastro   | Nome é obrigatório.                                              |
      | Teste |               | inválido      | cadastro   | Campo obrigatório.                                               |
      | Teste | não utilizado |               | cadastro   | Cpf é obrigatório.                                               |