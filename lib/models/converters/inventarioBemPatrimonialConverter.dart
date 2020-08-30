import 'dart:convert';
import 'package:moor_flutter/moor_flutter.dart';

import 'package:app_inventario/models/serialized/inventarioDadosBemPatrimonial.dart';

class InventarioBemPatrimonialConverter
    extends TypeConverter<InventarioDadosBemPatrimonial, String> {
  const InventarioBemPatrimonialConverter();
  @override
  InventarioDadosBemPatrimonial mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return InventarioDadosBemPatrimonial.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(InventarioDadosBemPatrimonial value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
