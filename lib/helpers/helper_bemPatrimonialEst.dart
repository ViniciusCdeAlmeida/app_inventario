import 'package:app_inventario/helpers/helper_caracteristicasEst.dart';
import 'package:app_inventario/models/bemPatrimonial.dart';

BemPatrimonial helperBemPatrimonialEst(dynamic listaBemPatrimonial) {
  return BemPatrimonial(
    id: listaBemPatrimonial['id'],
    numeroPatrimonial: listaBemPatrimonial['numeroPatrimonial'],
    numeroPatrimonialCompleto: listaBemPatrimonial['numeroPatrimonialCompleto'],
    caracteristicas: (listaBemPatrimonial['caracteristicas'] as List<dynamic>)
        .map(
          (dadosCaractetisticas) => helperCaracteristicas(dadosCaractetisticas),
        )
        .toList(),
  );
}
