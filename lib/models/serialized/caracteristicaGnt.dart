import 'dominioGnt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'caracteristicaGnt.g.dart';

@JsonSerializable()
class CaracteristicaGnt {
  final int id;
  final String codigo;
  final String descricao;
  final String chaveDominio;
  final DominioGnt dominioTipoDado;

  CaracteristicaGnt(
    this.id,
    this.codigo,
    this.descricao,
    this.chaveDominio,
    this.dominioTipoDado,
  );

  factory CaracteristicaGnt.fromJson(Map<String, dynamic> json) =>
      _$CaracteristicaGntFromJson(json);

  Map<String, dynamic> toJson() => _$CaracteristicaGntToJson(this);
}
