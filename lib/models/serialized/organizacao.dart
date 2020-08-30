import 'package:json_annotation/json_annotation.dart';

part 'organizacao.g.dart';

@JsonSerializable()
class Organizacao {
  int id;
  String codigo;
  String nome;
  String sigla;
  String codigoENome;
  String statusUnidade;

  Organizacao(
    this.id,
    this.nome,
    this.codigo,
    this.codigoENome,
    this.sigla,
    this.statusUnidade,
  );

  factory Organizacao.fromJson(Map<String, dynamic> json) =>
      _$OrganizacaoFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizacaoToJson(this);
}
