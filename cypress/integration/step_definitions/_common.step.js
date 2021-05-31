/// <reference types="cypress" />
import { Given, Then } from 'cypress-cucumber-preprocessor/steps'
import { PanvelCommon } from '../../pages/_common.page'

Given('que esteja na página {string}', (pagina) => {
  PanvelCommon.visitarPagina(pagina)
});

Then('deverá ser redirecionado para a página {string}', (pagina) => {
  PanvelCommon.checarPagina(pagina)
});

Then('deverá ser exibida a mensagem {string}', (mensagem) => {
  PanvelCommon.checarMensagem(mensagem)
});
