import { HEADER as head, FORM as form } from './components/_common.components'
import { CADASTRO as cad } from './components/cadastro.components'

export class PanvelCommon {
  static visitarPagina(pagina) {
    cy.visit(`/${pagina}.do`)
  }

  static checarPagina(pagina) {
    cy.url()
      .should('eq', `https://www.panvel.com/panvel/${pagina}.do`)
  }

  static checarMensagem(mensagem) {
    switch (mensagem) {
      case 'LUCAS':
        cy.get(head.LOGO)
          .click()
        cy.get(head.MENU_USUARIO)
          .should('contain', 'LUCAS')
        cy.get(head.BTN_SAIR)
          .click({ force: true })
        break;
      case 'Usuário ou Senha inválidos':
        cy.get(head.AVISO)
          .should('contain', mensagem)
        break;
      case 'CONFIRME SEU E-MAIL':
        cy.get(cad.MODAL_SUCESSO)
          .should('contain', mensagem)
        break;
      case 'AVISO':
        cy.get(head.AVISO)
          .should('contain', mensagem)
        break;
      default:
        cy.get(form.ERRO)
          .should('contain', mensagem)
        break;
    }
  }
}