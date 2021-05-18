# language: pt

Funcionalidade: Login
  Como um usuário cadastrado no site das Lojas Americanas
  O usuário quer realizar o Login
  Para ter acesso às funcionalidades de usuário logado

  Contexto:
    Dado que esteja na página de Login

  Esquema do Cenário: Login interno
    Quando logar com e-mail "<e-mail>" e senha "<senha>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | e-mail                | senha             | pagina | mensagem                   |
      | teste@compasso.com.br | senhaCorreta@123  | home   | olá Teste                  |
      | thatisnotanemail      | senhaCorreta@123  | login  | E-mail ou senha incorretos |
      | teste@compasso.com.br | enhaIncorreta@321 | login  | E-mail ou senha incorretos |
      |                       | senhaCorreta@123  | login  | Preencha este campo.       |
      | teste@compasso.com.br |                   | login  | Preencha este campo.       |

  # Como o login com o Facebook é um sistema terceiro ao que está sendo testado, não incluí os dados de login.
  Esquema do Cenário: Login com Facebook
    Quando logar com o Facebook
    E o resultado for "<status>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | status  | pagina | mensagem                            |
      | sucesso | home   | olá Teste                           |
      | erro    | login  | Ocorreu um erro na sua autenticação |