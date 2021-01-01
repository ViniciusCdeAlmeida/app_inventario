import 'package:json_annotation/json_annotation.dart';

part 'organizacao_model.g.dart';

/// Modelo para o objeto [Organizacao].
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
