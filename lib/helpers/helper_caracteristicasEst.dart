import 'package:app_inventario/helpers/helper_materialCaracteristicaEst.dart';
import 'package:app_inventario/models/caracteristicas.dart';

Caracteristicas helperCaracteristicas(dynamic listaCaracteristicas) {
  return Caracteristicas(
      id: listaCaracteristicas['id'],
      valorMaterialCaracteristica:
          listaCaracteristicas['valorMaterialCaracteristica'],
      materialCaracteristica: helperMaterialCaracteristica(
          listaCaracteristicas['materialCaracteristica']));
}
