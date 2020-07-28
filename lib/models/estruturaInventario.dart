import 'package:flutter/material.dart';

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
}
