import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import '../models/student.dart';

class StudentRepository {
  AnsiPen redPen = AnsiPen()..red(bold: true);

  Future<List<Student>> findAll() async {
    try {
      final request = await Dio().get('http://localhost:8080/students');

      return request.data.map<Student>((student) {
        return Student.fromMap(student);
      }).toList();
    } on DioException catch (e) {
      print(redPen(e));
      throw Exception();
    }
  }

  Future<Student> findById(int id) async {
    try {
      final request = await Dio().get('http://localhost:8080/students/$id');

      if (request.data == null) {
        throw Exception(redPen('Nenhum estudante encontrado'));
      }

      return Student.fromMap(request.data);
    } on DioException catch (e) {
      print(redPen(e));
      throw Exception();
    }
  }

  Future<void> insert(Student student) async {
    try {
      await Dio().post('http://localhost:8080/students', data: student.toMap());
    } on DioException catch (e) {
      print(redPen(e));
      throw Exception();
    }
  }

  Future<void> update(Student student) async {
    try {
      await Dio().put(
        'http://localhost:8080/students/${student.id}',
        data: student.toMap(),
      );
    } on DioException catch (e) {
      print(redPen(e));
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    try {
      await Dio().delete('http://localhost:8080/students/$id');
    } on DioException catch (e) {
      print(redPen(e));
      throw Exception();
    }
  }
}
