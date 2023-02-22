import 'package:flutter/material.dart';

class MeuCampo extends StatelessWidget{
  String rotulo;
  String? dica;
  String valor = '';

  MeuCampo({required this.rotulo, this.dica});

  @override 
  Widget build(BuildContext context){
    return TextField( 
      decoration: InputDecoration(  
        label: Text(rotulo),
        hintText: dica,
      ),
      onChanged: (valorDigitado) => valor = valorDigitado,
    );
  }
}