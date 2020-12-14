// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizacoes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organizacoes _$OrganizacoesFromJson(Map<String, dynamic> json) {
  return Organizacoes(
    id: json['id'] as int,
    organizacao: json['organizacao'] == null
        ? null
        : Organizacao.fromJson(json['organizacao'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrganizacoesToJson(Organizacoes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizacao': instance.organizacao,
    };
