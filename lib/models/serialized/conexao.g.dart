// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conexao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conexao _$ConexaoFromJson(Map<String, dynamic> json) {
  return Conexao(
    id: json['id'] as int,
    url: json['url'] as String,
    nome: json['nome'] as String,
    ativo: json['ativo'] as bool,
  );
}

Map<String, dynamic> _$ConexaoToJson(Conexao instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'nome': instance.nome,
      'ativo': instance.ativo,
    };
