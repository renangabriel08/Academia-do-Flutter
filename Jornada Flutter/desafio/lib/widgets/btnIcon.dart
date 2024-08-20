import 'package:flutter/material.dart';

class BtnIcon extends StatefulWidget {
  final void Function() callback;
  final IconData icone;

  const BtnIcon({super.key, required this.callback, required this.icone});

  @override
  State<BtnIcon> createState() => _BtnIconState();
}

class _BtnIconState extends State<BtnIcon> {
  Color cor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Icon(
        widget.icone,
        color: cor,
      ),
    );
  }
}
