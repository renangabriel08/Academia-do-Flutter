import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final void Function() callback;
  final String text;
  const Btn({super.key, required this.callback, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: callback,
      child: Text(text),
    );
  }
}
