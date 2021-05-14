# language: pt

Funcionalidade: Pesquisa sobre Quality Assurance

  Cenario: Abertura da primeira imagem
    Dado que o usuário está na página inicial do Google
    Quando ele busca por imagens sobre "Quality Assurance"
    E seleciona o primeiro resultado
    Entao o resultado selecionado deve ser realçado
    E um bloco com os dados do resultado selecionado deve ser apresentado