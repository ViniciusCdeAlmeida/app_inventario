import 'package:flutter/material.dart';

class Conexao with ChangeNotifier {
  final String id;
  final String url;
  final String nome;
  bool ativo;

  Conexao({
    this.id,
    this.url,
    this.nome,
    this.ativo,
  });
}
