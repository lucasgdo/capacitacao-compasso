#encoding: UTF-8
#language: pt

Funcionalidade: Login
  Como um usuário cadastrado no site das Farmácias Panvel
  O usuário quer realizar o Login
  Para ter acesso às funcionalidades de usuário logado

  Contexto:
    Dado que esteja na página de Login

  Esquema do Cenário: Login
    Quando logar com "<login>" e senha "<senha>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | login                 | senha             | pagina | mensagem                     |
      | teste@compasso.com.br | senhaCorreta@123  | home   | olá Teste                    |
      | 97486558068           | senhaCorreta@123  | home   | olá Teste                    |
      | thatisnotanemail      | senhaCorreta@123  | login  | USUÁRIO OU SENHA INVÁLIDOS   |
      | teste@compasso.com.br | enhaIncorreta@321 | login  | USUÁRIO OU SENHA INVÁLIDOS   |
      |                       | senhaCorreta@123  | login  | E-mail ou CPF é obrigatório. |
      | teste@compasso.com.br |                   | login  | Senha é obrigatório.         |