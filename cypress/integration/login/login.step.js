/// <reference types="cypress" />

When('logar com login {string} e senha {string}', (login, senha) => {
  cy.get('#input-usuario')
    .clear()
    .type(`${login}{SHIFT}`);

  cy.get('input[name="senha"]')
    .clear()
    .type(`${senha}{SHIFT}`);

  cy.get('#btn-next-step')
    .click()
});