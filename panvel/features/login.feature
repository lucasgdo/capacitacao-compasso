#encoding: UTF-8
#language: pt

Funcionalidade: Login
  Como um usuário cadastrado no site das Farmácias Panvel
  O usuário quer realizar o Login
  De modo a ter acesso às funcionalidades de usuário logado

  Contexto:
    Dado que o usuário possui uma conta no sistema
    E está na página inicial
    E acessa a página de login

  Cenario: Login válido com e-mail
    Quando ele preenche o formulário de Login com seu e-mail e senha
    E clica no botão Entrar
    Entao ele deve ser redirecionado para a Home
    E deve estar logado no sistema

  Cenario: Login válido com CPF
    Quando ele preenche o formulário de Login com seu CPF e senha
    E clica no botão Entrar
    Entao ele deve ser redirecionado para a Home
    E deve estar logado no sistema

  Cenario: Login com senha incorreta
    Quando ele preenche o formulário de Login com seu e-mail e senha incorreta
    E clica no botão Entrar
    Entao ele deve visualizar um alerta de dados inválidos

  Cenario: Login faltando preencher campos
    Quando ele preenche o formulário de Login apenas com a sua senha
    E clica no botão Entrar
    Entao ele deve visualizar um alerta de campo obrigatório