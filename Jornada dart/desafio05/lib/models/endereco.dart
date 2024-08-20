import 'dart:convert';

import 'package:desafio05/models/cidade.dart';
import 'package:desafio05/models/telefone.dart';

class Endereco {
  final String rua;
  final int numero;
  final String cep;
  final Cidade cidade;
  final Telefone telefone;

  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });

  //Classe -> Map
  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'CEP': cep,
      'cidade': cidade.toMap(),
      'telefone': telefone.toMap()
    };
  }

  //Map -> String
  String toJson() => jsonEncode(toMap());

  //String -> Map
  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));

  //Map -> Classe
  factory Endereco.fromMap(Map<String, dynamic> jsonMap) {
    return Endereco(
      rua: jsonMap['rua'] ?? '',
      numero: jsonMap['numero'] ?? 0,
      cep: jsonMap['CEP'] ?? '',
      cidade: Cidade.fromMap(jsonMap['cidade'] ?? {}),
      telefone: Telefone.fromMap(jsonMap['telefone'] ?? {}),
    );
  }
}
