
import 'package:moor/moor.dart';

class DominioDB extends Table {
  IntColumn get id => integer()();
  TextColumn get nome => text()();
  TextColumn get descricao => text()();
  TextColumn get chave => text()();
  IntColumn get codigo => integer()();
}