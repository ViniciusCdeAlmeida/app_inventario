import 'package:app_inventario/models/bemPatrimonial.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/material.dart';
import 'package:flutter/material.dart';

class DadosBensPatrimoniais with ChangeNotifier {
  final int id;
  final Dominio dominioSituacaoFisica;
  final Dominio dominioStatus;
  final Dominio dominioStatusInventarioBem;
  final BemPatrimonial bemPatrimonial;
  final int idInventario;
  final int idInventarioEstruturaOrganizacional;
  final MaterialEst material;

  DadosBensPatrimoniais({
    this.id,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.dominioStatusInventarioBem,
    this.bemPatrimonial,
    this.idInventario,
    this.idInventarioEstruturaOrganizacional,
    this.material,
  });
}
