import 'package:app_inventario/helpers/helper_bemPatrimonialEst.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/helpers/helper_inventarioBemPatrimonial.dart';
import 'package:app_inventario/helpers/helper_materialEst.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';
import 'package:app_inventario/models/dominio.dart';

DadosBensPatrimoniais helperDadosBensPatrimoniaisEst(
    dynamic listaDadosBemPatrimonial, List<Dominio> listaDominios) {
  return DadosBensPatrimoniais(
    id: listaDadosBemPatrimonial['id'],
    idInventario: listaDadosBemPatrimonial['idInventario'],
    numeroPatrimonial: listaDadosBemPatrimonial['numeroPatrimonial'],
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
        listaDadosBemPatrimonial['bemPatrimonial'], listaDominios),
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
