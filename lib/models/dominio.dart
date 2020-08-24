import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'dominio.g.dart';

@HiveType(typeId: 7)
class Dominio with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String nome;

  @HiveField(2)
  final String descricao;

  @HiveField(3)
  final String chave;

  @HiveField(4)
  final int codigo;

  Dominio({
    this.id,
    this.nome,
    this.descricao,
    this.chave,
    this.codigo,
  });
}
