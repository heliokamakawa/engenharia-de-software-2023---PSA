import 'package:aula_projeto/domain/core-private/resultado.dart';
import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/dto/dados_avaliacao.dart';
import 'package:aula_projeto/domain/enum/motivo_reprovacao.dart';
import 'package:aula_projeto/domain/enum/tipo_resultado.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  var resultado = Resultado(
    dadosAluno: dadosAluno,
    dadosAvaliacao: dadosAvaliacao
  );
  
   test('''
    verificar aprovação da nota 
    - menor que 6 deve ser reprovado
    - maior ou igual a 6 deve ser aprovado
  ''', (){
    expect(resultado.ehAprovadoNota(5), false);
    expect(resultado.ehAprovadoNota(6), true);
  });

  test('''
    a nota deve ser de 0 à 10
  ''', (){
    expect(()=>resultado.ehAprovadoNota(0), returnsNormally);
    expect(()=>resultado.ehAprovadoNota(10), returnsNormally);
    expect(()=>resultado.ehAprovadoNota(-1), throwsException);
    expect(()=>resultado.ehAprovadoNota(11), throwsException);
  });

  test('''
    verificar aprovação de falta - verificar percentual de falta 
    - menor ou igual que 25 deve ser aprovado
    - maior que 25 deve ser reprovado
  ''', (){
    expect(resultado.ehAprovadoPresenca(10), true);
    expect(resultado.ehAprovadoPresenca(25), true);
    expect(resultado.ehAprovadoPresenca(26), false);
  });
  
  test('''
    o % de falta deve ser de 0 à 100
  ''', (){
    expect(()=>resultado.ehAprovadoPresenca(10), returnsNormally);
    expect(()=>resultado.ehAprovadoPresenca(-1), throwsException);
    expect(()=>resultado.ehAprovadoPresenca(101), throwsException);
  });

  test(
     '''
     O resultado final deve ser apresentado de 2 formas
        - aprovado 
        - reprovado
     ''', (){
    var opcoes = <String>[];
    for(var elemento in TipoResultado.values){
      opcoes.add(elemento.name);
    }
    expect(opcoes.length, 2);
    expect(opcoes.contains('aprovado'), true);
    expect(opcoes.contains('reprovado'), true);
  });
  
  test('''
    a aprovação deve ser para aprovado em notas e presenças
    ''', (){
    var dadosAluno = DadosAluno(nome: 'João', email: 'joao@email.com', CPF: '111');
    var dados = DadosAvaliacao(aluno: dadosAluno, nota: 10, percentualFalta: 0);
    expect(resultado.ehAprovado(dadosAvaliacao: dados), TipoResultado.aprovado);
    dados.percentualFalta = 25;
    expect(resultado.ehAprovado(dadosAvaliacao: dados), TipoResultado.aprovado);
    dados.nota = 5.9;
    expect(resultado.ehAprovado(dadosAvaliacao: dados), TipoResultado.reprovado);
    dados.nota = 6;
    dados.percentualFalta = 26;
    expect(resultado.ehAprovado(dadosAvaliacao: dados), TipoResultado.reprovado);
  });

  test(
     '''
      - O motivo de reprovacao final deve ser apresentado de 3 formas
        - nota 
        - falta
        - nota e falta
     ''', (){
    var opcoes = <String>[];
    for(var elemento in MotivoReprovacao.values){
      opcoes.add(elemento.name);
    }
    expect(opcoes.length, 3);
    expect(opcoes.contains('nota'), true);
    expect(opcoes.contains('falta'), true);
    expect(opcoes.contains('notaEFalta'), true);
  });

   test('''
    em caso de reprova deve informar o motivo
    ''', (){
    var dadosAluno = DadosAluno(nome: 'João', email: 'joao@email.com', CPF: '111');
    
    var dados = DadosAvaliacao(aluno: dadosAluno, nota: 5.9, percentualFalta: 0);
    expect(resultado.verficarMotivoReprovacao(dadosAvaliacao: dados), MotivoReprovacao.nota);
    dados = DadosAvaliacao(aluno: dadosAluno, nota: 6, percentualFalta: 26);
    expect(resultado.verficarMotivoReprovacao(dadosAvaliacao: dados), MotivoReprovacao.falta);
    dados = DadosAvaliacao(aluno: dadosAluno, nota: 5.9, percentualFalta: 26);
    expect(resultado.verficarMotivoReprovacao(dadosAvaliacao: dados), MotivoReprovacao.notaEFalta);
  });
}