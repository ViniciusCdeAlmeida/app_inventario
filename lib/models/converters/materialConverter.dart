import 'dart:convert';

import 'package:app_inventario/models/serialized/materialGnt.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MaterialConverter extends TypeConverter<MaterialGnt, String> {
  const MaterialConverter();
  @override
  MaterialGnt mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return MaterialGnt.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(MaterialGnt value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
