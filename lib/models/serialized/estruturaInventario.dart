import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:app_inventario/models/serialized/organizacao.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estruturaInventario.g.dart';

@JsonSerializable()
class EstruturaInventario with ChangeNotifier {
  final int id;
  final Organizacao estruturaOrganizacional;
  final Dominio dominioStatusInventarioEstrutura;
  final int idInventario;

  EstruturaInventario({
    this.id,
    this.estruturaOrganizacional,
    this.dominioStatusInventarioEstrutura,
    this.idInventario,
  });

  factory EstruturaInventario.fromJson(Map<String, dynamic> json) =>
      _$EstruturaInventarioFromJson(json);

  Map<String, dynamic> toJson() => _$EstruturaInventarioToJson(this);
}
