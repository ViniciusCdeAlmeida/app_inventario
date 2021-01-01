import 'dart:convert';

import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [Conexao] no banco de dados.
class ConexaoConverter extends TypeConverter<List<Conexao>, String> {
  const ConexaoConverter();

  /// Responsável por converter a uma lista de [Conexao] de uma tabela para o modelo [Conexao].
  @override
  List<Conexao> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var caracteristicasJson = json.decode(fromDb);

    return (caracteristicasJson as List)
        .map((i) => Conexao.fromJson(i))
        .toList();
  }

  /// Responsável por salvar [Conexao] do json para a coluna de uma tabela.
  @override
  String mapToSql(List<Conexao> caracteristicasDetails) {
    if (caracteristicasDetails.isEmpty) {
      return null;
    }
    return json.encode(
        caracteristicasDetails.map((details) => details.toJson()).toList());
  }
}
