import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'bens.g.dart';

@HiveType(typeId: 2)
class Bens with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String descricaoDominioSituacaoFisica;

  @HiveField(2)
  final String codigoEstrutura;

  @HiveField(3)
  final int idEstutura;

  @HiveField(4)
  final String descricaoMaterial;

  @HiveField(5)
  final String nomeEstrutura;

  @HiveField(6)
  final String numeroPatrimonial;

  @HiveField(7)
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
