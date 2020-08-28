import 'caracteristicaGnt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'materialCaracteristicaGnt.g.dart';

@JsonSerializable()
class MaterialCaracteristicaGnt {
  final int id;
  final String codigo;
  final String descricao;
  final CaracteristicaGnt caracteristica;

  MaterialCaracteristicaGnt(
    this.id,
    this.codigo,
    this.descricao,
    this.caracteristica,
  );

  factory MaterialCaracteristicaGnt.fromJson(Map<String, dynamic> json) =>
      _$MaterialCaracteristicaGntFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialCaracteristicaGntToJson(this);
}
