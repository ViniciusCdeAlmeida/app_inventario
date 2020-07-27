import 'package:flutter/material.dart';

class EstruturaInventario with ChangeNotifier {
  final int id;
  final String nome;
  final String dataEspelho;
  final String dataAdicao;
  final int naoInformados;
  final int naoInconsistencia;
  final int emInconsistencia;
  final int tratados;
  final int baixados;
  final String statusEstrutura;
  final int idEstrutura;

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
  });
}
