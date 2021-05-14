# language: pt

Funcionalidade: Endereço
  Como um usuário cadastrado no site do Submarino
  O usuário quer adicionar um endereço
  Para usá-lo na compra de um produto

  Contexto:
    Dado que esteja logado como usuário comum

  Esquema do Cenário: Adicionar endereço
    Dado que esteja na página de Endereços
    Quando adicionar um endereço com nome do destinatário "<destinatario>", tipo de endereço "<tipo>", cep "<cep>", número "<numero>" e referência "<referencia>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | destinatario | tipo        | cep      | numero | referencia | pagina        | mensagem                                                                                    |
      | Nome válido  | Apartamento | 59056410 | 100    | Referência | enderecos     | Endereço criado com sucesso.                                                                |
      |              | Apartamento | 59056410 | 100    | Referência | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Inválido     | Apartamento | 59056410 | 100    | Referência | novo_endereco | O destinatário deve possuir nome e sobrenome                                                |
      | Nome válido  |             | 59056410 | 100    | Referência | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Nome válido  | Apartamento |          | 100    | Referência | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Nome válido  | Apartamento | 5905641  | 100    | Referência | novo_endereco | Informe o cep completo com 8 dígitos                                                        |
      | Nome válido  | Apartamento | 00000000 | 100    | Referência | novo_endereco | Não encontramos o CEP desejado. Por favor, verifique os dados informados e tente novamente. |
      | Nome válido  | Apartamento | 00000000 |        | Referência | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Nome válido  | Apartamento | 00000000 | 100    |            | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Nome válido  | Apartamento | 00000000 | 100    | a          | novo_endereco | Digite uma referência válida                                                                |

  Esquema do Cenário: Editar endereço
    Dado que tenha adicionado um endereço válido
    Quando editar esse endereço com nome do destinatário "<destinatario>", tipo de endereço "<tipo>", cep "<cep>", número "<numero>" e referência "<referencia>"
    Então deverá ser redirecionado para a página "<pagina>"
    E deverá ser exibida a mensagem "<mensagem>"

    Exemplos:
      | destinatario | tipo        | cep      | numero | referencia | pagina        | mensagem                                                                                    |
      | Nome válido  | Apartamento | 59056410 | 100    | Referência | enderecos     | Endereço alterado com sucesso.                                                              |
      |              | Apartamento | 59056410 | 100    | Referência | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Inválido     | Apartamento | 59056410 | 100    | Referência | novo_endereco | O destinatário deve possuir nome e sobrenome                                                |
      | Nome válido  |             | 59056410 | 100    | Referência | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Nome válido  | Apartamento |          | 100    | Referência | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Nome válido  | Apartamento | 5905641  | 100    | Referência | novo_endereco | Informe o cep completo com 8 dígitos                                                        |
      | Nome válido  | Apartamento | 00000000 | 100    | Referência | novo_endereco | Não encontramos o CEP desejado. Por favor, verifique os dados informados e tente novamente. |
      | Nome válido  | Apartamento | 00000000 |        | Referência | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Nome válido  | Apartamento | 00000000 | 100    |            | novo_endereco | Campo de preenchimento obrigatório                                                          |
      | Nome válido  | Apartamento | 00000000 | 100    | a          | novo_endereco | Digite uma referência válida                                                                |

  Cenário: Excluir endereço
    Dado que tenha adicionado um endereço válido
    Quando excluir esse endereço
    Então deverá ser exibida a mensagem "Endereço excluído com sucesso."