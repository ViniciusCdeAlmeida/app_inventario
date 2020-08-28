// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caracteristicaGnt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaracteristicaGnt _$CaracteristicaGntFromJson(Map<String, dynamic> json) {
  return CaracteristicaGnt(
    json['id'] as int,
    json['codigo'] as String,
    json['descricao'] as String,
    json['chaveDominio'] as String,
    json['dominioTipoDado'] == null
        ? null
        : DominioGnt.fromJson(json['dominioTipoDado'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CaracteristicaGntToJson(CaracteristicaGnt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'chaveDominio': instance.chaveDominio,
      'dominioTipoDado': instance.dominioTipoDado,
    };
