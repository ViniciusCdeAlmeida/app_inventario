import 'package:flutter/material.dart';

class Organizacao with ChangeNotifier {
  final int id;
  final String codigo;
  final String nome;
  final String sigla;
  final String codigoENome;

  Organizacao({
    this.id,
    this.codigo,
    this.nome,
    this.sigla,
    this.codigoENome,
  });
}
