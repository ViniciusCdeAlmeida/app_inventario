import 'package:moor/moor.dart';

class PrefixoDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get prefixo => text().nullable()();
}
