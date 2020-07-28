import 'package:app_inventario/helpers/helper_bemPatrimonialEst.dart';
import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/models/dadosBensPatrimoniais.dart';

DadosBensPatrimoniais helperDadosBensPatrimoniaisEst(
    dynamic listaDadosBemPatrimonial) {
  return DadosBensPatrimoniais(
    id: listaDadosBemPatrimonial['id'],
    // int.parse(listaDadosBemPatrimonial.map((e) => e['id']).toString()),
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
  );
}
