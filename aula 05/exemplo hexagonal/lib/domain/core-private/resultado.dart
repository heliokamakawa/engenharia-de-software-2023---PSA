import 'package:aula_projeto/domain/dto/dados_aluno.dart';
import 'package:aula_projeto/domain/dto/dados_avaliacao.dart';
import 'package:aula_projeto/domain/dto/resultado_final.dart';
import 'package:aula_projeto/domain/enum/motivo_reprovacao.dart';
import 'package:aula_projeto/domain/enum/tipo_resultado.dart';
import 'package:aula_projeto/domain/porta/segundaria/i_dao_resultado.dart';
import 'package:aula_projeto/domain/porta/segundaria/i_envio_resultado.dart';

class Resultado{
  DadosAluno dadosAluno;
  DadosAvaliacao dadosAvaliacao;
  double nota;
  int percentualFalta;

  Resultado({
    required this.dadosAvaliacao,
    required this.dadosAluno
  }) : 
  nota = dadosAvaliacao.nota, 
  percentualFalta = dadosAvaliacao.percentualFalta;

  bool ehAprovadoNota(){
    _validarNota();
    return nota >= 6;
  }

  void _validarNota(){
    var msnErroNota = 'Nota deve ser de 0 à 10';
    if(nota < 0  || nota > 10) throw Exception(msnErroNota);
  }

  bool ehAprovadoPresenca(){
    _validarPercetualFalta();
    return percentualFalta <= 25;
  }
  void _validarPercetualFalta(){
    var msnErroNota = 'Percentual deve ser de 0 à 100';
    if(percentualFalta < 0  || percentualFalta > 100) throw Exception(msnErroNota);
  }

  TipoResultado ehAprovado(){
    return (ehAprovadoNota() && ehAprovadoPresenca()) ?
      TipoResultado.aprovado :
      TipoResultado.reprovado;
  }

  MotivoReprovacao verficarMotivoReprovacao(){
    if(!ehAprovadoNota() && ehAprovadoPresenca()) return MotivoReprovacao.nota;
    if(ehAprovadoNota() && !ehAprovadoPresenca()) return MotivoReprovacao.falta;
    return MotivoReprovacao.notaEFalta;
  }

  Future<bool> enviarResultado  ({ 
    required IDAOResultadoFinal dao,
    required IEnvioResultado envioResultado
  })async {
    bool envio, salvar;
    var resultadoFinal = ResultadoFinal(
      dadosAluno: dadosAluno,
      resultado: ehAprovado()
    );
    if(resultadoFinal.resultado == TipoResultado.reprovado){
      resultadoFinal.motivo = verficarMotivoReprovacao();
    }
    envio = await envioResultado.enviar(dadosAluno: dadosAluno, resultadoFinal: resultadoFinal);
    salvar = await dao.salvar(dadosAluno: dadosAluno, resultado: resultadoFinal);
    return (envio && salvar);
  }
}



