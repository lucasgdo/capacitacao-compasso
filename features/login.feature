# language: pt

Funcionalidade: Login
  Como um usuário cadastrado
  O usuário quer realizar o Login
  Para ter acesso às funcionalidades de usuário logado

  Contexto:
    Dado que esteja na página de Login

  Esquema do Cenário: Login
    Quando logar com "<login>" e senha "<senha>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | login                 | senha             | pagina | mensagem                        |
      | teste@compasso.com.br | senhaCorreta@123  | home   | Olá Teste                       |
      | 65996899079           | senhaCorreta@123  | home   | Olá Teste                       |
      | Teste                 | senhaCorreta@123  | home   | Olá Teste                       |
      | thatisnotanemail      | senhaCorreta@123  | login  | Revise o seu e-mail ou usuário. |
      | 123456789             | senhaCorreta@123  | login  | Revise seu número de telefone.  |
      | teste@compasso.com.br | enhaIncorreta@321 | login  | Revise a sua senha.             |
      |                       | senhaCorreta@123  | login  | Preencha esse dado.             |
      | teste@compasso.com.br |                   | login  | Preencha esse dado.             |