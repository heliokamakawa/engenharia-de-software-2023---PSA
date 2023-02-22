import 'package:aula3/view/pagina_inicial.dart';
import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget{
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp( 
      title: 'Meu Aplicativo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const PrimeiraPagina(),
    );
  }
}