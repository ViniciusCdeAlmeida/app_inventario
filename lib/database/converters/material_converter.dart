import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MaterialConverter extends TypeConverter<Material, String> {
  const MaterialConverter();
  @override
  Material mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Material.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(Material value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
