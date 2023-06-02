import 'package:aula_projeto/domain/dto/resultado_final.dart';
import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/porta/segundaria/i_dao_resultado.dart';

class DAOAvalicao implements IDAOResultadoFinal{
  @override
  Future<bool> salvar({required DadosAluno dadosAluno,required ResultadoFinal resultado}) {
    return Future.value(true);
  }

}