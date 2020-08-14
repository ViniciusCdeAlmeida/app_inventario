import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/helpers/helper_materialCaracteristicaEst.dart';
import 'package:app_inventario/models/caracteristicas.dart';
import 'package:app_inventario/models/dominio.dart';

Caracteristicas helperCaracteristicas(
    dynamic listaCaracteristicas, List<Dominio> listaDominios) {
  return Caracteristicas(
    id: listaCaracteristicas['id'],
    valorMaterialCaracteristica:
        listaCaracteristicas['valorMaterialCaracteristica'],
    materialCaracteristica: helperMaterialCaracteristica(
        listaCaracteristicas['materialCaracteristica']),
    dominiosCaracteristicas: helperDominioFromJson(
      listaDominios.firstWhere(
          (element) =>
              element.id.toString() ==
              listaCaracteristicas['valorMaterialCaracteristica'],
          orElse: () => null),
    ),
  );
}
