import 'package:json_annotation/json_annotation.dart';

part 'dominio.g.dart';

@JsonSerializable()
class Dominio {
  int id;
  String nome;
  String descricao;
  String chave;
  int codigo;

  Dominio({
    this.id,
    this.nome,
    this.chave,
    this.descricao,
    this.codigo,
  });

  factory Dominio.fromJson(Map<String, dynamic> json) =>
      _$DominioFromJson(json);

  Map<String, dynamic> toJson() => _$DominioToJson(this);
}
