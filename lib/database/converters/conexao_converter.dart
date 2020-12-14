import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

class ConexaoConverter extends TypeConverter<List<Conexao>, String> {
  const ConexaoConverter();
  @override
  List<Conexao> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var caracteristicasJson = json.decode(fromDb);

    return (caracteristicasJson as List)
        .map((i) => Conexao.fromJson(i))
        .toList();
  }

  @override
  String mapToSql(List<Conexao> caracteristicasDetails) {
    if (caracteristicasDetails.isEmpty) {
      return null;
    }
    return json.encode(
        caracteristicasDetails.map((details) => details.toJson()).toList());
  }
}
