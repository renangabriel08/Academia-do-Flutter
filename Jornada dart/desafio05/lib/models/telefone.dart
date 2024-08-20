import 'dart:convert';

class Telefone {
  final int ddd;
  final String telefone;

  Telefone({required this.ddd, required this.telefone});

  //Transformar classe em mapa (para retono para API)
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  //Transformar map em json (para retono para API)
  String toJson() => jsonEncode(toMap());

  //Transforma minha string em mapa (quando receber dado da API)
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));

  //Transforma meu map em Classe e constroi a mesma (quando receber dado da API)
  factory Telefone.fromMap(Map<String, dynamic> jsonMap) {
    return Telefone(
      ddd: jsonMap['ddd'] ?? 0,
      telefone: jsonMap['telefone'] ?? '',
    );
  }
}
