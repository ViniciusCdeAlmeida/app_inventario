// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dominioGnt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DominioGnt _$DominioGntFromJson(Map<String, dynamic> json) {
  return DominioGnt(
    json['id'] as int,
    json['nome'] as String,
    json['chave'] as String,
    json['descricao'] as String,
    json['codigo'] as int,
  );
}

Map<String, dynamic> _$DominioGntToJson(DominioGnt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'chave': instance.chave,
      'codigo': instance.codigo,
    };
