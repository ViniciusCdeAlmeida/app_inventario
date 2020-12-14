// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bem_patrimonial_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BemPatrimonial _$BemPatrimonialFromJson(Map<String, dynamic> json) {
  return BemPatrimonial(
    id: json['id'] as int,
    numeroPatrimonial: json['numeroPatrimonial'] as String,
    numeroPatrimonialCompleto: json['numeroPatrimonialCompleto'] as String,
    numeroPatrimonialCompletoAntigo:
        json['numeroPatrimonialCompletoAntigo'] as String,
    material: json['material'] == null
        ? null
        : Material.fromJson(json['material'] as Map<String, dynamic>),
    caracteristicas: (json['caracteristicas'] as List)
        ?.map((e) => e == null
            ? null
            : Caracteristicas.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dominioSituacaoFisica: json['dominioSituacaoFisica'] == null
        ? null
        : Dominio.fromJson(
            json['dominioSituacaoFisica'] as Map<String, dynamic>),
    dominioStatus: json['dominioStatus'] == null
        ? null
        : Dominio.fromJson(json['dominioStatus'] as Map<String, dynamic>),
    estruturaOrganizacionalAtual: json['estruturaOrganizacionalAtual'] == null
        ? null
        : Organizacao.fromJson(
            json['estruturaOrganizacionalAtual'] as Map<String, dynamic>),
    dadosBensPatrimoniais: json['dadosBensPatrimoniais'] == null
        ? null
        : DadosBensPatrimoniais.fromJson(
            json['dadosBensPatrimoniais'] as Map<String, dynamic>),
    inventariado: json['inventariado'] as bool,
  );
}

Map<String, dynamic> _$BemPatrimonialToJson(BemPatrimonial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numeroPatrimonial': instance.numeroPatrimonial,
      'numeroPatrimonialCompleto': instance.numeroPatrimonialCompleto,
      'numeroPatrimonialCompletoAntigo':
          instance.numeroPatrimonialCompletoAntigo,
      'dominioSituacaoFisica': instance.dominioSituacaoFisica,
      'dominioStatus': instance.dominioStatus,
      'material': instance.material,
      'caracteristicas': instance.caracteristicas,
      'estruturaOrganizacionalAtual': instance.estruturaOrganizacionalAtual,
      'dadosBensPatrimoniais': instance.dadosBensPatrimoniais,
      'inventariado': instance.inventariado,
    };
