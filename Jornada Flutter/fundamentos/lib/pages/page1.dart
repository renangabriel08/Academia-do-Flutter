import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //Busca altura e largura do body
        child: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints.maxHeight);
            print(constraints.maxWidth);

            //Rotaciona widgets
            return RotatedBox(
              quarterTurns: 0,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/page2',
                  arguments: {'id': 10, 'nome': 'Renan'},
                ),
                child: const Text('Page2'),
              ),
            );
          },
        ),
      ),
    );
  }
}
