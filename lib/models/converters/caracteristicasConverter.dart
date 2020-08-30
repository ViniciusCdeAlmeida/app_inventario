import 'dart:convert';
import 'package:app_inventario/models/serialized/caracteristicas.dart';
import 'package:moor_flutter/moor_flutter.dart';

class CaracteristicasConverter
    extends TypeConverter<List<Caracteristicas>, String> {
  const CaracteristicasConverter();
  @override
  List<Caracteristicas> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var caracteristicasJson = json.decode(fromDb);

    return (caracteristicasJson as List)
        .map((i) => Caracteristicas.fromJson(i))
        .toList();
  }

  @override
  String mapToSql(List<Caracteristicas> caracteristicasDetails) {
    if (caracteristicasDetails.isEmpty) {
      return null;
    }
    return json.encode(
        caracteristicasDetails.map((details) => details.toJson()).toList());
  }
}
