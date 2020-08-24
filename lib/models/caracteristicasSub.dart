import 'package:app_inventario/models/materialCaracteristica.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'caracteristicasSub.g.dart';

@HiveType(typeId: 5)
class CaracteristicasSub with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String valorMaterialCaracteristica;

  @HiveField(2)
  final MaterialCaracteristica materialCaracteristica;

  CaracteristicasSub({
    this.id,
    this.valorMaterialCaracteristica,
    this.materialCaracteristica,
  });
}
