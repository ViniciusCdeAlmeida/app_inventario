import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/materialCaracteristica.dart';
import 'package:flutter/material.dart';

class Caracteristicas with ChangeNotifier {
  final int id;
  String valorMaterialCaracteristica;
  final MaterialCaracteristica materialCaracteristica;
  final Dominio dominiosCaracteristicas;

  Caracteristicas({
    this.id,
    this.valorMaterialCaracteristica,
    this.materialCaracteristica,
    this.dominiosCaracteristicas,
  });
}
