class ValidadorCPF {

  ValidadorCPF();

  ValidadorCPF.comCPF(String CPF){
    eVazio(CPF);
    eTamanhoCorreto(CPF);
    eFormatoCorreto(CPF);
  }

  bool eVazio(String cpf) {
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio');
    return true;
  }

  bool eTamanhoCorreto(String cpf) {
    if (cpf.length != 14) throw Exception('tamanho inválido');
    return true;
  }

  bool eFormatoCorreto(String cpf) {
    var regexp = RegExp(r'\d{3}\.\d{3}\.\d{3}\-\d{2}');
    print(regexp.hasMatch(cpf));
    print(regexp.allMatches(cpf));
    if (!regexp.hasMatch(cpf)) throw Exception('CPF com formato errado');
    return true;
  }

  List<int> cpfSemDigitoEMascara(String cpf) {
    var soNumerosSemDigitos = cpf.substring(0, 11).replaceAll('.', '');
    var listaCaractres = soNumerosSemDigitos.split('');
    var cpfListaNumeros = listaCaractres.map<int>((e) => int.parse(e)).toList();
    return cpfListaNumeros;
  }

  int cpfPrimeiroDigito(String cpf) {
    eTamanhoCorreto(cpf);
    return int.parse(cpf.substring(12, 13));
  }

  int cpfSegundoDigito(String cpf) {
    eTamanhoCorreto(cpf);
    return int.parse(cpf.substring(13, 14));
  }
}
