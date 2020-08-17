import 'package:app_inventario/helpers/helper_dominio.dart';
import 'package:app_inventario/models/caracteristica.dart';
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

Map<String, dynamic> toJson(InventarioBemPatrimonial item) {
  return {
    'caracteristicas': item.caracteristicas
        .map((caracteristicas) => {
              'id': caracteristicas.id,
              'materialCaracteristica': {
                'caracteristica': {
                  'chaveDominio': caracteristicas
                      .materialCaracteristica.caracteristica.chaveDominio,
                  'codigo': caracteristicas
                      .materialCaracteristica.caracteristica.codigo,
                  'descricao': caracteristicas
                      .materialCaracteristica.caracteristica.descricao,
                  'dominioTipoDado': {
                    'chave': caracteristicas.materialCaracteristica
                        .caracteristica.dominioTipoDado.chave,
                    'codigo': caracteristicas.materialCaracteristica
                        .caracteristica.dominioTipoDado.codigo,
                    'id': caracteristicas.materialCaracteristica.caracteristica
                        .dominioTipoDado.id,
                    'descricao': caracteristicas.materialCaracteristica
                        .caracteristica.dominioTipoDado.descricao,
                    'nome': caracteristicas.materialCaracteristica
                        .caracteristica.dominioTipoDado.nome
                  },
                  'id':
                      caracteristicas.materialCaracteristica.caracteristica.id,
                },
                'codigo': caracteristicas.materialCaracteristica.codigo,
                'descricao': caracteristicas.materialCaracteristica.descricao,
                'id': caracteristicas.materialCaracteristica.id
              },
              'valorMaterialCaracteristica':
                  caracteristicas.valorMaterialCaracteristica
            })
        .toList(),
    'dominioSituacaoFisica': {
      'chave': item.dominioSituacaoFisica.chave,
      'codigo': item.dominioSituacaoFisica.codigo,
      'id': item.dominioSituacaoFisica.id,
      'descricao': item.dominioSituacaoFisica.descricao,
      'nome': item.dominioSituacaoFisica.nome
    },
    'dominioStatus': {
      'chave': item.dominioStatus.chave,
      'codigo': item.dominioStatus.codigo,
      'id': item.dominioStatus.id,
      'descricao': item.dominioStatus.descricao,
      'nome': item.dominioStatus.nome
    },
    'dominioStatusInventarioBem': {
      'chave': item.dominioStatusInventarioBem.chave,
      'codigo': item.dominioStatusInventarioBem.codigo,
      'id': item.dominioStatusInventarioBem.id,
      'descricao': item.dominioStatusInventarioBem.descricao,
      'nome': item.dominioStatusInventarioBem.nome
    },
    'idDadosBemPatrimonialMobile': item.idDadosBemPatrimonialMobile,
    'idInventarioEstruturaOrganizacionalMobile':
        item.idInventarioEstruturaOrganizacionalMobile,
    'material': {
      'codigoEDescricao': item.material.codigoEDescricao,
      'descricao': item.material.descricao,
      'id': item.material.id
    },
    'nomeUsuarioColeta': item.nomeUsuarioColeta,
    'novoBemInvetariado': item.novoBemInvetariado,
    'numeroPatrimonial': item.numeroPatrimonial,
    'numeroPatrimonialAntigo': item.numeroPatrimonialAntigo,
    'numeroPatrimonialNovo': item.numeroPatrimonialNovo,
    'tipoMobile': 'levantamentoFisico',
    'bemNaoEncontrado': false,
    'bemNaoInventariado': false,
  };
}
