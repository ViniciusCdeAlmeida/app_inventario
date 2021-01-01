import 'package:GRPInventario/database/converters/index_converters.dart';
import 'package:moor/moor.dart';

/// Responsável por criar a tabela [UsuarioDB] e seus campos no banco de dados.
class UsuarioDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().nullable()();
  TextColumn get organizacoes =>
      text().map(const OrganizacoesConverter()).nullable()();
}
