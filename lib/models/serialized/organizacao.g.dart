// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organizacao _$OrganizacaoFromJson(Map<String, dynamic> json) {
  return Organizacao(
    json['id'] as int,
    json['nome'] as String,
    json['codigo'] as String,
    json['codigoENome'] as String,
    json['sigla'] as String,
    json['statusUnidade'] as String,
  );
}

Map<String, dynamic> _$OrganizacaoToJson(Organizacao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'nome': instance.nome,
      'sigla': instance.sigla,
      'codigoENome': instance.codigoENome,
      'statusUnidade': instance.statusUnidade,
    };
