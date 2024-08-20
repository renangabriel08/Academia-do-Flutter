import 'dart:convert';
import 'package:ansicolor/ansicolor.dart';
import 'package:http/http.dart' as http;
import '../models/student.dart';

class StudentRepository {
  AnsiPen redPen = AnsiPen()..red(bold: true);

  Future<List<Student>> findAll() async {
    final request = await http.get(Uri.parse('http://localhost:8080/students'));

    if (request.statusCode != 200) {
      throw Exception();
    }

    final response = jsonDecode(request.body);

    return response.map<Student>((student) {
      return Student.fromMap(student);
    }).toList();
  }

  Future<Student> findById(int id) async {
    final request = await http.get(
      Uri.parse('http://localhost:8080/students/$id'),
    );

    if (request.statusCode != 200) {
      throw Exception();
    }

    if (request.body == '{}') {
      throw Exception(redPen('Nenhum estudante encontrado'));
    }

    return Student.fromJson(request.body);
  }

  Future<void> insert(Student student) async {
    final request = await http.post(
      Uri.parse('http://localhost:8080/students'),
      body: student.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (request.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> update(Student student) async {
    final request = await http.put(
      Uri.parse('http://localhost:8080/students/${student.id}'),
      body: student.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (request.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    final request = await http.delete(
      Uri.parse('http://localhost:8080/students/$id'),
    );

    if (request.statusCode != 200) {
      throw Exception();
    }
  }
}
