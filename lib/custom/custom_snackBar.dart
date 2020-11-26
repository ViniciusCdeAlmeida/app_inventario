import 'package:flutter/material.dart';

class SnackBarPage extends SnackBar {
  final int tempo;
  final String texto;

  SnackBarPage({this.tempo, this.texto});

  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(texto),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: tempo),
    );
  }
}
