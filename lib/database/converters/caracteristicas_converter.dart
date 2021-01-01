import 'dart:convert';
import 'package:GRPInventario/models/index_models.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// Responsável por salvar o objeto [Caracteristicas] no banco de dados.
class CaracteristicasConverter
    extends TypeConverter<List<Caracteristicas>, String> {
  const CaracteristicasConverter();

  /// Responsável por converter a uma lista de [Caracteristicas] de uma tabela para o modelo [Caracteristicas].
  @override
  List<Caracteristicas> mapToDart(String fromDb) {
    if (fromDb == null) return null;
    var caracteristicasJson = json.decode(fromDb);

    return (caracteristicasJson as List)
        .map((i) => Caracteristicas.fromJson(i))
        .toList();
  }

  /// Responsável por salvar [Caracteristicas] do json para a coluna de uma tabela.
  @override
  String mapToSql(List<Caracteristicas> caracteristicasDetails) {
    if (caracteristicasDetails.isEmpty) {
      return null;
    }
    return json.encode(
        caracteristicasDetails.map((details) => details.toJson()).toList());
  }
}
