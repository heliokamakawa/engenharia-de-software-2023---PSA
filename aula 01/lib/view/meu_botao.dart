import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget{
  final Key? key;
  final String rotulo; 
  final VoidCallback acao;

  const MeuBotao({this.key,required this.rotulo, required this.acao}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: acao,
      child: Text(rotulo),
    );
  }
}