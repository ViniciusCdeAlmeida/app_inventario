import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:flutter/material.dart';

class EstruturaInventarioNew with ChangeNotifier {
  final int id;
  final Dominio dominioStatusInventarioEstrutura;
  final List<DadosBensPatrimoniais> dadosBensPatrimoniais;
  final int idInventario;

  EstruturaInventarioNew({
    this.id,
    this.dominioStatusInventarioEstrutura,
    this.dadosBensPatrimoniais,
    this.idInventario,
  });
}
