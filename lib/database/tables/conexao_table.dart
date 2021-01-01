import 'package:moor/moor.dart';

/// Responsável por criar a tabela [ConexaoDB] e seus campos no banco de dados.
class ConexaoDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().nullable()();
  TextColumn get url => text().nullable()();
  BoolColumn get ativo => boolean().nullable()();
}
