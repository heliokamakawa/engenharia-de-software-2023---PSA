import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/dto/resultado_final.dart';

abstract class IEnvioResultado{
  Future<bool> enviar({required DadosAluno dadosAluno, required ResultadoFinal resultadoFinal});
}