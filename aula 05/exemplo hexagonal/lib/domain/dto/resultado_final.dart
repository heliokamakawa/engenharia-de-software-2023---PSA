import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/enum/motivo_reprovacao.dart';
import 'package:aula_projeto/domain/enum/tipo_resultado.dart';

class ResultadoFinal{
  DadosAluno dadosAluno;
  TipoResultado resultado; 
  MotivoReprovacao? motivo;

  ResultadoFinal({
    required this.dadosAluno,
    required this.resultado,
    this.motivo
  });
}