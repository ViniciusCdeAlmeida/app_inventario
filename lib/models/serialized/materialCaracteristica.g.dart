// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materialCaracteristica.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialCaracteristica _$MaterialCaracteristicaFromJson(
    Map<String, dynamic> json) {
  return MaterialCaracteristica(
    json['id'] as int,
    json['codigo'] as String,
    json['descricao'] as String,
    json['caracteristica'] == null
        ? null
        : Caracteristica.fromJson(
            json['caracteristica'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MaterialCaracteristicaToJson(
        MaterialCaracteristica instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'caracteristica': instance.caracteristica,
    };
