/// <reference types="cypress" />
import { When } from 'cypress-cucumber-preprocessor/steps'
import { PanvelCadastro } from '../../pages/cadastro.page'

When('realizar o cadastro com nome {string}, e-mail {string} e cpf {string}', (nome, email, cpf) => {
  PanvelCadastro.realizarCadastro(nome, email, cpf)
});