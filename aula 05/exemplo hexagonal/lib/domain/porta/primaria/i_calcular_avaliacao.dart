import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/dto/dados_avaliacao.dart';

abstract class ICalcularAvalicao{
  Future<bool> enviarResultado({DadosAluno dadosAluno,DadosAvaliacao dadosAvaliacao});
}
