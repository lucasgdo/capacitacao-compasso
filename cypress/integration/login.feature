#language: pt

Funcionalidade: Login
  Como um usuário cadastrado no site das Farmácias Panvel
  O usuário quer realizar o Login
  Para ter acesso às funcionalidades de usuário logado

  Contexto:
    Dado que esteja na página de Login

  Esquema do Cenário: Login
    Quando logar com login "<login>" e senha "<senha>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | login                 | senha           | pagina | mensagem                     |
      | lucasgdo4@gmail.com   | senhaCorreta123 | home   | LUCAS                        |
      | 07354503312           | senhaCorreta123 | home   | LUCAS                        |
      | teste@compasso.com.br | senhaCorreta123 | login  | Usuário ou Senha inválidos   |
      | thatisnotanemail      | senhaCorreta123 | login  | Usuário ou Senha inválidos   |
      |                       | senhaCorreta123 | login  | E-mail ou CPF é obrigatório. |
      | teste@compasso.com.br |                 | login  | Senha é obrigatório.         |