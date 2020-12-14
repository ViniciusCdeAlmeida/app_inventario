import 'package:flutter/material.dart';

class BensPrevistosItem extends StatelessWidget {
  final String titulo;
  final String texto;

  BensPrevistosItem(this.titulo, this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
          text: titulo,
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: texto == null ? 'Não contem' : texto,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
