import 'package:app_inventario/models/materialCaracteristica.dart';
import 'package:flutter/material.dart';

class CaracteristicasSub with ChangeNotifier {
  final int id;
  final String valorMaterialCaracteristica;
  final MaterialCaracteristica materialCaracteristica;

  CaracteristicasSub({
    this.id,
    this.valorMaterialCaracteristica,
    this.materialCaracteristica,
  });
}
