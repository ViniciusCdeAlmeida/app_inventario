import 'package:moor/moor.dart';

/// Responsável por criar a tabela [DominioDB] e seus campos no banco de dados.
class DominioDB extends Table {
  IntColumn get id => integer()();
  TextColumn get nome => text()();
  TextColumn get descricao => text()();
  TextColumn get chave => text()();
  IntColumn get codigo => integer()();
}
