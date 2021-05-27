/// <reference types="cypress" />

context('Login', () => {
  beforeEach(() => {
    cy.visit('/login.do')
  })

  const validData = [
    { "type": "e-mail", "login": "lucasgdo4@gmail.com", "senha": "senhaCorreta123" },
    { "type": "CPF", "login": "07354503312", "senha": "senhaCorreta123" }
  ]

  const invalidData = [
    { "type": "Inexistent user", "email": "teste@compasso.com.br", "senha": "senhaCorreta123", "el": ".message__box", "msg": "Usuário ou Senha inválidos" },
    { "type": "Invalid e-mail", "email": "thatisnotanemail", "senha": "senhaCorreta123", "el": ".message__box", "msg": "Usuário ou Senha inválidos" },
    { "type": "Null e-mail", "email": "{SHIFT}", "senha": "senhaCorreta123", "el": ".form-control__erro-pbm", "msg": "E-mail ou CPF é obrigatório." },
    { "type": "Null password", "email": "teste@compasso.com.br", "senha": "{SHIFT}", "el": ".form-control__erro-pbm", "msg": "Senha é obrigatório." }
  ]

  validData.forEach(obj => {
    it(`Should login with correct credentials - Login with ${obj.type}`, () => {
      cy.get('#input-usuario')
        .clear()
        .type(obj.login);

      cy.get('input[name="senha"]')
        .clear()
        .type(obj.senha);

      cy.get('#btn-next-step')
        .click()

      cy.get('.menu-links .logo-panvel')
        .click()

      cy.get('.menu-usuario')
        .should('contain', 'LUCAS')

      cy.get('.item--close')
        .click({ force: true })
    })
  })

  invalidData.forEach(obj => {
    it(`Shouldn't login with incorrect credentials - ${obj.type}`, () => {
      cy.get('#input-usuario')
        .clear()
        .type(obj.email);

      cy.get('input[name="senha"]')
        .clear()
        .type(obj.senha);

      cy.get('#btn-next-step')
        .click()

      cy.wait(1000)

      cy.get(obj.el)
        .should('contain', obj.msg)
    })
  })
})
