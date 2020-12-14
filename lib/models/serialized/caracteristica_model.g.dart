// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caracteristica_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Caracteristica _$CaracteristicaFromJson(Map<String, dynamic> json) {
  return Caracteristica(
    json['id'] as int,
    json['codigo'] as String,
    json['descricao'] as String,
    json['chaveDominio'] as String,
    json['dominioTipoDado'] == null
        ? null
        : Dominio.fromJson(json['dominioTipoDado'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaracteristicaToJson(Caracteristica instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'chaveDominio': instance.chaveDominio,
      'dominioTipoDado': instance.dominioTipoDado,
    };
