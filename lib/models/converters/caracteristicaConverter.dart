import 'dart:convert';

import 'package:app_inventario/models/serialized/caracteristicaGnt.dart';
import 'package:moor_flutter/moor_flutter.dart';

class CaracteristicaConverter extends TypeConverter<CaracteristicaGnt, String> {
  const CaracteristicaConverter();
  @override
  CaracteristicaGnt mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return CaracteristicaGnt.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(CaracteristicaGnt value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
