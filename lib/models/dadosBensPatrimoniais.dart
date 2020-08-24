import 'package:app_inventario/models/bemPatrimonial.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/inventarioBemPatrimonial.dart';
import 'package:app_inventario/models/materialEst.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'dadosBensPatrimoniais.g.dart';

@HiveType(typeId: 6)
class DadosBensPatrimoniais with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String numeroPatrimonial;

  @HiveField(2)
  Dominio dominioSituacaoFisica;

  @HiveField(3)
  Dominio dominioStatus;

  @HiveField(4)
  final Dominio dominioStatusInventarioBem;

  @HiveField(5)
  final BemPatrimonial bemPatrimonial;

  @HiveField(6)
  final int idInventario;

  @HiveField(7)
  final int idInventarioEstruturaOrganizacional;

  @HiveField(8)
  final MaterialEst material;

  @HiveField(9)
  final InventarioBemPatrimonial inventarioBemPatrimonial;

  @HiveField(10)
  bool inventariado;

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
  });
}
