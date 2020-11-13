import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conexao.g.dart';

@JsonSerializable()
class Conexao with ChangeNotifier {
  final String id;
  final String url;
  final String nome;
  bool ativo;

  Conexao({
    this.id,
    this.url,
    this.nome,
    this.ativo,
  });
  // ignore: missing_return
  factory Conexao.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    } else
      _$ConexaoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConexaoToJson(this);
}
