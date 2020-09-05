import 'dart:convert';

import 'package:app_inventario/models/serialized/bemPatrimonial.dart';
import 'package:moor_flutter/moor_flutter.dart';

class BemPatrimonialConverter extends TypeConverter<BemPatrimonial, String> {
  const BemPatrimonialConverter();
  @override
  BemPatrimonial mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return BemPatrimonial.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(BemPatrimonial value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
