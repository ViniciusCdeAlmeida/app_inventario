import 'package:json_annotation/json_annotation.dart';

part 'dominioGnt.g.dart';

@JsonSerializable()
class DominioGnt {
  final int id;
  final String nome;
  final String descricao;
  final String chave;
  final int codigo;

  DominioGnt(
    this.id,
    this.nome,
    this.chave,
    this.descricao,
    this.codigo,
  );

  factory DominioGnt.fromJson(Map<String, dynamic> json) =>
      _$DominioGntFromJson(json);

  Map<String, dynamic> toJson() => _$DominioGntToJson(this);
}
