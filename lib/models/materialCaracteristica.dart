import 'package:app_inventario/models/caracteristica.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'materialCaracteristica.g.dart';

@HiveType(typeId: 12)
class MaterialCaracteristica with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String codigo;

  @HiveField(2)
  final String descricao;

  @HiveField(3)
  final Caracteristica caracteristica;

  MaterialCaracteristica({
    this.id,
    this.codigo,
    this.descricao,
    this.caracteristica,
  });
}
