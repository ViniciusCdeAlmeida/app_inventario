import 'caracteristica.dart';
import 'package:json_annotation/json_annotation.dart';

part 'materialCaracteristica.g.dart';

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
