import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/organizacao.dart';
import 'package:flutter/material.dart';

class EstruturaInventarioNew with ChangeNotifier {
  final int id;
  final Dominio dominioStatusInventarioEstrutura;
  final List<DadosBensPatrimoniais> dadosBensPatrimoniais;
  final Organizacao estruturaOrganizacional;
  final int idInventario;

  EstruturaInventarioNew({
    this.id,
    this.dominioStatusInventarioEstrutura,
    this.dadosBensPatrimoniais,
    this.estruturaOrganizacional,
    this.idInventario,
  });
}
