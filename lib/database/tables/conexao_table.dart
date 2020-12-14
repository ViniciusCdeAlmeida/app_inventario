import 'package:moor/moor.dart';

class ConexaoDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().nullable()();
  TextColumn get url => text().nullable()();
  BoolColumn get ativo => boolean().nullable()();
}
