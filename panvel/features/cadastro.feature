#encoding: UTF-8
#language: pt

Funcionalidade: Cadastro
  Como um usuário não cadastrado no site das Farmácias Panvel
  O usuário quer realizar o Cadastro
  De modo a possuir uma conta no site

  Contexto:
    Dado que o usuário está na página inicial
    E acessa a página de Login
    E acessa a página de Cadastro

  Cenario: Cadastro válido
    Quando o usuário preenche o formulário com seus dados
    E clica no botão Continuar
    Entao um modal com informações ao usuário sobre a criação de senha deve aparecer
    E um link deve ser enviado ao e-mail fornecido

  Cenario: Cadastro com e-mail já utilizado
    Quando o usuário preenche o campo de e-mail utilizando um e-mail que já possui um cadastro
    E tira o foco do campo de e-mail
    Entao ele deve visualizar um alerta de e-mail já cadastrado

  Cenario: Cadastro com CPF já utilizado
    Quando o usuário preenche o campo de CPF utilizando um CPF que já possui cadastro
    E tira o foco do campo de CPF
    Entao ele deve visualizar um alerta de CPF já cadastrado

  Cenario: Cadastro com e-mail fora do formato permitido
    Quando o usuário preenche o campo de e-mail utilizando um e-mail fora do formato permitido
    E tira o foco do campo de e-mail
    Entao ele deve visualizar um alerta de e-mail fora do formato permitido

  Cenario: Cadastro com CPF inválido
    Quando o usuário preenche o campo de CPF utilizando um CPF inválido
    E tira o foco do campo de CPF
    Entao ele deve visualizar um alerta de CPF inválido

  Cenario: Cadastro faltando preencher campos
    Quando o usuário preenche o formulário faltando o campo de CPF
    E clica no botão Continuar
    Entao ele deve visualizar um alerta de campo obrigatório