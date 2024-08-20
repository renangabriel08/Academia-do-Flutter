import 'dart:convert';

class Cidade {
  final int id;
  final String nome;

  Cidade({required this.id, required this.nome});

  //Class to Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome};
  }

  //Map to String
  String toJson() => jsonEncode(toMap());

  //String to Map
  factory Cidade.fromJson(String json) => Cidade.fromMap(jsonDecode(json));

  //Map to class
  factory Cidade.fromMap(Map<String, dynamic> jsonMap) {
    return Cidade(id: jsonMap['id'] ?? 0, nome: jsonMap['nome'] ?? '');
  }
}
