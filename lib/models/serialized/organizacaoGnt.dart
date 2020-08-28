import 'package:json_annotation/json_annotation.dart';

part 'organizacaoGnt.g.dart';

@JsonSerializable()
class OrganizacaoGnt {
  final int id;
  final String codigo;
  final String nome;
  final String sigla;
  final String codigoENome;
  final String statusUnidade;

  OrganizacaoGnt(
    this.id,
    this.nome,
    this.codigo,
    this.codigoENome,
    this.sigla,
    this.statusUnidade,
  );

  factory OrganizacaoGnt.fromJson(Map<String, dynamic> json) =>
      _$OrganizacaoGntFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizacaoGntToJson(this);
}
