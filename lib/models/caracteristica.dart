import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'caracteristica.g.dart';

@HiveType(typeId: 3)
class Caracteristica with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String codigo;

  @HiveField(2)
  final String descricao;

  @HiveField(3)
  final String chaveDominio;

  @HiveField(4)
  final Dominio dominioTipoDado;

  Caracteristica({
    this.id,
    this.codigo,
    this.descricao,
    this.dominioTipoDado,
    this.chaveDominio,
  });
}
