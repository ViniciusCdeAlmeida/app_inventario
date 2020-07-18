import 'package:flutter/material.dart';

class Inventario with ChangeNotifier {
  final String id;
  final String url;
  final String nome;
  bool ativo;

  Inventario({
    this.id,
    this.url,
    this.nome,
    this.ativo,
  });
}
