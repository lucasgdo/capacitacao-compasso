# language: pt

Funcionalidade: Carrinho

  Contexto:
    Dado que esteja na página do carrinho

  Esquema do Cenário: Salvar produto
    Quando salvar o produto "<produto>"
    Então "<produto>" não deve aparecer no carrinho
    E "<produto>" deve aparecer nos produtos salvos

    Exemplos:
      | produto                                               |
      | Smart Tv Aoc 32s5195/78g Led Hd 32                    |
      | Smart TV LG AI ThinQ 32LM621CBSB LED HD 32" 100V/240V |

  Esquema do Cenário: Alterar quantidade de um produto
    Quando "<alterar>" uma unidade do produto "<produto>"
    Então o valor <valor> deve ser "<operacao>" ao total

    Exemplos:
      | produto                                               | alterar   | valor | operacao  |
      | Smart Tv Aoc 32s5195/78g Led Hd 32                    | adicionar | 1369  | somado    |
      | Smart Tv Aoc 32s5195/78g Led Hd 32                    | remover   | 1369  | subtraido |
      | Smart TV LG AI ThinQ 32LM621CBSB LED HD 32" 100V/240V | adicionar | 1479  | somado    |
      | Smart TV LG AI ThinQ 32LM621CBSB LED HD 32" 100V/240V | remover   | 1479  | subtraido |

  Esquema do Cenário: Remover produto
    Quando remover o produto "<produto>"
    Então "<produto>" não deve aparecer no carrinho

    Exemplos:
      | produto                                               |
      | Smart Tv Aoc 32s5195/78g Led Hd 32                    |
      | Smart TV LG AI ThinQ 32LM621CBSB LED HD 32" 100V/240V |