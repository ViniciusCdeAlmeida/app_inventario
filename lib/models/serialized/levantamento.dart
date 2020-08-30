import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:flutter/material.dart' as mat;
import 'package:json_annotation/json_annotation.dart';

part 'levantamento.g.dart';

@JsonSerializable()
class Levantamento with mat.ChangeNotifier {
  final int id;
  final Dominio dominioTipoInventario;
  final Dominio dominioStatusInventario;
  final String codigoENome;
  final String nome;
  final String codigo;
  final int quantidadeEstruturas;
  final int quantidadeTotalBens;
  final int quantidadeTotalBensTratados;
  final int quantidadeTotalBensEmInconsistencia;
  final int quantidadeTotalBensSemInconsistencia;
  final int quantidadeTotalBensBaixados;
  final int idOrganizacao;

  Levantamento({
    this.id,
    this.dominioTipoInventario,
    this.dominioStatusInventario,
    this.codigoENome,
    this.codigo,
    this.nome,
    this.quantidadeEstruturas,
    this.quantidadeTotalBens,
    this.quantidadeTotalBensTratados,
    this.quantidadeTotalBensSemInconsistencia,
    this.quantidadeTotalBensEmInconsistencia,
    this.quantidadeTotalBensBaixados,
    this.idOrganizacao,
  });

  factory Levantamento.fromJson(Map<String, dynamic> json) =>
      _$LevantamentoFromJson(json);

  Map<String, dynamic> toJson() => _$LevantamentoToJson(this);
}
