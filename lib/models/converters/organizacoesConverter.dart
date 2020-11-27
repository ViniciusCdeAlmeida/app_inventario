import 'dart:convert';

import 'package:GRPInventario/models/serialized/index.dart';
import 'package:moor_flutter/moor_flutter.dart';

class OrganizacoesConverter extends TypeConverter<List<Organizacoes>, String> {
  const OrganizacoesConverter();
  @override
  List<Organizacoes> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var organizacoesJson = json.decode(fromDb);

    return (organizacoesJson as List)
        .map((i) => Organizacoes.fromJson(i))
        .toList();
  }

  @override
  String mapToSql(List<Organizacoes> organizacoesDetails) {
    if (organizacoesDetails.isEmpty) {
      return null;
    }
    return json.encode(
        organizacoesDetails.map((details) => details.toJson()).toList());
  }
}
