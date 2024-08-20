import 'package:flutter/material.dart';

class Requisitos extends StatelessWidget {
  final Color cor;
  final String txt;

  const Requisitos({super.key, required this.cor, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: cor,
          radius: 6,
        ),
        const SizedBox(width: 7),
        Text(
          txt,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
