import 'dart:convert';

class Curso {
  final int id;
  final String nome;
  final bool isAluno;

  Curso({required this.id, required this.nome, required this.isAluno});

  //Retornando oq eu já tenho
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'isAluno': isAluno,
    };
  }

  String toJson() => jsonEncode(toMap());

  //Recebendo, transformando e construindo
  factory Curso.fromJson(String json) => Curso.fromMap(jsonDecode(json));

  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      isAluno: map['isAluno'] ?? false,
    );
  }
}
