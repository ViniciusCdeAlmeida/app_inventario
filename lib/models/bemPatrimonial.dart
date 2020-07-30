import 'package:app_inventario/models/caracteristicas.dart';
import 'package:app_inventario/models/material.dart';
import 'package:flutter/material.dart';

class BemPatrimonial with ChangeNotifier {
  final int id;
  final String numeroPatrimonial;
  final String numeroPatrimonialCompleto;
  final String numeroPatrimonialCompletoAntigo;
  final MaterialEst material;
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
