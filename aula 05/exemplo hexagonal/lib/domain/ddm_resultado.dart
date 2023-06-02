import 'package:aula_projeto/domain/core-private/resultado.dart';
import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/dto/dados_avaliacao.dart';
import 'package:aula_projeto/domain/porta/primaria/i_calcular_avaliacao.dart';
import 'package:aula_projeto/domain/porta/segundaria/i_envio_resultado.dart';
import 'package:aula_projeto/domain/porta/segundaria/i_dao_resultado.dart';
import 'package:aula_projeto/infra/dao_avaliacao.dart';
import 'package:aula_projeto/infra/envio_resultado.dart';

class DDMResultado implements ICalcularAvalicao{
  Resultado resultado;
  DadosAluno dadosAluno;
  DadosAvaliacao dadosAvaliacao;
  IDAOResultadoFinal dao = DAOAvalicao(); 
  IEnvioResultado envioResultado = EnvioResultado();

  DDMResultado({
    required this.dadosAluno,
    required this.dadosAvaliacao
  }) : 
  resultado = Resultado(dadosAvaliacao: dadosAvaliacao, dadosAluno: dadosAluno);
  
  @override
  Future<bool> enviarResultado() async{
    resultado = Resultado(dadosAvaliacao: dadosAvaliacao, dadosAluno: dadosAluno);
    return await resultado.enviarResultado(
      dao: dao, 
      envioResultado: envioResultado);
  }
}