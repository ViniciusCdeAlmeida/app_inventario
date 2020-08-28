import 'dart:convert';

import 'package:app_inventario/models/serialized/caracteristicasGnt.dart';
import 'package:moor_flutter/moor_flutter.dart';

class CaracteristicasConverter
    extends TypeConverter<List<CaracteristicasGnt>, String> {
  const CaracteristicasConverter();
  @override
  // List<CaracteristicasGnt> mapToDart(String fromDb) {
  //   if (fromDb == null) {
  //     return null;
  //   }
  //   return CaracteristicasGnt.fromJson(
  //     // json.decode(fromDb) as Map<String, dynamic>);

  //     json.decode(fromDb),
  //   );
  // }

  List<CaracteristicasGnt> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var caracteristicasJson = json.decode(fromDb);

    return (caracteristicasJson as List)
        .map((i) => CaracteristicasGnt.fromJson(i))
        .toList();
  }

  @override
  // String mapToSql(CaracteristicasGnt value) {
  //   if (value == null) {
  //     return null;
  //   }

  //   return json.encode(value.toJson());
  // }
  String mapToSql(List<CaracteristicasGnt> caracteristicasDetails) {
    if (caracteristicasDetails.isEmpty) {
      return null;
    }
    return json.encode(
        caracteristicasDetails.map((details) => details.toJson()).toList());
  }
}
