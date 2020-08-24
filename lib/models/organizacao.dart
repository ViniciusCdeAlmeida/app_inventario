import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'organizacao.g.dart';

@HiveType(typeId: 14)
class Organizacao with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String codigo;

  @HiveField(2)
  final String nome;

  @HiveField(3)
  final String sigla;

  @HiveField(4)
  final String codigoENome;

  @HiveField(5)
  final String statusUnidade;

  Organizacao({
    this.id,
    this.codigo,
    this.nome,
    this.sigla,
    this.codigoENome,
    this.statusUnidade,
  });
}
