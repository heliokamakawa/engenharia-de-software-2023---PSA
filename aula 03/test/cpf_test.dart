// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:aula_ddm/entidade/validador_cpf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


/*
- deve possuir o formato correto;
- não pode ser vazio ou nulo;
- deve possuir . e -;
- validar digitos


CPF deve possuir . e -
→ verificar sem – 
→ verificar sem .
→  verificar sem as duas
CPF com máscara deve possuir 14 dígitos
A função deve retornar somente números
CPF sem máscara deve possuir 11 números
CPF não deve ter números iguais
Necessário calcular dígito
→ Quando o cálculo do 2º digito for valor maior que 10 deve retornar 0 - 743.649.600-04
→ CPF 374.579.825 deve gerar o primeiro dígito 2
→ Quando o cálculo do 2º digito for maior que 10 deve retornar 0 - 767.348.389-00
*/

void main() {
  String cpf;
  var validadorCPF = ValidadorCPF();

  group('verificando formato', (){
    test('CPF vazio deve gerar exception', (){
      cpf = '';
      expect(
        () => validadorCPF.eVazio(cpf), 
        throwsException
      );
    });
    test('CPF não vazio deve retornar ok', (){
      cpf = '123.456.789-85';
      expect(
        validadorCPF.eVazio(cpf), 
        true
      );
    });
    
    test('CPF com 13 caracteres deve gerar exception', (){
      cpf = '123.456.789-8';
      expect(
        () => validadorCPF.eTamanhoCorreto(cpf), 
        throwsException
      );
    });
   
    test('CPF com tamanho correto retornar ok', (){
      cpf = '123.456.789-85';
      expect(
        validadorCPF.eTamanhoCorreto(cpf), 
        true
      );
    });

    test('CPF sem ponto deve gerar erro', (){
      cpf = '123-159-852-11';
      expect(
        ()=>validadorCPF.eFormatoCorreto(cpf), 
        throwsException
      );
    });

    test('CPF sem - deve gerar erro', (){
      cpf = '123.159.852.11';
      expect(
        ()=>validadorCPF.eFormatoCorreto(cpf), 
        throwsException
      );
    });
    
    test('CPF com formato correto retornar ok', (){
      cpf = '017.184.159-07';
      expect(
        validadorCPF.eFormatoCorreto(cpf), 
        true
      );
    });
  });

  test('cpf sem dígito deve possuir 9 números', (){
    cpf = '017.184.159-07';
    var listaNumerosCPF = validadorCPF.cpfSemDigitoEMascara(cpf);
      expect(
        listaNumerosCPF.length, 
        9
      );

  });
}

