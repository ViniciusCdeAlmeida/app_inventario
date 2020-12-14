// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Material _$MaterialFromJson(Map<String, dynamic> json) {
  return Material(
    json['id'] as int,
    json['codigoEDescricao'] as String,
    json['descricao'] as String,
  );
}

Map<String, dynamic> _$MaterialToJson(Material instance) => <String, dynamic>{
      'id': instance.id,
      'codigoEDescricao': instance.codigoEDescricao,
      'descricao': instance.descricao,
    };
