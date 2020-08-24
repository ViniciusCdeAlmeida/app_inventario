import 'package:app_inventario/models/caracteristicas.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/materialEst.dart';
import 'package:app_inventario/models/organizacao.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'bemPatrimonial.g.dart';

@HiveType(typeId: 0)
class BemPatrimonial with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String numeroPatrimonial;

  @HiveField(2)
  final String numeroPatrimonialCompleto;

  @HiveField(3)
  final String numeroPatrimonialCompletoAntigo;

  @HiveField(4)
  final MaterialEst material;

  @HiveField(5)
  final List<Caracteristicas> caracteristicas;

  BemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialCompleto,
    this.numeroPatrimonialCompletoAntigo,
    this.material,
    this.caracteristicas,
  });
}

@HiveType(typeId: 1)
class BemPatrimonialDemanda with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String numeroPatrimonial;

  @HiveField(2)
  final String numeroPatrimonialCompleto;

  @HiveField(3)
  final String numeroPatrimonialCompletoAntigo;

  @HiveField(4)
  final Dominio dominioSituacaoFisica;

  @HiveField(5)
  final Dominio dominioStatus;

  @HiveField(6)
  final MaterialEst materialBem;

  @HiveField(7)
  final List<Caracteristicas> caracteristicas;

  @HiveField(8)
  final Organizacao estruturaOrganizacionalAtual;

  BemPatrimonialDemanda({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialCompleto,
    this.numeroPatrimonialCompletoAntigo,
    this.materialBem,
    this.caracteristicas,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.estruturaOrganizacionalAtual,
  });
}
