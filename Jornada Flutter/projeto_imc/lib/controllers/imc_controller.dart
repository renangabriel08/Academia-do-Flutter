import 'dart:math';
import 'package:flutter/material.dart';

class ImcController extends ChangeNotifier {
  var imc = 0.0;

  Future<void> calcularIMC(double altura, double peso) async {
    imc = 0;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    imc = peso / pow(altura, 2);
    notifyListeners();
  }
}
