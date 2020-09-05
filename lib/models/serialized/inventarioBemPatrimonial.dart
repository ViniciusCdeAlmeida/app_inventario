import 'package:app_inventario/models/serialized/caracteristicas.dart';
import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:json_annotation/json_annotation.dart';

part 'inventarioBemPatrimonial.g.dart';

@JsonSerializable()
class InventarioBemPatrimonial with mat.ChangeNotifier {
  int id;
  int idDadosBemPatrimonialMobile;
  int idInventarioEstruturaOrganizacionalMobile;
  int idUnidadeOrganizacional;
  String numeroPatrimonial;
  String numeroPatrimonialAntigo;
  String numeroPatrimonialNovo;
  String nomeUsuarioColeta;
  String tipoMobile;
  bool novoBemInvetariado;
  bool enviado = false;
  bool bemNaoEncontrado;
  bool bemNaoInventariado;
  List<Caracteristicas> caracteristicas;
  Dominio dominioSituacaoFisica;
  Dominio dominioStatus;
  Dominio dominioStatusInventarioBem;
  Material material;

  InventarioBemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialAntigo,
    this.numeroPatrimonialNovo,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.caracteristicas,
    this.bemNaoEncontrado,
    this.bemNaoInventariado,
    this.dominioStatusInventarioBem,
    this.idDadosBemPatrimonialMobile,
    this.idInventarioEstruturaOrganizacionalMobile,
    this.material,
    this.nomeUsuarioColeta,
    this.novoBemInvetariado,
    this.tipoMobile,
    this.enviado,
    this.idUnidadeOrganizacional,
  });

  factory InventarioBemPatrimonial.fromJson(Map<String, dynamic> json) =>
      _$InventarioBemPatrimonialFromJson(json);

  Map<String, dynamic> toJson() => _$InventarioBemPatrimonialToJson(this);
}
