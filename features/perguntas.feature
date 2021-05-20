# language: pt

Funcionalidade: Perguntas

  Contexto:
    Dado que esteja na página de Perguntas

  Cenário: Remover pergunta
    Dado que possua uma pergunta "<pergunta>" realizada
    Quando remover a pergunta "<pergunta>"
    Então não deverá ser exibida a pergunta "<pergunta>"

    Exemplos:
      | pergunta                  |
      | Você tem loja física?     |
      | Qual o estado do produto? |