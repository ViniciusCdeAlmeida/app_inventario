import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';

class Caracteristica with ChangeNotifier {
  final int id;
  final String codigo;
  final String descricao;
  final Dominio dominioTipoDado;

  Caracteristica({
    this.id,
    this.codigo,
    this.descricao,
    this.dominioTipoDado,
  });
}
