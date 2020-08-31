import 'package:app_inventario/models/serialized/caracteristicas.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/material.dart';
import 'package:app_inventario/models/serialized/organizacao.dart';
import 'package:flutter/material.dart' as mat;
import 'package:json_annotation/json_annotation.dart';

part 'bemPatrimonial.g.dart';

@JsonSerializable()
class BemPatrimonial with mat.ChangeNotifier {
  int id;
  String numeroPatrimonial;
  String numeroPatrimonialCompleto;
  String numeroPatrimonialCompletoAntigo;
  Dominio dominioSituacaoFisica;
  Dominio dominioStatus;
  Material material;
  List<Caracteristicas> caracteristicas;
  Organizacao estruturaOrganizacionalAtual;

  BemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialCompleto,
    this.numeroPatrimonialCompletoAntigo,
    this.material,
    this.caracteristicas,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.estruturaOrganizacionalAtual,
  });

  factory BemPatrimonial.fromJson(Map<String, dynamic> json) =>
      _$BemPatrimonialFromJson(json);

  Map<String, dynamic> toJson() => _$BemPatrimonialToJson(this);
}
