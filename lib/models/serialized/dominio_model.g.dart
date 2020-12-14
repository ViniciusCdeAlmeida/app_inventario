// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dominio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dominio _$DominioFromJson(Map<String, dynamic> json) {
  return Dominio(
    id: json['id'] as int,
    nome: json['nome'] as String,
    chave: json['chave'] as String,
    descricao: json['descricao'] as String,
    codigo: json['codigo'] as int,
  );
}

Map<String, dynamic> _$DominioToJson(Dominio instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'chave': instance.chave,
      'codigo': instance.codigo,
    };
