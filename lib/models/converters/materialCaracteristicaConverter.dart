import 'dart:convert';

import 'package:app_inventario/models/serialized/materialCaracteristicaGnt.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MaterialCaracteristicaConverter
    extends TypeConverter<MaterialCaracteristicaGnt, String> {
  const MaterialCaracteristicaConverter();
  @override
  MaterialCaracteristicaGnt mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return MaterialCaracteristicaGnt.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(MaterialCaracteristicaGnt value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
