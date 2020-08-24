import 'package:app_inventario/models/caracteristicas.dart';
import 'package:app_inventario/models/dominio.dart';
import 'package:app_inventario/models/materialEst.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'inventarioBemPatrimonial.g.dart';

@HiveType(typeId: 10)
class InventarioBemPatrimonial with ChangeNotifier {
  @HiveField(0)
  int id;

  @HiveField(1)
  int idDadosBemPatrimonialMobile;

  @HiveField(2)
  int idInventarioEstruturaOrganizacionalMobile;

  @HiveField(3)
  String numeroPatrimonial;

  @HiveField(4)
  String numeroPatrimonialAntigo;

  @HiveField(5)
  String numeroPatrimonialNovo;

  @HiveField(6)
  List<Caracteristicas> caracteristicas;

  @HiveField(7)
  Dominio dominioSituacaoFisica;

  @HiveField(8)
  Dominio dominioStatus;

  @HiveField(9)
  bool bemNaoEncontrado;

  @HiveField(10)
  bool bemNaoInventariado;

  @HiveField(11)
  Dominio dominioStatusInventarioBem;

  @HiveField(12)
  MaterialEst material;

  @HiveField(13)
  String nomeUsuarioColeta;

  @HiveField(14)
  bool novoBemInvetariado;

  @HiveField(15)
  String tipoMobile;

  InventarioBemPatrimonial({
    this.id,
    this.numeroPatrimonial,
    this.numeroPatrimonialAntigo,
    this.numeroPatrimonialNovo,
    this.dominioSituacaoFisica,
    this.dominioStatus,
    this.caracteristicas,
    this.bemNaoEncontrado,
    this.bemNaoInventariado,
    this.dominioStatusInventarioBem,
    this.idDadosBemPatrimonialMobile,
    this.idInventarioEstruturaOrganizacionalMobile,
    this.material,
    this.nomeUsuarioColeta,
    this.novoBemInvetariado,
    this.tipoMobile,
  });

  Map<String, Object> toJson(InventarioBemPatrimonial item) => {
        'caracteristicas': item.caracteristicas
            .map((caracteristicas) => {
                  'dominiosCaracteristicas': {
                    'chave': caracteristicas.dominiosCaracteristicas.chave,
                    'codigo': caracteristicas.dominiosCaracteristicas.codigo,
                    'descricao':
                        caracteristicas.dominiosCaracteristicas.descricao,
                    'id': caracteristicas.dominiosCaracteristicas.id,
                    'nome': caracteristicas.dominiosCaracteristicas.nome,
                  },
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
                        'id': caracteristicas.materialCaracteristica
                            .caracteristica.dominioTipoDado.id,
                        'descricao': caracteristicas.materialCaracteristica
                            .caracteristica.dominioTipoDado.descricao,
                        'nome': caracteristicas.materialCaracteristica
                            .caracteristica.dominioTipoDado.nome
                      },
                      'id': caracteristicas
                          .materialCaracteristica.caracteristica.id,
                    },
                    'codigo': caracteristicas.materialCaracteristica.codigo,
                    'descricao':
                        caracteristicas.materialCaracteristica.descricao,
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
