import 'dart:convert';

import 'package:app_inventario/models/serialized/organizacaoGnt.dart';
import 'package:moor_flutter/moor_flutter.dart';

class OrganizacaoConverter extends TypeConverter<OrganizacaoGnt, String> {
  const OrganizacaoConverter();
  @override
  OrganizacaoGnt mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return OrganizacaoGnt.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(OrganizacaoGnt value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
