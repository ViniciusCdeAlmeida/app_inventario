// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventarioDadosBemPatrimonial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventarioDadosBemPatrimonial _$InventarioDadosBemPatrimonialFromJson(
    Map<String, dynamic> json) {
  return InventarioDadosBemPatrimonial(
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
    bemPatrimonial: json['bemPatrimonial'] == null
        ? null
        : BemPatrimonial.fromJson(
            json['bemPatrimonial'] as Map<String, dynamic>),
    identificacaoPatrimonial: json['identificacaoPatrimonial'] as String,
    dominioStatusInventarioBem: json['dominioStatusInventarioBem'] == null
        ? null
        : Dominio.fromJson(
            json['dominioStatusInventarioBem'] as Map<String, dynamic>),
    nomeUsuarioColeta: json['nomeUsuarioColeta'] as String,
    idBemPatrimonial: json['idBemPatrimonial'] as int,
  );
}

Map<String, dynamic> _$InventarioDadosBemPatrimonialToJson(
        InventarioDadosBemPatrimonial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numeroPatrimonial': instance.numeroPatrimonial,
      'numeroPatrimonialAntigo': instance.numeroPatrimonialAntigo,
      'numeroPatrimonialNovo': instance.numeroPatrimonialNovo,
      'bemPatrimonial': instance.bemPatrimonial,
      'dominioSituacaoFisica': instance.dominioSituacaoFisica,
      'dominioStatus': instance.dominioStatus,
      'dominioStatusInventarioBem': instance.dominioStatusInventarioBem,
      'nomeUsuarioColeta': instance.nomeUsuarioColeta,
      'identificacaoPatrimonial': instance.identificacaoPatrimonial,
      'idBemPatrimonial': instance.idBemPatrimonial,
    };
