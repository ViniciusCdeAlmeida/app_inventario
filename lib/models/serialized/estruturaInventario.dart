import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estruturaInventario.g.dart';

@JsonSerializable()
class EstruturaInventario with ChangeNotifier {
  final int id;
  final String nome;
  final String dataEspelho;
  final String dataAdicao;
  int naoInformados;
  int naoInconsistencia;
  int emInconsistencia;
  int tratados;
  int baixados;
  final String statusEstrutura;
  final int idEstrutura;
  int previstos = 0;

  EstruturaInventario({
    this.id,
    this.dataEspelho,
    this.nome,
    this.dataAdicao,
    this.naoInformados,
    this.naoInconsistencia,
    this.emInconsistencia,
    this.tratados,
    this.baixados,
    this.statusEstrutura,
    this.idEstrutura,
    this.previstos,
  });

  factory EstruturaInventario.fromJson(Map<String, dynamic> json) =>
      _$EstruturaInventarioFromJson(json);

  Map<String, dynamic> toJson() => _$EstruturaInventarioToJson(this);
}
