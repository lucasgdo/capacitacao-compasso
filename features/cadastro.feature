# language: pt

Funcionalidade: Cadastro
  Como um usuário não cadastrado
  O usuário quer realizar o cadastro
  Para possuir uma conta no site

  Contexto:
    Dado que esteja na página de cadastro

  Esquema do Cenário: Cadastro pessoal
    Quando realizar o cadastro com nome "<nome>", sobrenome "<sobrenome>", cpf "<cpf>", e-mail "<email>" e senha "<senha>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | nome  | sobrenome | cpf         | email                 | senha            | pagina   | mensagem                                                        |
      | Teste | Teste     | 93511868068 | teste@compasso.com.br | senhaCorreta@123 | home     | Olá Teste                                                       |
      | T     | Teste     | 93511868068 | teste@compasso.com.br | senhaCorreta@123 | cadastro | Digite pelo menos 2 caracteres.                                 |
      | Teste | T         | 93511868068 | teste@compasso.com.br | senhaCorreta@123 | cadastro | Digite pelo menos 2 caracteres.                                 |
      | Teste | Teste     | abcdefghijk | teste@compasso.com.br | senhaCorreta@123 | cadastro | Só é possível inserir números.                                  |
      | Teste | Teste     | 9351186806  | teste@compasso.com.br | senhaCorreta@123 | cadastro | Digite pelo menos 11 caracteres.                                |
      | Teste | Teste     | 93511868068 | thatisnotanemail      | senhaCorreta@123 | cadastro | Utilize o formato nome@exemplo.com                              |
      | Teste | Teste     | 93511868068 | teste@compasso.com.br | senha            | cadastro | Digite pelo menos 6 caracteres.                                 |
      | Teste | Teste     | 93511868068 | teste@compasso.com.br | 123456           | cadastro | Use números e letras que não se repitam nem sejam correlativos. |
      | Teste | Teste     | 93511868068 | teste@compasso.com.br | teste            | cadastro | Escolha uma senha diferente do seu nome e sobrenome.            |

  Esquema do Cenário: Cadastro de empresa
    Quando realizar o cadastro com CNPJ "<cnpj>", razão social "<razao_social>", e-mail "<email>", e senha "<senha>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | cnpj           | razao_social | email                 | senha            | pagina   | mensagem                                                        |
      | 25878698000173 | Teste        | teste@compasso.com.br | senhaCorreta@123 | home     | Olá Teste                                                       |
      | 25878698000174 | Teste        | teste@compasso.com.br | senhaCorreta@123 | cadastro | É inválido. Digite novamente.                                   |
      | abcdefghijklmn | Teste        | teste@compasso.com.br | senhaCorreta@123 | cadastro | Restam 14 caracteres                                            |
      | 2587869800017  | Teste        | teste@compasso.com.br | senhaCorreta@123 | cadastro | Restam 1 caracteres.                                            |
      | 25878698000173 | Teste        | teste@compasso.com.br | senha            | cadastro | Insira pelo menos 6 caracteres.                                 |
      | 25878698000173 | Teste        | teste@compasso.com.br | 123456           | cadastro | Use números e letras que não se repitam nem sejam correlativos. |
      | 25878698000173 | Testes       | teste@compasso.com.br | testes           | cadastro | A senha não pode coincidir com a razão social.                  |