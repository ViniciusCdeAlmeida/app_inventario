import 'package:flutter/material.dart';

class Dominio with ChangeNotifier {
  final int id;
  final String nome;
  final String descricao;
  final String chave;
  final int codigo;

  Dominio({
    this.id,
    this.nome,
    this.descricao,
    this.chave,
    this.codigo,
  });
}
