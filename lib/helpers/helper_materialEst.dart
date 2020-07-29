import 'package:app_inventario/models/material.dart';

MaterialEst helperMaterial(Map dominio) {
  if (dominio != null) {
    return MaterialEst(
      codigoEDescricao: dominio['codigoEDescricao'],
      descricao: dominio['descricao'],
    );
  }
}
