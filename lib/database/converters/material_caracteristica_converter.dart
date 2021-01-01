import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [MaterialCaracteristica] no banco de dados.
class MaterialCaracteristicaConverter
    extends TypeConverter<MaterialCaracteristica, String> {
  const MaterialCaracteristicaConverter();

  /// Responsável por converter [MaterialCaracteristica] de uma tabela para o modelo [MaterialCaracteristica].
  @override
  MaterialCaracteristica mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return MaterialCaracteristica.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  /// Responsável por salvar [MaterialCaracteristica] do json para a coluna de uma tabela.
  @override
  String mapToSql(MaterialCaracteristica value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
