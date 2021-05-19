# language: pt

Funcionalidade: Endereço

  Contexto:
    Dado que esteja na página de Meus dados

  Esquema do Cenário: Adicionar endereço
    Quando adicionar um endereço com nome completo "<nome_completo>", cep "<cep>", número "<numero>", tipo de endereço "<tipo>" e telefone "<telefone>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | nome_completo | cep      | numero | tipo     | telefone    | pagina             | mensagem                        |
      | Nome válido   | 79905332 | 557    | Trabalho | 67982631762 | meus_dados         | Rua Venceslau Braz 557          |
      | Nome válido   | 79905332 | 557    | Casa     | 67982631762 | meus_dados         | Rua Venceslau Braz 557          |
      | a             | 79905332 | 557    | Casa     | 67982631762 | adicionar_endereco | Digite pelo menos 5 caracteres. |
      | Testes        | 79905332 | 557    | Casa     | 67982631762 | adicionar_endereco | Insira o nome completo.         |
      |               | 79905332 | 557    | Casa     | 67982631762 | adicionar_endereco | Preencha esse dado.             |
      | Nome válido   | 7990533  | 557    | Casa     | 67982631762 | meus_dados         | Digite um CEP válido.           |
      | Nome válido   | 79905332 | abc    | Casa     | 67982631762 | meus_dados         | Insira apenas números.          |
      | Nome válido   | 79905332 |        | Casa     | 67982631762 | meus_dados         | Preencha esse dado.             |
      | Nome válido   | 79905332 | 557    |          | 67982631762 | meus_dados         | Preencha esse dado.             |
      | Nome válido   | 79905332 | 557    | Casa     | abc         | meus_dados         | Revise este dado.               |
      | Nome válido   | 79905332 | 557    | Casa     | 1234567     | meus_dados         | Digite pelo menos 8 caracteres. |

  Esquema do Cenário: Editar endereço
    Dado que possua um endereço cadastrado
    Quando editar um endereço com nome completo "<nome_completo>", cep "<cep>", número "<numero>", tipo de endereço "<tipo>" e telefone "<telefone>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | nome_completo | cep      | numero | tipo     | telefone    | pagina             | mensagem                        |
      | Nome válido   | 79905332 | 557    | Trabalho | 67982631762 | meus_dados         | Rua Venceslau Braz 557          |
      | Nome válido   | 79905332 | 557    | Casa     | 67982631762 | meus_dados         | Rua Venceslau Braz 557          |
      | a             | 79905332 | 557    | Casa     | 67982631762 | adicionar_endereco | Digite pelo menos 5 caracteres. |
      | Testes        | 79905332 | 557    | Casa     | 67982631762 | adicionar_endereco | Insira o nome completo.         |
      |               | 79905332 | 557    | Casa     | 67982631762 | adicionar_endereco | Preencha esse dado.             |
      | Nome válido   | 7990533  | 557    | Casa     | 67982631762 | meus_dados         | Digite um CEP válido.           |
      | Nome válido   | 79905332 | abc    | Casa     | 67982631762 | meus_dados         | Insira apenas números.          |
      | Nome válido   | 79905332 |        | Casa     | 67982631762 | meus_dados         | Preencha esse dado.             |
      | Nome válido   | 79905332 | 557    |          | 67982631762 | meus_dados         | Preencha esse dado.             |
      | Nome válido   | 79905332 | 557    | Casa     | abc         | meus_dados         | Revise este dado.               |
      | Nome válido   | 79905332 | 557    | Casa     | 1234567     | meus_dados         | Digite pelo menos 8 caracteres. |