import 'package:GRPInventario/models/index_models.dart';

import 'package:json_annotation/json_annotation.dart';

part 'caracteristicas_model.g.dart';

/// Modelo para o objeto [Caracteristicas].
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
