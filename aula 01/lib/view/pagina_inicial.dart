import 'package:aula3/entidade/cpf.dart';
import 'package:aula3/view/meu_botao.dart';
import 'package:aula3/view/meu_campo.dart';
import 'package:aula3/view/modal.dart';
import 'package:flutter/material.dart';

class PrimeiraPagina extends StatelessWidget{
  const PrimeiraPagina({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    MeuCampo c = MeuCampo(rotulo: 'CPF',dica: 'Inform CPF');
    return Scaffold(
      appBar: AppBar(title: const Text('Primeira Página')),
      body: Center(  
        child: Column(
          children: [
            c,
            MeuBotao(
              rotulo: 'ok',
              acao: (){
                Cpf cpf = Cpf(c.valor);
                String mensagem = 'ok';
                if(cpf.validarCPF()) mensagem = 'errado';
                Modal(context: context,titulo: 'resultado', mensagem: mensagem);
              }
            )
          ],
        ),
      ),
    );
  }
}