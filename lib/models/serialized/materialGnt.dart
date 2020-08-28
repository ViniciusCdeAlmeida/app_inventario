import 'package:json_annotation/json_annotation.dart';

part 'materialGnt.g.dart';

@JsonSerializable()
class MaterialGnt {
  final int id;
  final String codigoEDescricao;
  final String descricao;

  MaterialGnt(
    this.id,
    this.codigoEDescricao,
    this.descricao,
  );

  factory MaterialGnt.fromJson(Map<String, dynamic> json) =>
      _$MaterialGntFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialGntToJson(this);
}
