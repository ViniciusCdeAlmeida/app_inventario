// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizacaoGnt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizacaoGnt _$OrganizacaoGntFromJson(Map<String, dynamic> json) {
  return OrganizacaoGnt(
    json['id'] as int,
    json['nome'] as String,
    json['codigo'] as String,
    json['codigoENome'] as String,
    json['sigla'] as String,
    json['statusUnidade'] as String,
  );
}

Map<String, dynamic> _$OrganizacaoGntToJson(OrganizacaoGnt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'nome': instance.nome,
      'sigla': instance.sigla,
      'codigoENome': instance.codigoENome,
      'statusUnidade': instance.statusUnidade,
    };
