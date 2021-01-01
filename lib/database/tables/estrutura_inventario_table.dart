import 'package:GRPInventario/database/converters/index_converters.dart';
import 'package:moor/moor.dart';

/// Responsável por criar a tabela [EstruturaInventarioDB] e seus campos no banco de dados.
class EstruturaInventarioDB extends Table {
  IntColumn get id => integer()();
  IntColumn get idInventario => integer().nullable()();
  TextColumn get dominioStatusInventarioEstrutura =>
      text().map(const DominioConverter()).nullable()();
  TextColumn get estruturaOrganizacional =>
      text().map(const OrganizacaoConverter()).nullable()();
}
