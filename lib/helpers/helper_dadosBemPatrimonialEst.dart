import 'package:app_inventario/helpers/helper_bemPatrimonialEst.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/helpers/helper_materialEst.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';

DadosBensPatrimoniais helperDadosBensPatrimoniaisEst(
    dynamic listaDadosBemPatrimonial) {
  return DadosBensPatrimoniais(
    id: listaDadosBemPatrimonial['id'],
    idInventario: listaDadosBemPatrimonial['idInventario'],
    idInventarioEstruturaOrganizacional:
        listaDadosBemPatrimonial['idInventarioEstruturaOrganizacional'],
    dominioSituacaoFisica: helperDominio(
      listaDadosBemPatrimonial['dominioSituacaoFisica'],
    ),
    dominioStatus: helperDominio(
      listaDadosBemPatrimonial['dominioStatus'],
    ),
    dominioStatusInventarioBem: helperDominio(
      listaDadosBemPatrimonial['dominioStatusInventarioBem'],
    ),
    bemPatrimonial: helperBemPatrimonialEst(
      listaDadosBemPatrimonial['bemPatrimonial'],
    ),
    material: helperMaterial(
      listaDadosBemPatrimonial['material'],
    ),
  );
}
