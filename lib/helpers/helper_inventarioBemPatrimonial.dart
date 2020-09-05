import 'package:app_inventario/models/database/databaseMoor.dart';

import 'package:app_inventario/models/serialized/inventarioBemPatrimonial.dart';

List<InventarioBemPatrimonial> helperInventarioBemPatrimonialLista(
    List<InventarioBemPatrimonialDBData> listaInvetariados) {
  if (listaInvetariados != null) {
    return List<InventarioBemPatrimonial>.from(
      (listaInvetariados).map(
        (item) => InventarioBemPatrimonial(
          id: item.id,
          numeroPatrimonial: item.numeroPatrimonial,
          bemNaoEncontrado: item.bemNaoEncontrado,
          material: item.material,
          dominioSituacaoFisica: item.dominioSituacaoFisica,
          dominioStatus: item.dominioStatus,
          caracteristicas: item.caracteristicas,
          bemNaoInventariado: item.bemNaoEncontrado,
          dominioStatusInventarioBem: item.dominioStatusInventarioBem,
          enviado: item.enviado,
          idDadosBemPatrimonialMobile: item.idDadosBemPatrimonialMobile,
          idInventarioEstruturaOrganizacionalMobile:
              item.idInventarioEstruturaOrganizacionalMobile,
          idUnidadeOrganizacional: item.idUnidadeOrganizacional,
          nomeUsuarioColeta: item.nomeUsuarioColeta,
          novoBemInvetariado: item.novoBemInvetariado,
          numeroPatrimonialAntigo: item.numeroPatrimonialAntigo,
          numeroPatrimonialNovo: item.numeroPatrimonialNovo,
          tipoMobile: item.tipoMobile,
        ),
      ),
    );
  } else
    return null;
}

// Map<String, dynamic> toJson(InventarioBemPatrimonial item) {
//   return {
//     'caracteristicas': item.caracteristicas
//         .map((caracteristicas) => {
//               'id': caracteristicas.id,
//               'materialCaracteristica': {
//                 'caracteristica': {
//                   'chaveDominio': caracteristicas
//                       .materialCaracteristica.caracteristica.chaveDominio,
//                   'codigo': caracteristicas
//                       .materialCaracteristica.caracteristica.codigo,
//                   'descricao': caracteristicas
//                       .materialCaracteristica.caracteristica.descricao,
//                   'dominioTipoDado': {
//                     'chave': caracteristicas.materialCaracteristica
//                         .caracteristica.dominioTipoDado.chave,
//                     'codigo': caracteristicas.materialCaracteristica
//                         .caracteristica.dominioTipoDado.codigo,
//                     'id': caracteristicas.materialCaracteristica.caracteristica
//                         .dominioTipoDado.id,
//                     'descricao': caracteristicas.materialCaracteristica
//                         .caracteristica.dominioTipoDado.descricao,
//                     'nome': caracteristicas.materialCaracteristica
//                         .caracteristica.dominioTipoDado.nome
//                   },
//                   'id':
//                       caracteristicas.materialCaracteristica.caracteristica.id,
//                 },
//                 'codigo': caracteristicas.materialCaracteristica.codigo,
//                 'descricao': caracteristicas.materialCaracteristica.descricao,
//                 'id': caracteristicas.materialCaracteristica.id
//               },
//               'valorMaterialCaracteristica':
//                   caracteristicas.valorMaterialCaracteristica
//             })
//         .toList(),
//     'dominioSituacaoFisica': {
//       'chave': item.dominioSituacaoFisica.chave,
//       'codigo': item.dominioSituacaoFisica.codigo,
//       'id': item.dominioSituacaoFisica.id,
//       'descricao': item.dominioSituacaoFisica.descricao,
//       'nome': item.dominioSituacaoFisica.nome
//     },
//     'dominioStatus': {
//       'chave': item.dominioStatus.chave,
//       'codigo': item.dominioStatus.codigo,
//       'id': item.dominioStatus.id,
//       'descricao': item.dominioStatus.descricao,
//       'nome': item.dominioStatus.nome
//     },
//     'dominioStatusInventarioBem': {
//       'chave': item.dominioStatusInventarioBem.chave,
//       'codigo': item.dominioStatusInventarioBem.codigo,
//       'id': item.dominioStatusInventarioBem.id,
//       'descricao': item.dominioStatusInventarioBem.descricao,
//       'nome': item.dominioStatusInventarioBem.nome
//     },
//     'idDadosBemPatrimonialMobile': item.idDadosBemPatrimonialMobile,
//     'idInventarioEstruturaOrganizacionalMobile':
//         item.idInventarioEstruturaOrganizacionalMobile,
//     'material': {
//       'codigoEDescricao': item.material.codigoEDescricao,
//       'descricao': item.material.descricao,
//       'id': item.material.id
//     },
//     'nomeUsuarioColeta': item.nomeUsuarioColeta,
//     'novoBemInvetariado': item.novoBemInvetariado,
//     'numeroPatrimonial': item.numeroPatrimonial,
//     'numeroPatrimonialAntigo': item.numeroPatrimonialAntigo,
//     'numeroPatrimonialNovo': item.numeroPatrimonialNovo,
//     'tipoMobile': 'levantamentoFisico',
//     'bemNaoEncontrado': false,
//     'bemNaoInventariado': false,
//   };
// }
