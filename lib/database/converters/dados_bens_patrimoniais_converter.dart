import 'dart:convert';
import 'package:GRPInventario/models/index_models.dart';
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

class BemPatrimonialDadosConverter
    extends TypeConverter<DadosBensPatrimoniais, String> {
  const BemPatrimonialDadosConverter();
  @override
  DadosBensPatrimoniais mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return DadosBensPatrimoniais.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(DadosBensPatrimoniais value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
