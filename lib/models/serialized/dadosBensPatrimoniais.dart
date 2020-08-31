import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/inventarioDadosBemPatrimonial.dart';
import 'package:app_inventario/models/serialized/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:json_annotation/json_annotation.dart';

part 'dadosBensPatrimoniais.g.dart';

@JsonSerializable()
class DadosBensPatrimoniais with mat.ChangeNotifier {
  final int id;
  final String numeroPatrimonial;
  Dominio dominioSituacaoFisica;
  Dominio dominioStatus;
  final Dominio dominioStatusInventarioBem;
  BemPatrimonial bemPatrimonial;
  final int idInventario;
  final int idInventarioEstruturaOrganizacional;
  final Material material;
  InventarioDadosBemPatrimonial inventarioBemPatrimonial;
  bool inventariado;
  final int idBemPatrimonial;
  final String numeroPatrimonialCompleto;
  final int idEstruturaOrganizacional;

  DadosBensPatrimoniais({
    this.id,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.dominioStatusInventarioBem,
    this.bemPatrimonial,
    this.idInventario,
    this.idInventarioEstruturaOrganizacional,
    this.material,
    this.inventarioBemPatrimonial,
    this.numeroPatrimonial,
    this.inventariado,
    this.numeroPatrimonialCompleto,
    this.idEstruturaOrganizacional,
    this.idBemPatrimonial,
  });

  factory DadosBensPatrimoniais.fromJson(Map<String, dynamic> json) =>
      _$DadosBensPatrimoniaisFromJson(json);

  Map<String, dynamic> toJson() => _$DadosBensPatrimoniaisToJson(this);
}
