/// <reference types="cypress" />

Given('que esteja na página de {word}', (pagina) => {
  switch (pagina) {
    case 'Login':
      pagina = '/login.do'

      break;
    case 'Cadastro':
      pagina = '/cadastrarCliente.do'

      break;
    default:
      break;
  }

  cy.visit(pagina)
});

Then('deverá ser redirecionado para a página {string}', (pagina) => {
  switch (pagina) {
    case 'home':
      pagina = 'https://www.panvel.com/panvel/main.do'

      break;
    case 'login':
      pagina = 'https://www.panvel.com/panvel/login.do'

      break;
    case 'cadastro':
      pagina = 'https://www.panvel.com/panvel/cadastrarCliente.do'

      break;
    default:
      break;
  }

  cy.url()
    .should('eq', pagina)
});

Then('deverá ser exibida a mensagem {string}', (mensagem) => {
  switch (mensagem) {
    case 'LUCAS':
      cy.get('.menu-links .logo-panvel')
        .click()

      cy.get('.menu-usuario')
        .should('contain', 'LUCAS')

      cy.get('.item--close')
        .click({ force: true })

      break;
    case 'Usuário ou Senha inválidos':
      cy.get('.message__box')
        .should('contain', mensagem)

      break;
    case 'CONFIRME SEU E-MAIL':
      cy.get('.cadastro__modal')
        .should('contain', mensagem)

      break;
    default:
      cy.get('.form-control__erro-pbm')
        .should('contain', mensagem)

      break;
  }
});
