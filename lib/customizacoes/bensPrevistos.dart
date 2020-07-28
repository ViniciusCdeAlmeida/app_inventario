import 'package:flutter/material.dart';

class BensPrevistos extends StatelessWidget {
  final String titulo;
  final String texto;

  BensPrevistos(this.titulo, this.texto);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: titulo,
        style: TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: texto,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
