# language: pt

Funcionalidade: Favorito
  Como um usuário cadastrado no site do Submarino
  O usuário quer favoritar um produto
  Para ter acesso rápido ao mesmo

  Contexto:
    Dado que esteja logado como usuário comum

  Esquema do Cenário: Adicionar favorito
    Dado que esteja na página do produto "<produto>"
    Quando favoritar o produto
    E entrar na página Favoritos
    Então deverá ser exibido o produto "<produto>"

    Exemplos:
      | produto                                |
      | Livro - Os sete maridos de Evelyn Hugo |
      | Livro - Mulherzinhas                   |
      | Livro - Flores Para Algernon           |
      | Livro - Verity                         |

  Esquema do Cenário: Remover favorito
    Dado que tenha adicionado o produto "<produto>" como favorito
    Quando entrar na página Favoritos
    E desfavoritar o pedido
    Então não deverá ser exibido o produto "<produto>"

    Exemplos:
      | produto                                |
      | Livro - Os sete maridos de Evelyn Hugo |
      | Livro - Mulherzinhas                   |
      | Livro - Flores Para Algernon           |
      | Livro - Verity                         |