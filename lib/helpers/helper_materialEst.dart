import 'package:app_inventario/models/materialEst.dart';

MaterialEst helperMaterial(Map dominio) {
  if (dominio != null) {
    return MaterialEst(
      id: dominio['id'],
      codigoEDescricao: dominio['codigoEDescricao'],
      descricao: dominio['descricao'],
    );
  } else
    return null;
}
