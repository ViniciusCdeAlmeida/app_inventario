import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

@JsonSerializable()
class Material {
  int id;
  String codigoEDescricao;
  String descricao;

  Material(
    this.id,
    this.codigoEDescricao,
    this.descricao,
  );

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialToJson(this);
}
