import faker from 'faker';
import * as cpfGen from 'cpf';

export const criaUsuario = () => {
  return {
    nome: `${faker.name.findName()}`,
    email: `${faker.internet.email()}`,
    cpf: `${cpfGen.generate(false)}`
  }
}