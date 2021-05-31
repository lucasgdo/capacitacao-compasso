import { LOGIN as log } from './components/login.components'

export class PanvelLogin {
  static realizarLogin(login, senha) {
    cy.get(log.INP_USUARIO)
      .clear()
      .type(`${login}{SHIFT}`);

    cy.get(log.INP_SENHA)
      .clear()
      .type(`${senha}{SHIFT}`);

    cy.get(log.BTN_PROX)
      .click()
  }
}