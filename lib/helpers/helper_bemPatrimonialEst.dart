import 'package:app_inventario/helpers/helper_caracteristicasEst.dart';
import 'package:app_inventario/helpers/helper_materialEst.dart';
import 'package:app_inventario/models/bemPatrimonial.dart';
import 'package:app_inventario/models/dominio.dart';

BemPatrimonial helperBemPatrimonialEst(
    dynamic listaBemPatrimonial, List<Dominio> listaDominios) {
  //verifica null
  if (listaBemPatrimonial != null) {
    return BemPatrimonial(
      id: listaBemPatrimonial['id'],
      numeroPatrimonial: listaBemPatrimonial['numeroPatrimonial'],
      numeroPatrimonialCompleto:
          listaBemPatrimonial['numeroPatrimonialCompleto'],
      material: helperMaterial(listaBemPatrimonial['material']),
      caracteristicas: (listaBemPatrimonial['caracteristicas'] as List<dynamic>)
          .map(
            (dadosCaractetisticas) =>
                helperCaracteristicas(dadosCaractetisticas, listaDominios),
          )
          .toList(),
    );
  }
}
