import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

part 'estruturaInventario.g.dart';

@HiveType(typeId: 8)
class EstruturaInventario with ChangeNotifier {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String nome;
  @HiveField(2)
  final String dataEspelho;
  @HiveField(3)
  final String dataAdicao;
  @HiveField(4)
  int naoInformados;
  @HiveField(5)
  int naoInconsistencia;
  @HiveField(6)
  int emInconsistencia;
  @HiveField(7)
  int tratados;
  @HiveField(8)
  int baixados;
  @HiveField(9)
  final String statusEstrutura;
  @HiveField(10)
  final int idEstrutura;
  @HiveField(11)
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
}
