import 'package:app_inventario/models/serialized/materialCaracteristicaGnt.dart';

import 'package:json_annotation/json_annotation.dart';

part 'caracteristicasGnt.g.dart';

@JsonSerializable()
class CaracteristicasGnt {
  final int id;
  String valorMaterialCaracteristica;
  final MaterialCaracteristicaGnt materialCaracteristica;

  CaracteristicasGnt(
    this.id,
    this.valorMaterialCaracteristica,
    this.materialCaracteristica,
  );

  factory CaracteristicasGnt.fromJson(Map<String, dynamic> json) =>
      _$CaracteristicasGntFromJson(json);

  // factory CaracteristicasGnt.fromJsonList(List<Map<String, dynamic>> json) =>
  //     _$CaracteristicasGntFromJson(json);

  Map<String, dynamic> toJson() => _$CaracteristicasGntToJson(this);
}
