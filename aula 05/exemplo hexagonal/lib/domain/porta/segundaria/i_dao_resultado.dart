import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/dto/resultado_final.dart';

abstract class IDAOResultadoFinal{
  Future<bool> salvar({required DadosAluno dadosAluno,required ResultadoFinal resultado});
}