import 'package:aula_projeto/domain/dto/resultado_final.dart';
import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/porta/segundaria/i_envio_resultado.dart';

class EnvioResultado implements IEnvioResultado{
  @override
  Future<bool> enviar({required DadosAluno dadosAluno, required ResultadoFinal resultadoFinal}){
    return Future.value(true);
  }
}