import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [Caracteristica] no banco de dados.
class CaracteristicaConverter extends TypeConverter<Caracteristica, String> {
  const CaracteristicaConverter();

  /// Responsável por converter [Caracteristica] de uma tabela para o modelo [Caracteristica].
  @override
  Caracteristica mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Caracteristica.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  /// Responsável por salvar [Caracteristica] do json para a coluna de uma tabela.
  @override
  String mapToSql(Caracteristica value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
