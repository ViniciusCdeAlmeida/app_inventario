import 'dart:convert';
import 'package:moor_flutter/moor_flutter.dart';

import 'package:GRPInventario/models/index_models.dart';

/// Responsável por salvar o objeto [InventarioDadosBemPatrimonial] no banco de dados.
class InventarioBemPatrimonialConverter
    extends TypeConverter<InventarioDadosBemPatrimonial, String> {
  const InventarioBemPatrimonialConverter();

  /// Responsável por converter [InventarioDadosBemPatrimonial] de uma tabela para o modelo [InventarioDadosBemPatrimonial].
  @override
  InventarioDadosBemPatrimonial mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return InventarioDadosBemPatrimonial.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  /// Responsável por salvar [InventarioDadosBemPatrimonial] do json para a coluna de uma tabela.
  @override
  String mapToSql(InventarioDadosBemPatrimonial value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
