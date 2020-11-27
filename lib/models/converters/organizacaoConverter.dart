import 'dart:convert';

import 'package:GRPInventario/models/serialized/index.dart';
import 'package:moor_flutter/moor_flutter.dart';

class OrganizacaoConverter extends TypeConverter<Organizacao, String> {
  const OrganizacaoConverter();
  @override
  Organizacao mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Organizacao.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(Organizacao value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
