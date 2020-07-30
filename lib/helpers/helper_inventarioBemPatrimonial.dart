import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/models/inventarioBemPatrimonial.dart';

InventarioBemPatrimonial helperInventarioBemPatrimonial(Map listaBens) {
  return InventarioBemPatrimonial(
    id: listaBens['id'],
    numeroPatrimonial: listaBens['numeroPatrimonial'],
    numeroPatrimonialAntigo: listaBens['numeroPatrimonialAntigo'],
    numeroPatrimonialNovo: listaBens['numeroPatrimonialNovo'],
    dominioSituacaoFisica: listaBens['dominioSituacaoFisica'] != null
        ? helperDominio(listaBens['dominioSituacaoFisica'])
        : null,
    dominioStatus: listaBens['dominioStatus'] != null
        ? helperDominio(listaBens['dominioStatus'])
        : null,
  );
}
