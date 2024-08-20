import 'dart:convert';

import 'package:desafio05/models/aluno.dart';
import 'package:http/http.dart' as http;

class AlunoRepository {
  Future<List<Aluno>> buscarTodos() async {
    final res = await http.get(Uri.parse('http://localhost:8080/alunos'));
    final alunosList = jsonDecode(res.body);
    final todosAlunos =
        alunosList.map<Aluno>((alunoMap) => Aluno.fromMap(alunoMap)).toList();

    return todosAlunos;
  }

  Future<Aluno> buscarPorId(int id) async {
    final res = await http.get(Uri.parse('http://localhost:8080/alunos/$id'));
    return Aluno.fromJson(res.body);
  }
}
