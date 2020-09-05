// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dadosBensPatrimoniais.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DadosBensPatrimoniais _$DadosBensPatrimoniaisFromJson(
    Map<String, dynamic> json) {
  return DadosBensPatrimoniais(
    id: json['id'] as int,
    dominioSituacaoFisica: json['dominioSituacaoFisica'] == null
        ? null
        : Dominio.fromJson(
            json['dominioSituacaoFisica'] as Map<String, dynamic>),
    dominioStatus: json['dominioStatus'] == null
        ? null
        : Dominio.fromJson(json['dominioStatus'] as Map<String, dynamic>),
    dominioStatusInventarioBem: json['dominioStatusInventarioBem'] == null
        ? null
        : Dominio.fromJson(
            json['dominioStatusInventarioBem'] as Map<String, dynamic>),
    idInventario: json['idInventario'] as int,
    idInventarioEstruturaOrganizacional:
        json['idInventarioEstruturaOrganizacional'] as int,
    material: json['material'] == null
        ? null
        : Material.fromJson(json['material'] as Map<String, dynamic>),
    inventarioBemPatrimonial: json['inventarioBemPatrimonial'] == null
        ? null
        : InventarioDadosBemPatrimonial.fromJson(
            json['inventarioBemPatrimonial'] as Map<String, dynamic>),
    numeroPatrimonial: json['numeroPatrimonial'] as String,
    inventariado: json['inventariado'] as bool,
    numeroPatrimonialCompleto: json['numeroPatrimonialCompleto'] as String,
    idEstruturaOrganizacional: json['idEstruturaOrganizacional'] as int,
    idBemPatrimonial: json['idBemPatrimonial'] as int,
  );
}

Map<String, dynamic> _$DadosBensPatrimoniaisToJson(
        DadosBensPatrimoniais instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numeroPatrimonial': instance.numeroPatrimonial,
      'dominioSituacaoFisica': instance.dominioSituacaoFisica,
      'dominioStatus': instance.dominioStatus,
      'dominioStatusInventarioBem': instance.dominioStatusInventarioBem,
      'idInventario': instance.idInventario,
      'idInventarioEstruturaOrganizacional':
          instance.idInventarioEstruturaOrganizacional,
      'material': instance.material,
      'inventarioBemPatrimonial': instance.inventarioBemPatrimonial,
      'inventariado': instance.inventariado,
      'idBemPatrimonial': instance.idBemPatrimonial,
      'numeroPatrimonialCompleto': instance.numeroPatrimonialCompleto,
      'idEstruturaOrganizacional': instance.idEstruturaOrganizacional,
    };
