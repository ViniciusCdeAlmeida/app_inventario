import 'package:GRPInventario/models/index_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizacoes_model.g.dart';

@JsonSerializable()
class Organizacoes {
  final int id;
  final Organizacao organizacao;

  Organizacoes({
    this.id,
    this.organizacao,
  });

  factory Organizacoes.fromJson(Map<String, dynamic> json) =>
      _$OrganizacoesFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizacoesToJson(this);
}
