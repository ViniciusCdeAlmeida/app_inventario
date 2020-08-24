import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/materialCaracteristica.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'caracteristicas.g.dart';

@HiveType(typeId: 4)
class Caracteristicas with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  String valorMaterialCaracteristica;

  @HiveField(2)
  final MaterialCaracteristica materialCaracteristica;

  @HiveField(3)
  final Dominio dominiosCaracteristicas;

  Caracteristicas({
    this.id,
    this.valorMaterialCaracteristica,
    this.materialCaracteristica,
    this.dominiosCaracteristicas,
  });
}
