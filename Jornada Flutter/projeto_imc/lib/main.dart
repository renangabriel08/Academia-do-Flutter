import 'package:flutter/material.dart';
import 'package:projeto_imc/pages/bloc_page.dart';
import 'package:projeto_imc/pages/change_notifier_page.dart';
import 'package:projeto_imc/pages/home.dart';
import 'package:projeto_imc/pages/setState_page.dart';
import 'package:projeto_imc/pages/value_notifier_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const Home(),
        '/setState': (context) => const SetstatePage(),
        '/valueNotifier': (context) => const ValueNotifierPage(),
        '/changeNotifier': (context) => const ChangeNotifierPage(),
        '/bloc': (context) => const BlocPage(),
      },
      initialRoute: '/home',
    );
  }
}
