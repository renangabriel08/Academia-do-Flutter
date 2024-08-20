import 'dart:convert';
import 'package:ansicolor/ansicolor.dart';
import 'package:http/http.dart' as http;
import '../models/course.dart';

class ProductRepository {
  AnsiPen redPen = AnsiPen()..red(bold: true);
  
  Future<Course> findByName(String name) async {
    final request = await http.get(
      Uri.parse('http://localhost:8080/products?name=$name'),
    );

    if (request.statusCode != 200) {
      throw Exception();
    }

    final response = jsonDecode(request.body);

    if (response.isEmpty) {
      throw Exception(redPen('Produto não encontrado'));
    }

    return Course.fromMap(response.first);
  }
}
