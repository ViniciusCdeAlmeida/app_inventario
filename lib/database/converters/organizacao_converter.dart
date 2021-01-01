import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [Organizacao] no banco de dados.
class OrganizacaoConverter extends TypeConverter<Organizacao, String> {
  const OrganizacaoConverter();

  /// Responsável por converter [Organizacao] de uma tabela para o modelo [Organizacao].
  @override
  Organizacao mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Organizacao.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  /// Responsável por salvar [Organizacao] do json para a coluna de uma tabela.
  @override
  String mapToSql(Organizacao value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
