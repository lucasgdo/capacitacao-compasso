import { CADASTRO as cad } from './components/cadastro.components'

export class PanvelCadastro {
  static realizarCadastro(nome, email, cpf) {
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