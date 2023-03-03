import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final myController = TextEditingController();

  String validarCPF(String cpfCompleto){
    if(cpfCompleto.isEmpty) return 'CPF está vazio';
    if(cpfCompleto.length != 14) return 'CPF precisa de 14 caracteres';
    if(!cpfCompleto.contains('.')) return 'CPF está sem "."';
    if(!cpfCompleto.contains('-')) return 'CPF está sem "-"';
    var cpfSemMascara = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
    var cpfListaNumeros = cpfSemMascara.substring(0,9).split('').map<int>((e) => int.parse(e)).toList() ;
    var digito1 = int.parse(cpfSemMascara.substring(9,10));
    var digito2 = int.parse(cpfSemMascara.substring(10,11));
    var eDigitosIguais = true;
    for(var i = 1; i < cpfListaNumeros.length; i++){
      if(cpfListaNumeros[i] != cpfListaNumeros[i-1]){
        eDigitosIguais = false;
        break; 
      }
    }
    if(eDigitosIguais)return 'CPF com números iguais';
    var peso = 10;
    var digitoCalculado = 0;
    for(var numeroCPF in cpfListaNumeros){
      digitoCalculado += peso * numeroCPF;
      peso--;
    }
    digitoCalculado =  11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    if (digitoCalculado != digito1) return 'CPF com o primeiro dígito errado';
    cpfListaNumeros.add(digitoCalculado);
    peso = 11;
    digitoCalculado = 0;
    for(var numeroCPF in cpfListaNumeros){
      digitoCalculado += peso * numeroCPF;
      peso--;
    }
    digitoCalculado =  11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    if (digitoCalculado != digito2) return 'CPF com o segundo dígito errado';
    return 'CPF VÁLIDO';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Primeria Página')),
      body: Center( 
        child: Column(  
          children: [ 
            TextField(  
              controller: myController,
              decoration: const InputDecoration(  
                label: Text('CPF'), 
                hintText: 'Informe o seu CPF'
              ),
            ),
            ElevatedButton(
              child: const Text('verificar'),
              onPressed: (){
                String mensagem = validarCPF(myController.text);
                showDialog(
                  context: context, 
                  builder: (BuildContext context){
                    return AlertDialog(  
                      title: const Text('Aviso'),
                      content: Text(mensagem),
                    );
                  }
                );
              }, 
            )
          ],
        ),
      ),
    );
  }
}

/*
O que realizamos para melhorar a legibilidade do método que valida CPF?
- definir nomes significativos para variáveis;
- eliminar variáveis não utilizadas;
- eliminar variáveis desnecessárias;
- definir nomes sugestivos a finalidade criada para parâmetros e variáveis;
- eliminar estruturas de decisão aninhadas;
- definir mensagens mais específicas;
- definir nome sugestivo ao método;
- redefinir lógica de programação (sem dar voltas).
*/