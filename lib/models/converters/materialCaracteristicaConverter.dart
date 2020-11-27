import 'dart:convert';

import 'package:GRPInventario/models/serialized/index.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MaterialCaracteristicaConverter
    extends TypeConverter<MaterialCaracteristica, String> {
  const MaterialCaracteristicaConverter();
  @override
  MaterialCaracteristica mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return MaterialCaracteristica.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(MaterialCaracteristica value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
