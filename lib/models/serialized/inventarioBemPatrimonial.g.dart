// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventarioBemPatrimonial.dart';

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
  );
}

Map<String, dynamic> _$InventarioBemPatrimonialToJson(
        InventarioBemPatrimonial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idDadosBemPatrimonialMobile': instance.idDadosBemPatrimonialMobile,
      'idInventarioEstruturaOrganizacionalMobile':
          instance.idInventarioEstruturaOrganizacionalMobile,
      'numeroPatrimonial': instance.numeroPatrimonial,
      'numeroPatrimonialAntigo': instance.numeroPatrimonialAntigo,
      'numeroPatrimonialNovo': instance.numeroPatrimonialNovo,
      'caracteristicas': instance.caracteristicas,
      'dominioSituacaoFisica': instance.dominioSituacaoFisica,
      'dominioStatus': instance.dominioStatus,
      'bemNaoEncontrado': instance.bemNaoEncontrado,
      'bemNaoInventariado': instance.bemNaoInventariado,
      'dominioStatusInventarioBem': instance.dominioStatusInventarioBem,
      'material': instance.material,
      'nomeUsuarioColeta': instance.nomeUsuarioColeta,
      'novoBemInvetariado': instance.novoBemInvetariado,
      'tipoMobile': instance.tipoMobile,
    };
