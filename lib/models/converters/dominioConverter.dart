import 'dart:convert';

import 'package:app_inventario/models/serialized/dominio.dart';
import 'package:moor_flutter/moor_flutter.dart';

class DominioConverter extends TypeConverter<Dominio, String> {
  const DominioConverter();
  @override
  Dominio mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Dominio.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(Dominio value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
