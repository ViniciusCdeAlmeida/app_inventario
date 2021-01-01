import 'dart:convert';
import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [DadosBensPatrimoniais] no banco de dados.
class DadosBensPatrimoniaisConverter
    extends TypeConverter<List<DadosBensPatrimoniais>, String> {
  const DadosBensPatrimoniaisConverter();

  /// Responsável por converter a uma lista de [DadosBensPatrimoniais] de uma tabela para o modelo [DadosBensPatrimoniais].
  @override
  List<DadosBensPatrimoniais> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var dadosBensPatrimoniaisJson = json.decode(fromDb);

    return (dadosBensPatrimoniaisJson as List)
        .map((i) => DadosBensPatrimoniais.fromJson(i))
        .toList();
  }

  /// Responsável por salvar [DadosBensPatrimoniais] do json para a coluna de uma tabela.
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
