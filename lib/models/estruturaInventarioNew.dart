import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/levantamento.dart';
import 'package:app_inventario/models/organizacao.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'estruturaInventarioNew.g.dart';

@HiveType(typeId: 9)
class EstruturaInventarioNew with ChangeNotifier {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final Dominio dominioStatusInventarioEstrutura;
  @HiveField(2)
  final List<DadosBensPatrimoniais> dadosBensPatrimoniais;
  @HiveField(3)
  final Organizacao estruturaOrganizacional;
  @HiveField(4)
  final Levantamento inventario;
  @HiveField(5)
  final int idInventario;

  EstruturaInventarioNew({
    this.id,
    this.dominioStatusInventarioEstrutura,
    this.dadosBensPatrimoniais,
    this.estruturaOrganizacional,
    this.idInventario,
    this.inventario,
  });
}
