import 'package:GRPInventario/models/index_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'caracteristica_model.g.dart';

/// Modelo para o objeto [Caracteristica].
@JsonSerializable()
class Caracteristica {
  final int id;
  final String codigo;
  final String descricao;
  final String chaveDominio;
  final Dominio dominioTipoDado;

  Caracteristica(
    this.id,
    this.codigo,
    this.descricao,
    this.chaveDominio,
    this.dominioTipoDado,
  );

  factory Caracteristica.fromJson(Map<String, dynamic> json) =>
      _$CaracteristicaFromJson(json);

  Map<String, dynamic> toJson() => _$CaracteristicaToJson(this);
}
