// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caracteristicasGnt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaracteristicasGnt _$CaracteristicasGntFromJson(Map<String, dynamic> json) {
  return CaracteristicasGnt(
    json['id'] as int,
    json['valorMaterialCaracteristica'] as String,
    json['materialCaracteristica'] == null
        ? null
        : MaterialCaracteristicaGnt.fromJson(
            json['materialCaracteristica'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaracteristicasGntToJson(CaracteristicasGnt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'valorMaterialCaracteristica': instance.valorMaterialCaracteristica,
      'materialCaracteristica': instance.materialCaracteristica,
    };
