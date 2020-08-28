// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materialCaracteristicaGnt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialCaracteristicaGnt _$MaterialCaracteristicaGntFromJson(
    Map<String, dynamic> json) {
  return MaterialCaracteristicaGnt(
    json['id'] as int,
    json['codigo'] as String,
    json['descricao'] as String,
    json['caracteristica'] == null
        ? null
        : CaracteristicaGnt.fromJson(
            json['caracteristica'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MaterialCaracteristicaGntToJson(
        MaterialCaracteristicaGnt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'caracteristica': instance.caracteristica,
    };
