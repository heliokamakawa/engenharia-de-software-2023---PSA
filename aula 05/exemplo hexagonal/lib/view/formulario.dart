import 'package:aula_projeto/domain/ddm_resultado.dart';
import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/dto/dados_avaliacao.dart';
import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário')),
      body: Form(
        child: Column(  
          children: [
            ElevatedButton(
              onPressed: (){
                //envio os dados
                var dadosAluno = DadosAluno(nome: 'João', email: 'joao@email.com', CPF: '111');
                var dadosAvaliacao = DadosAvaliacao(nota: 6, percentualFalta: 15);
                DDMResultado ddmResultado = DDMResultado();
                ddmResultado.enviarResultado(dadosAvaliacao: dadosAvaliacao, dadosAluno: dadosAluno);
              }, 
              child: const Text('enviar'))
          ],
        ),
      ),
    );
  }
}
