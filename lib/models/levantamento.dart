import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'levantamento.g.dart';

@HiveType(typeId: 11)
class Levantamento with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final Dominio dominioTipoInventario;

  @HiveField(2)
  final Dominio dominioStatusInventario;

  @HiveField(3)
  final String codigoENome;

  @HiveField(4)
  final String nome;

  @HiveField(5)
  final String codigo;

  @HiveField(6)
  final int quantidadeEstruturas;

  @HiveField(7)
  final int quantidadeTotalBens;

  @HiveField(8)
  final int quantidadeTotalBensTratados;

  @HiveField(9)
  final int quantidadeTotalBensEmInconsistencia;

  @HiveField(10)
  final int quantidadeTotalBensSemInconsistencia;

  @HiveField(11)
  final int quantidadeTotalBensBaixados;

  @HiveField(12)
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
}
