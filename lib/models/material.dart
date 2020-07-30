import 'package:flutter/material.dart';

class MaterialEst with ChangeNotifier {
  final int id;
  final String descricao;
  final String codigoEDescricao;

  MaterialEst({
    this.id,
    this.descricao,
    this.codigoEDescricao,
  });
}
