import 'package:json_annotation/json_annotation.dart';

import 'package:GRPInventario/models/index_models.dart';

part 'inventario_dados_bem_patrimonial_model.g.dart';

/// Modelo para o objeto [InventarioDadosBemPatrimonial].
@JsonSerializable()
class InventarioDadosBemPatrimonial {
  int id;
  String numeroPatrimonial;
  String numeroPatrimonialAntigo;
  String numeroPatrimonialNovo;
  BemPatrimonial bemPatrimonial;
  Dominio dominioSituacaoFisica;
  Dominio dominioStatus;
  Dominio dominioStatusInventarioBem;
  String nomeUsuarioColeta;
  String identificacaoPatrimonial;
  int idBemPatrimonial;

  InventarioDadosBemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialAntigo,
    this.numeroPatrimonialNovo,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.bemPatrimonial,
    this.identificacaoPatrimonial,
    this.dominioStatusInventarioBem,
    this.nomeUsuarioColeta,
    this.idBemPatrimonial,
  });

  factory InventarioDadosBemPatrimonial.fromJson(Map<String, dynamic> json) =>
      _$InventarioDadosBemPatrimonialFromJson(json);

  Map<String, dynamic> toJson() => _$InventarioDadosBemPatrimonialToJson(this);
}
