/// <reference types="cypress" />
import { When } from 'cypress-cucumber-preprocessor/steps'
import { PanvelLogin } from '../../pages/login.page'

When('logar com login {string} e senha {string}', (login, senha) => {
  PanvelLogin.realizarLogin(login, senha)
});