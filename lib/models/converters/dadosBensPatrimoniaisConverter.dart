import 'dart:convert';
import 'package:app_inventario/models/serialized/dadosBensPatrimoniais.dart';
import 'package:moor_flutter/moor_flutter.dart';

class DadosBensPatrimoniaisConverter
    extends TypeConverter<List<DadosBensPatrimoniais>, String> {
  const DadosBensPatrimoniaisConverter();

  @override
  List<DadosBensPatrimoniais> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var dadosBensPatrimoniaisJson = json.decode(fromDb);

    return (dadosBensPatrimoniaisJson as List)
        .map((i) => DadosBensPatrimoniais.fromJson(i))
        .toList();
  }

  @override
  String mapToSql(List<DadosBensPatrimoniais> dadosBensPatrimoniais) {
    if (dadosBensPatrimoniais.isEmpty) {
      return null;
    }
    return json.encode(
        dadosBensPatrimoniais.map((details) => details.toJson()).toList());
  }
}
