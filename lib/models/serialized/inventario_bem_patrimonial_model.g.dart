// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventario_bem_patrimonial_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventarioBemPatrimonial _$InventarioBemPatrimonialFromJson(
    Map<String, dynamic> json) {
  return InventarioBemPatrimonial(
    id: json['id'] as int,
    numeroPatrimonial: json['numeroPatrimonial'] as String,
    numeroPatrimonialAntigo: json['numeroPatrimonialAntigo'] as String,
    numeroPatrimonialNovo: json['numeroPatrimonialNovo'] as String,
    dominioSituacaoFisica: json['dominioSituacaoFisica'] == null
        ? null
        : Dominio.fromJson(
            json['dominioSituacaoFisica'] as Map<String, dynamic>),
    dominioStatus: json['dominioStatus'] == null
        ? null
        : Dominio.fromJson(json['dominioStatus'] as Map<String, dynamic>),
    caracteristicas: (json['caracteristicas'] as List)
        ?.map((e) => e == null
            ? null
            : Caracteristicas.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bemNaoEncontrado: json['bemNaoEncontrado'] as bool,
    bemNaoInventariado: json['bemNaoInventariado'] as bool,
    dominioStatusInventarioBem: json['dominioStatusInventarioBem'] == null
        ? null
        : Dominio.fromJson(
            json['dominioStatusInventarioBem'] as Map<String, dynamic>),
    idDadosBemPatrimonialMobile: json['idDadosBemPatrimonialMobile'] as int,
    idInventarioEstruturaOrganizacionalMobile:
        json['idInventarioEstruturaOrganizacionalMobile'] as int,
    material: json['material'] == null
        ? null
        : Material.fromJson(json['material'] as Map<String, dynamic>),
    nomeUsuarioColeta: json['nomeUsuarioColeta'] as String,
    novoBemInvetariado: json['novoBemInvetariado'] as bool,
    tipoMobile: json['tipoMobile'] as String,
    enviado: json['enviado'] as bool,
    idUnidadeOrganizacional: json['idUnidadeOrganizacional'] as int,
    idDominioSituacaoFisica: json['idDominioSituacaoFisica'] as int,
    idDominioStatus: json['idDominioStatus'] as int,
    identificaoPatrimonial: json['identificaoPatrimonial'] as int,
    idEstruturaOrganizacionalAtual:
        json['idEstruturaOrganizacionalAtual'] as int,
    idMaterial: json['idMaterial'] as int,
  );
}

Map<String, dynamic> _$InventarioBemPatrimonialToJson(
        InventarioBemPatrimonial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idDadosBemPatrimonialMobile': instance.idDadosBemPatrimonialMobile,
      'idInventarioEstruturaOrganizacionalMobile':
          instance.idInventarioEstruturaOrganizacionalMobile,
      'idUnidadeOrganizacional': instance.idUnidadeOrganizacional,
      'idDominioSituacaoFisica': instance.idDominioSituacaoFisica,
      'idDominioStatus': instance.idDominioStatus,
      'identificaoPatrimonial': instance.identificaoPatrimonial,
      'idEstruturaOrganizacionalAtual': instance.idEstruturaOrganizacionalAtual,
      'idMaterial': instance.idMaterial,
      'numeroPatrimonial': instance.numeroPatrimonial,
      'numeroPatrimonialAntigo': instance.numeroPatrimonialAntigo,
      'numeroPatrimonialNovo': instance.numeroPatrimonialNovo,
      'nomeUsuarioColeta': instance.nomeUsuarioColeta,
      'tipoMobile': instance.tipoMobile,
      'novoBemInvetariado': instance.novoBemInvetariado,
      'enviado': instance.enviado,
      'bemNaoEncontrado': instance.bemNaoEncontrado,
      'bemNaoInventariado': instance.bemNaoInventariado,
      'caracteristicas': instance.caracteristicas,
      'dominioSituacaoFisica': instance.dominioSituacaoFisica,
      'dominioStatus': instance.dominioStatus,
      'dominioStatusInventarioBem': instance.dominioStatusInventarioBem,
      'material': instance.material,
    };
