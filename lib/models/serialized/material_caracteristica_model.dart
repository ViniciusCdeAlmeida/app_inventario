import 'package:GRPInventario/models/index_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'material_caracteristica_model.g.dart';

@JsonSerializable()
class MaterialCaracteristica {
  final int id;
  final String codigo;
  final String descricao;
  final Caracteristica caracteristica;

  MaterialCaracteristica(
    this.id,
    this.codigo,
    this.descricao,
    this.caracteristica,
  );

  factory MaterialCaracteristica.fromJson(Map<String, dynamic> json) =>
      _$MaterialCaracteristicaFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialCaracteristicaToJson(this);
}
