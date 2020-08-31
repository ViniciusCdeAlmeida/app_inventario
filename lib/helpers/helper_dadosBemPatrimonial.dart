// import 'package:app_inventario/helpers/helper_bemPatrimonialEst.dart';
// import 'package:app_inventario/helpers/helper_dominio.dart';
// import 'package:app_inventario/helpers/helper_inventarioBemPatrimonial.dart';
// import 'package:app_inventario/helpers/helper_materialEst.dart';
// import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';
// import 'package:app_inventario/models/dominio.dart';

// DadosBensPatrimoniais helperDadosBensPatrimoniaisEst(
//     dynamic listaDadosBemPatrimonial, List<Dominio> listaDominios) {
//   return DadosBensPatrimoniais(
//     id: listaDadosBemPatrimonial['id'],
//     idInventario: listaDadosBemPatrimonial['idInventario'],
//     numeroPatrimonial: listaDadosBemPatrimonial['numeroPatrimonial'],
//     inventariado: listaDadosBemPatrimonial['inventarioBemPatrimonial'] == null
//         ? false
//         : true,
//     idInventarioEstruturaOrganizacional:
//         listaDadosBemPatrimonial['idInventarioEstruturaOrganizacional'],
//     dominioSituacaoFisica:
//         listaDadosBemPatrimonial['dominioSituacaoFisica'] != null
//             ? helperDominio(listaDadosBemPatrimonial['dominioSituacaoFisica'])
//             : null,
//     dominioStatus: listaDadosBemPatrimonial['dominioStatus'] != null
//         ? helperDominio(listaDadosBemPatrimonial['dominioStatus'])
//         : null,
//     dominioStatusInventarioBem:
//         listaDadosBemPatrimonial['dominioStatusInventarioBem'] != null
//             ? helperDominio(
//                 listaDadosBemPatrimonial['dominioStatusInventarioBem'])
//             : null,
//     bemPatrimonial: helperBemPatrimonialEst(
//         listaDadosBemPatrimonial['bemPatrimonial'], listaDominios),
//     material: helperMaterial(
//       listaDadosBemPatrimonial['material'],
//     ),
//     inventarioBemPatrimonial:
//         listaDadosBemPatrimonial['inventarioBemPatrimonial'] != null
//             ? helperInventarioBemPatrimonial(
//                 listaDadosBemPatrimonial['inventarioBemPatrimonial'])
//             : null,
//   );
// }

import 'package:app_inventario/models/database/databaseMoor.dart';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';

List<DadosBensPatrimoniais> helperDadosBemPatrimonialLista(
    List<DadosBemPatrimoniaisDBData> listaBemPatrimonial) {
  if (listaBemPatrimonial != null) {
    return List<DadosBensPatrimoniais>.from(
      (listaBemPatrimonial).map(
        (item) => DadosBensPatrimoniais(
            id: item.id,
            material: item.material,
            dominioSituacaoFisica: item.dominioSituacaoFisica,
            dominioStatus: item.dominioStatus,
            dominioStatusInventarioBem: item.dominioStatusInventarioBem,
            idInventario: item.idInventario,
            idInventarioEstruturaOrganizacional: item.idEstruturaOrganizacional,
            inventarioBemPatrimonial: item.inventarioBemPatrimonial,
            numeroPatrimonial: item.numeroPatrimonialCompleto,
            idBemPatrimonial: item.idBemPatrimonial,
            idEstruturaOrganizacional: item.idEstruturaOrganizacional,
            numeroPatrimonialCompleto: item.numeroPatrimonialCompleto,
            inventariado: item.inventarioBemPatrimonial != null ? true : false),
      ),
    );
  } else
    return null;
}

DadosBensPatrimoniais helperDadoBemPatrimonial(
    DadosBemPatrimoniaisDBData dadosBemPatrimonial) {
  if (dadosBemPatrimonial != null) {
    return DadosBensPatrimoniais(
        id: dadosBemPatrimonial.id,
        material: dadosBemPatrimonial.material,
        dominioSituacaoFisica: dadosBemPatrimonial.dominioSituacaoFisica,
        dominioStatus: dadosBemPatrimonial.dominioStatus,
        dominioStatusInventarioBem:
            dadosBemPatrimonial.dominioStatusInventarioBem,
        idInventario: dadosBemPatrimonial.idInventario,
        idInventarioEstruturaOrganizacional:
            dadosBemPatrimonial.idEstruturaOrganizacional,
        inventarioBemPatrimonial: dadosBemPatrimonial.inventarioBemPatrimonial,
        numeroPatrimonial: dadosBemPatrimonial.numeroPatrimonialCompleto,
        idBemPatrimonial: dadosBemPatrimonial.idBemPatrimonial,
        idEstruturaOrganizacional:
            dadosBemPatrimonial.idEstruturaOrganizacional,
        numeroPatrimonialCompleto:
            dadosBemPatrimonial.numeroPatrimonialCompleto,
        inventariado: dadosBemPatrimonial.inventarioBemPatrimonial == null
            ? false
            : true);
  } else
    return null;
}

DadosBensPatrimoniais helperDadoBemPatrimonial2(
    DadosBemPatrimoniaisDBData dadosBemPatrimonial) {
  if (dadosBemPatrimonial != null) {
    return DadosBensPatrimoniais(
        id: dadosBemPatrimonial.id,
        material: dadosBemPatrimonial.material,
        dominioSituacaoFisica: dadosBemPatrimonial.dominioSituacaoFisica,
        dominioStatus: dadosBemPatrimonial.dominioStatus,
        dominioStatusInventarioBem:
            dadosBemPatrimonial.dominioStatusInventarioBem,
        idInventario: dadosBemPatrimonial.idInventario,
        idInventarioEstruturaOrganizacional:
            dadosBemPatrimonial.idEstruturaOrganizacional,
        inventarioBemPatrimonial: dadosBemPatrimonial.inventarioBemPatrimonial,
        numeroPatrimonial: dadosBemPatrimonial.numeroPatrimonialCompleto,
        idBemPatrimonial: dadosBemPatrimonial.idBemPatrimonial,
        idEstruturaOrganizacional:
            dadosBemPatrimonial.idEstruturaOrganizacional,
        numeroPatrimonialCompleto:
            dadosBemPatrimonial.numeroPatrimonialCompleto,
        bemPatrimonial: dadosBemPatrimonial.bemPatrimonial,
        inventariado: dadosBemPatrimonial.inventarioBemPatrimonial == null
            ? false
            : true);
  } else
    return null;
}

// DadosBensPatrimoniais helperDadosBemPatrimonial(Map dadoBemPatrimonial) {
//   return DadosBensPatrimoniais(
//       id: dadoBemPatrimonial['id'],
//       dominioStatusInventarioEstrutura: Dominio.fromJson(
//         json.decode(estrutura['dominio_status_inventario_estrutura']),
//       ),
//       estruturaOrganizacional: Organizacao.fromJson(
//         json.decode(dadoBemPatrimonial['estrutura_organizacional']),
//       ),
//       dominioStatusInventarioEstrutura: Dominio.fromJson(
//         json.decode(estrutura['dominio_status_inventario_estrutura']),
//       ),
//       estruturaOrganizacional: Organizacao.fromJson(
//         json.decode(dadoBemPatrimonial['estrutura_organizacional']),
//       ),
//       dominioStatusInventarioEstrutura: Dominio.fromJson(
//         json.decode(estrutura['dominio_status_inventario_estrutura']),
//       ),
//       estruturaOrganizacional: Organizacao.fromJson(
//         json.decode(dadoBemPatrimonial['estrutura_organizacional']),
//       ),
//       estruturaOrganizacional: Organizacao.fromJson(
//         json.decode(dadoBemPatrimonial['estrutura_organizacional']),
//       ),
//       idInventario: dadoBemPatrimonial['id_inventario']);
// }
