/// <reference types="cypress" />
import { When } from 'cypress-cucumber-preprocessor/steps'
import { PanvelCadastro } from '../../pages/cadastro.page'
import * as faker from 'faker';
import * as cpfGen from 'cpf';

When('realizar o cadastro com nome {string}, e-mail {string} e cpf {string}', (nome, email, cpf) => {
  nome = nome == 'não utilizado' ? `${faker.name.findName()}` : nome
  email = email == 'não utilizado' ? `${faker.internet.email()}` : email
  email = email == 'já utilizado' ? 'lucasgdo4@gmail.com' : email
  email = email == 'inválido' ? 'thatisnotanemail' : email
  cpf = cpf == 'não utilizado' ? `${cpfGen.generate(false)}` : cpf
  cpf = cpf == 'já utilizado' ? '07354503312' : cpf
  cpf = cpf == 'inválido' ? '00000000000' : cpf

  PanvelCadastro.realizarCadastro(nome, email, cpf)
});