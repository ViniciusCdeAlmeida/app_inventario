import 'dart:convert';

import 'package:app_inventario/models/serialized/dominioGnt.dart';
import 'package:moor_flutter/moor_flutter.dart';

class DominioConverter extends TypeConverter<DominioGnt, String> {
  const DominioConverter();
  @override
  DominioGnt mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return DominioGnt.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(DominioGnt value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
