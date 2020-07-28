import 'package:app_inventario/models/materialCaracteristica.dart';
import 'package:flutter/material.dart';

class Caracteristicas with ChangeNotifier {
  final int id;
  final String valorMaterialCaracteristica;
  final MaterialCaracteristica materialCaracteristica;

  Caracteristicas({
    this.id,
    this.valorMaterialCaracteristica,
    this.materialCaracteristica,
  });
}
