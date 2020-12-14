import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

class CaracteristicaConverter extends TypeConverter<Caracteristica, String> {
  const CaracteristicaConverter();
  @override
  Caracteristica mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Caracteristica.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(Caracteristica value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
