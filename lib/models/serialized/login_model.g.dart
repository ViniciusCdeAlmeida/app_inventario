// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    id: json['id'] as int,
    username: json['username'] as String,
    organizacoes: (json['organizacoes'] as List)
        ?.map((e) =>
            e == null ? null : Organizacoes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'organizacoes': instance.organizacoes,
    };
