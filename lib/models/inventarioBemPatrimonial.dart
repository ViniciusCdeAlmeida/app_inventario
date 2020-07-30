import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';

class InventarioBemPatrimonial with ChangeNotifier {
  final int id;
  final String numeroPatrimonial;
  final String numeroPatrimonialAntigo;
  final String numeroPatrimonialNovo;
  final Dominio dominioSituacaoFisica;
  final Dominio dominioStatus;

  InventarioBemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialAntigo,
    this.numeroPatrimonialNovo,
    this.dominioSituacaoFisica,
    this.dominioStatus,
  });
}
