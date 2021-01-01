import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [Organizacoes] no banco de dados.
class OrganizacoesConverter extends TypeConverter<List<Organizacoes>, String> {
  const OrganizacoesConverter();

  /// Responsável por converter a uma lista de [Organizacoes] de uma tabela para o modelo [Organizacoes].
  @override
  List<Organizacoes> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var organizacoesJson = json.decode(fromDb);

    return (organizacoesJson as List)
        .map((i) => Organizacoes.fromJson(i))
        .toList();
  }

  /// Responsável por salvar [Organizacoes] do json para a coluna de uma tabela.
  @override
  String mapToSql(List<Organizacoes> organizacoesDetails) {
    if (organizacoesDetails.isEmpty) {
      return null;
    }
    return json.encode(
        organizacoesDetails.map((details) => details.toJson()).toList());
  }
}
