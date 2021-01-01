import 'package:moor/moor.dart';

/// Responsável por criar a tabela [PrefixoDB] e seus campos no banco de dados.
class PrefixoDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get prefixo => text().nullable()();
}
