import { CADASTRO as cad } from './components/cadastro.components'
import { criaUsuario } from '../fixtures/factories/user.factory'

export class PanvelCadastro {
  static realizarCadastro(nome, email, cpf) {
    const usuarioFalso = criaUsuario()

    let mapaNome = {
      'não utilizado': usuarioFalso.nome,
      '': ''
    }

    let mapaEmail = {
      'não utilizado': usuarioFalso.email,
      'já utilizado': 'lucasgdo4@gmail.com',
      'inválido': 'thatisnotanemail',
      '': ''
    }

    let mapaCpf = {
      'não utilizado': usuarioFalso.cpf,
      'já utilizado': '07354503312',
      'inválido': '00000000000'
    }

    nome = mapaNome[nome]
    email = mapaEmail[email]
    cpf = mapaCpf[cpf]

    cy.get(cad.INP_NOME)
      .clear()
      .type(`${nome}{SHIFT}`);
    cy.get(cad.INP_EMAIL)
      .clear()
      .type(`${email}{SHIFT}`);
    cy.get(cad.INP_CPF)
      .clear()
      .type(`${cpf}{ENTER}`)
  }
}