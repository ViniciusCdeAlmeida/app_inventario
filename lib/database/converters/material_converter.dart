import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [Material] no banco de dados.
class MaterialConverter extends TypeConverter<Material, String> {
  const MaterialConverter();

  /// Responsável por converter [Material] de uma tabela para o modelo [Material].
  @override
  Material mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Material.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  /// Responsável por salvar [Material] do json para a coluna de uma tabela.
  @override
  String mapToSql(Material value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
