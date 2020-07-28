import 'package:app_inventario/models/caracteristica.dart';
import 'package:flutter/material.dart';

class MaterialCaracteristica with ChangeNotifier {
  final int id;
  final String codigo;
  final String descricao;
  final Caracteristica caracteristica;

  MaterialCaracteristica({
    this.id,
    this.codigo,
    this.descricao,
    this.caracteristica,
  });
}
