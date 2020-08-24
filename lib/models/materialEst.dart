import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'materialEst.g.dart';

@HiveType(typeId: 13)
class MaterialEst with ChangeNotifier {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String descricao;

  @HiveField(2)
  final String codigoEDescricao;

  MaterialEst({
    this.id,
    this.descricao,
    this.codigoEDescricao,
  });
}
