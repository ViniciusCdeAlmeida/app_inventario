import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [Dominio] no banco de dados.
class DominioConverter extends TypeConverter<Dominio, String> {
  const DominioConverter();

  /// Responsável por converter [Dominio] de uma tabela para o modelo [Dominio].
  @override
  Dominio mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Dominio.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  /// Responsável por salvar [Dominio] do json para a coluna de uma tabela.
  @override
  String mapToSql(Dominio value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
