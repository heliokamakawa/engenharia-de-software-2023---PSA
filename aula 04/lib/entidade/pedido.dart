import 'package:aula/entidade/validador_cpf.dart';

class Pedido{
  var itens = <Object>[];
  var total = 0.0;
  Pedido({required String CPF}){
    ValidadorCPF.comCPF(CPF);
  }

  double addItem({required String nomeProduto, required int quantidade, required double precoUnidade, double descontoEmReais=0}) {
    var existe = false;
    var totalItem = quantidade * precoUnidade;
    var descontoPermitido = totalItem * 0.15;
    if(descontoEmReais > descontoPermitido) throw Exception('Desconto maior do que o permitido');
    totalItem = totalItem - descontoEmReais;
    for(var c=0; c < itens.length; c++){
      var item = itens[c] as List<Object>;
      if(item[0] == nomeProduto){
        item[1] = quantidade + int.parse(item[1].toString());
        item[3] = descontoEmReais + double.parse(item[3].toString());
        existe = true;
        break;
      }
    }
    if(!existe){
      itens.add([nomeProduto, quantidade, precoUnidade,descontoEmReais]);
    }
    total += totalItem;
    return totalItem;
  }

  int contarItem() {
    return itens.length;
  }

  getTotal() {
    return total;
  }

  int validarCumpom(String cupom) {
    var chave = cupom.substring(0,5);
    if(chave != 'CUPOM') throw Exception('Cupom inválido!');
    var desconto = int.parse(cupom.substring(5));
    return desconto;
  }

  void adicionarCupom(String cupom) {
    var desconto = validarCumpom(cupom);
    total = total - (total * desconto / 100);
  }
}