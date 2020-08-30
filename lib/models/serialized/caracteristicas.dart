import 'package:app_inventario/models/serialized/materialCaracteristica.dart';

import 'package:json_annotation/json_annotation.dart';

part 'caracteristicas.g.dart';

@JsonSerializable()
class Caracteristicas {
  final int id;
  String valorMaterialCaracteristica;
  final MaterialCaracteristica materialCaracteristica;

  Caracteristicas(
    this.id,
    this.valorMaterialCaracteristica,
    this.materialCaracteristica,
  );

  factory Caracteristicas.fromJson(Map<String, dynamic> json) =>
      _$CaracteristicasFromJson(json);

  Map<String, dynamic> toJson() => _$CaracteristicasToJson(this);
}
