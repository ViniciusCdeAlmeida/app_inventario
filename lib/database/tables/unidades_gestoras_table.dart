import 'package:GRPInventario/database/converters/index_converters.dart';
import 'package:moor/moor.dart';

/// Responsável por criar a tabela [UnidadesGestorasDB] e seus campos no banco de dados.
class UnidadesGestorasDB extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get organizacao =>
      text().map(const OrganizacaoConverter()).nullable()();
}
