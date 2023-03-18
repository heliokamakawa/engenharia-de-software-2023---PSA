import 'package:aula/entidade/pedido.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('não deve criar um pedido com CPF inválido', () {
    expect(() => Pedido(CPF: '111'), throwsException);
    //expect(Pedido(CPF: '264.310.820-52'), returnsNormally);
  });

  test('deve criar um pedido com 3 itens', () {
    var pedido = Pedido(CPF: '264.310.820-52');
    pedido.addItem(nomeProduto: 'coca-cola', quantidade: 2, precoUnidade: 6.5);
    pedido.addItem(nomeProduto: 'fanta', quantidade: 1, precoUnidade: 6);
    pedido.addItem(nomeProduto: 'chokito', quantidade: 3, precoUnidade: 3.5);
    expect(pedido.contarItem(), 3);
  });

  test(
      'ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item',
      () {
    var pedido = Pedido(CPF: '264.310.820-52');
    pedido.addItem(nomeProduto: 'coca-cola', quantidade: 2, precoUnidade: 6.5);
    pedido.addItem(nomeProduto: 'coca-cola', quantidade: 1, precoUnidade: 6.5);
    pedido.addItem(nomeProduto: 'chokito', quantidade: 3, precoUnidade: 3.5);
    expect(pedido.contarItem(), 2);
  });

  test('deve apresentar a soma de um item corretamente', () {
    var pedido = Pedido(CPF: '264.310.820-52');
    var totalItem = pedido.addItem(
        nomeProduto: 'coca-cola', quantidade: 2, precoUnidade: 6.5);
    expect(totalItem, 13.0);
  });

  // tarefa para vcs
  test('deve permitir desconto em reais do item de no máximo 15%', () {
    var pedido = Pedido(CPF: '264.310.820-52');
    expect(
        () => pedido.addItem(
            nomeProduto: 'coca-cola',
            quantidade: 2,
            precoUnidade: 6.5,
            descontoEmReais: 3),
        throwsException);
    expect(
        pedido.addItem(
            nomeProduto: 'fanta',
            quantidade: 2,
            precoUnidade: 5,
            descontoEmReais: 1.5),
        8.5);
  });

  test('deve apresentar o total do pedido corretamente', () {
    var pedido = Pedido(CPF: '264.310.820-52');
    pedido.addItem(
        nomeProduto: 'coca-cola',
        quantidade: 2,
        precoUnidade: 6.5,
        descontoEmReais: 1); //12
    pedido.addItem(
        nomeProduto: 'fanta',
        quantidade: 2,
        precoUnidade: 5,
        descontoEmReais: 1.5); //8.5
    expect(pedido.getTotal(), 20.5);
  });

  test('deve validar e calcular o desconto de um cupom de desconto', () {
    var pedido = Pedido(CPF: '264.310.820-52');
    var desconto = pedido.validarCumpom('CUPOM20');
    expect(desconto, 20);
    expect(() => pedido.validarCumpom('ERRO20'), throwsException);
  });

  test('deve adicionar um cupom de desconto', () {
    var pedido = Pedido(CPF: '264.310.820-52');
    pedido.addItem(
        nomeProduto: 'coca-cola',
        quantidade: 2,
        precoUnidade: 6.5,
        descontoEmReais: 1); //12
    pedido.addItem(
        nomeProduto: 'salgado',
        quantidade: 2,
        precoUnidade: 9.5,
        descontoEmReais: 1); 
    pedido.adicionarCupom('CUPOM20');//18
    expect(pedido.getTotal(), 24);
  });
}
