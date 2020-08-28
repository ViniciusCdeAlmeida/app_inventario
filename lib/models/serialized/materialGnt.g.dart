// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materialGnt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialGnt _$MaterialGntFromJson(Map<String, dynamic> json) {
  return MaterialGnt(
    json['id'] as int,
    json['codigoEDescricao'] as String,
    json['descricao'] as String,
  );
}

Map<String, dynamic> _$MaterialGntToJson(MaterialGnt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigoEDescricao': instance.codigoEDescricao,
      'descricao': instance.descricao,
    };
