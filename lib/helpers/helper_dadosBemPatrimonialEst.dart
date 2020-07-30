import 'package:app_inventario/helpers/helper_bemPatrimonialEst.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/helpers/helper_inventarioBemPatrimonial.dart';
import 'package:app_inventario/helpers/helper_materialEst.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';

DadosBensPatrimoniais helperDadosBensPatrimoniaisEst(
    dynamic listaDadosBemPatrimonial) {
  return DadosBensPatrimoniais(
    id: listaDadosBemPatrimonial['id'],
    idInventario: listaDadosBemPatrimonial['idInventario'],
    idInventarioEstruturaOrganizacional:
        listaDadosBemPatrimonial['idInventarioEstruturaOrganizacional'],
    dominioSituacaoFisica:
        listaDadosBemPatrimonial['dominioSituacaoFisica'] != null
            ? helperDominio(listaDadosBemPatrimonial['dominioSituacaoFisica'])
            : null,
    dominioStatus: listaDadosBemPatrimonial['dominioStatus'] != null
        ? helperDominio(listaDadosBemPatrimonial['dominioStatus'])
        : null,
    dominioStatusInventarioBem:
        listaDadosBemPatrimonial['dominioStatusInventarioBem'] != null
            ? helperDominio(
                listaDadosBemPatrimonial['dominioStatusInventarioBem'])
            : null,
    bemPatrimonial: helperBemPatrimonialEst(
      listaDadosBemPatrimonial['bemPatrimonial'],
    ),
    material: helperMaterial(
      listaDadosBemPatrimonial['material'],
    ),
    inventarioBemPatrimonial:
        listaDadosBemPatrimonial['inventarioBemPatrimonial'] != null
            ? helperInventarioBemPatrimonial(
                listaDadosBemPatrimonial['inventarioBemPatrimonial'])
            : null,
  );
}
