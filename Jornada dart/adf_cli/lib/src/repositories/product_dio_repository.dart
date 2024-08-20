import 'package:ansicolor/ansicolor.dart';

import '../models/course.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  AnsiPen redPen = AnsiPen()..red(bold: true);

  Future<Course> findByName(String name) async {
    try {
      final res = await Dio().get('http://localhost:8080/products?name=$name');

      if (res.data.isEmpty) {
        throw Exception(redPen('Produto não encontrado'));
      }

      return Course.fromMap(res.data.first);
    } on DioException {
      throw Exception();
    }
  }
}
