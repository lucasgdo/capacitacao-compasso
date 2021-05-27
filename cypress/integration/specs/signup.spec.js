/// <reference types="cypress" />

import * as faker from 'faker';
import * as cpf from 'cpf';

context('Sign up', () => {
  faker.locale = "pt_BR";

  //Wasn't able to validate null name and null cpf cases, as they behave differently from e-mail.
  const invalidData = [
    { "type": "Used e-mail", "name": `${faker.name.findName()}`, "email": `${faker.internet.email()}`, "cpf": `${cpf.generate(false)}`, "el": ".form-control__erro-pbm", "msg": "Este email já possui cadastro." },
    { "type": "Used cpf", "name": `${faker.name.findName()}`, "email": `${faker.internet.email()}`, "cpf": `${cpf.generate(false)}`, "el": ".form-control__erro-pbm", "msg": "Este cpf já possui cadastro, caso necessário redefina sua senha!" },
    { "type": "Invalid e-mail", "name": `${faker.name.findName()}`, "email": "thatisnotanemail", "cpf": `${cpf.generate(false)}`, "el": ".form-control__erro-pbm", "msg": "Email não é válido." },
    { "type": "Invalid cpf", "name": `${faker.name.findName()}`, "email": `${faker.internet.email()}`, "cpf": "00000000000", "el": ".form-control__erro-pbm", "msg": "Cpf é inválido." },
    { "type": "Null e-mail", "name": `${faker.name.findName()}`, "email": "{SHIFT}", "cpf": `${cpf.generate(false)}`, "el": ".form-control__erro-pbm", "msg": "Campo obrigatório." }
  ]

  beforeEach(() => {
    cy.visit('/cadastrarCliente.do')
  })

  it(('Should sign up with correct credentials'), () => {
    cy.get('input[name="nome"]')
      .clear()
      .type(invalidData[0].name);

    cy.get('#input-email')
      .clear()
      .type(invalidData[0].email);

    cy.get('#input-cpf')
      .clear()
      .type(invalidData[1].cpf)

    cy.get('#btn-next-step')
      .click()

    cy.get('.cadastro__modal')
      .should('contain', 'CONFIRME SEU E-MAIL')
  })

  invalidData.forEach(obj => {
    it(`Shouldn't sign up with incorrect credentials - ${obj.type}`, () => {
      cy.get('input[name="nome"]')
        .clear()
        .type(obj.name);

      cy.get('#input-email')
        .clear()
        .type(obj.email);

      cy.get('#input-cpf')
        .clear()
        .type(`${obj.cpf}{ENTER}`)

      cy.get(obj.el)
        .should('contain', obj.msg)
    })
  })
})