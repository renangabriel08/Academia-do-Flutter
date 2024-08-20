import 'package:flutter/material.dart';
import 'package:fundamentos/pages/page1.dart';
import 'package:fundamentos/pages/page2.dart';

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
        '/page1': (_) => const Page1(),
        '/page2': (_) => const Page2(),
      },
      initialRoute: '/page1',
    );
  }
}
