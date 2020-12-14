// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caracteristicas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Caracteristicas _$CaracteristicasFromJson(Map<String, dynamic> json) {
  return Caracteristicas(
    json['id'] as int,
    json['valorMaterialCaracteristica'] as String,
    json['materialCaracteristica'] == null
        ? null
        : MaterialCaracteristica.fromJson(
            json['materialCaracteristica'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaracteristicasToJson(Caracteristicas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'valorMaterialCaracteristica': instance.valorMaterialCaracteristica,
      'materialCaracteristica': instance.materialCaracteristica,
    };
