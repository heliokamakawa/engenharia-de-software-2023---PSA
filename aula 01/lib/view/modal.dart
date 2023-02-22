import 'package:flutter/material.dart';

class Modal {
  final String titulo; 
  final String mensagem;
  final BuildContext context;

  Modal({required this.context, required this.titulo, required this.mensagem}){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog( 
          title: Text(titulo),
          content: Text(mensagem),
        );
      },
    );
  }
}