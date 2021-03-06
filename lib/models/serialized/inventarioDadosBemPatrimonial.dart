import 'package:flutter/material.dart' as mat;
import 'package:json_annotation/json_annotation.dart';

import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dominio.dart';

part 'inventarioDadosBemPatrimonial.g.dart';

@JsonSerializable()
class InventarioDadosBemPatrimonial with mat.ChangeNotifier {
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
