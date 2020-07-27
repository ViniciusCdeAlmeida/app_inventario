import 'package:flutter/material.dart';

class Bens with ChangeNotifier {
  final int id;
  final String descricaoDominioSituacaoFisica;
  final String codigoEstrutura;
  final int idEstutura;
  final String descricaoMaterial;
  final String nomeEstrutura;
  final String numeroPatrimonial;
  final String descricaoDominioStatus;

  Bens({
    this.id,
    this.descricaoDominioSituacaoFisica,
    this.codigoEstrutura,
    this.idEstutura,
    this.descricaoMaterial,
    this.nomeEstrutura,
    this.numeroPatrimonial,
    this.descricaoDominioStatus,
  });
}
